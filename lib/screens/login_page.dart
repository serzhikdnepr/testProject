import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:test_project/main.dart';
import 'package:test_project/utils/utils.dart';
import 'package:test_project/widgets/widgets.dart';

import '../generated/l10n.dart';
import '../providers/auth_provider.dart';
import '../router/router.dart';
import '../router/router.gr.dart';

enum Status {
  login,
  signUp,
}

Status type = Status.login;

//  I have used stateful widget to use setstate functions in LoginPage
//  we could also managed the state using Riverpod but I am not using it here
//  Remember Stateful widgets are made for a reason. If it would be bad
//  flutter developer would not think of it in the first place.

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  //  A loading variable to show the loading animation when you a function is ongoing
  bool _isLoading = false;

  void loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _switchType() {
    if (type == Status.signUp) {
      setState(() {
        type = Status.login;
      });
    } else {
      setState(() {
        type = Status.signUp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer(builder: (context, ref, _) {
          final auth = ref.watch(authenticationProvider);
          final authState = ref.watch(authStateProvider);
          if (authState.value != null) {
            prefs.setBool(AppKeys.isUserRegister, true);
            ref.read(appRouterProvider).replaceAll([const MainPage()]);
          }
          Future<void> onPressedFunction() async {
            if (!_fbKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
              return;
            }
            if (type == Status.login) {
              loading();
              await auth
                  .signInWithEmailAndPassword(
                      _email.text, _password.text, context)
                  .whenComplete(
                      () => auth.authStateChange.listen((event) async {
                            if (event == null) {
                              if (context.mounted) {
                                loading();
                                return;
                              }
                            }
                          }));
            } else {
              loading();
              await auth
                  .signUpWithEmailAndPassword(
                      _email.text, _password.text, context)
                  .whenComplete(
                      () => auth.authStateChange.listen((event) async {
                            if (event == null) {
                              loading();
                              return;
                            }
                          }));
            }
          }

          return FormBuilder(
            key: _fbKey,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(top: 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: FlutterLogo(size: 81)),
                        const Spacer(flex: 1),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: FormBuilderTextField(
                            name: "email",
                            controller: _email,
                            autocorrect: true,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: S.of(context).eMailAddress,
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: Colors.blue.shade700, size: 24),
                              alignLabelWithHint: true,
                              fillColor: Colors.black12,
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.email(),
                              FormBuilderValidators.required()
                            ]),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: FormBuilderTextField(
                            name: "password",
                            controller: _password,
                            obscureText: true,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.minLength(8),
                              FormBuilderValidators.required()
                            ]),
                            decoration: InputDecoration(
                              hintText: S.of(context).password,
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: Icon(CupertinoIcons.lock_circle,
                                  color: Colors.blue.shade700, size: 24),
                              alignLabelWithHint: true,
                              fillColor: Colors.black12,
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                            ),
                          ),
                        ),
                        if (type == Status.signUp)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: FormBuilderTextField(
                              name: "confirm_password",
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: S.of(context).confirm_password,
                                hintStyle:
                                    const TextStyle(color: Colors.black54),
                                prefixIcon: Icon(CupertinoIcons.lock_circle,
                                    color: Colors.blue.shade700, size: 24),
                                alignLabelWithHint: true,
                                fillColor: Colors.black12,
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                              ),
                              validator: FormBuilderValidators.compose([
                                if (type == Status.signUp)
                                  (String? val) {
                                    if ((val != null && val.isNotEmpty) &&
                                        _fbKey.currentState!.fields['password']!
                                                .value !=
                                            val) {
                                      return S.of(context).passwordsMismatch;
                                    }
                                    return null;
                                  }
                              ]),
                            ),
                          ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 32.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : GlobalBtn(
                                      text: type == Status.login
                                          ? S.of(context).login
                                          : S.of(context).register,
                                      onTap: onPressedFunction)),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: RichText(
                              text: TextSpan(
                                text: type == Status.login
                                    ? S.of(context).youDoNotHaveAnAccount
                                    : S.of(context).alreadyHaveAnAccount,
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: type == Status.login
                                          ? S.of(context).loginNow
                                          : S.of(context).login,
                                      style: TextStyle(
                                          color: Colors.blue.shade700),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          _switchType();
                                        })
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
