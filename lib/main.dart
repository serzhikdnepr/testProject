import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/router/router.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appRouter = ref.watch(appRouterProvider);
    return MaterialApp(
      title: 'My Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        locale: const Locale('en'),
        supportedLocales: S.delegate.supportedLocales,
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: widget!,
          );
        },
        routerDelegate: appRouter.delegate(
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        routeInformationProvider: appRouter.routeInfoProvider(),
        routeInformationParser:
            appRouter.defaultRouteParser(includePrefixMatches: true),
      ),
    );
  }
}
