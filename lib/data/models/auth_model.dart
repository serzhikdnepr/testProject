import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/main.dart';
import 'package:test_project/utils/utils.dart';

import '../../generated/l10n.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChange => _auth.authStateChanges();
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext ctx) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if(ctx.mounted) {
        showDialog(
        context: ctx,useRootNavigator: false,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child:   Text(S.current.ok))
          ],
        ),
      );
      }
    }
  }

  // SignUp the user using Email and Password
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if(context.mounted) {
        showDialog(
          context: context,useRootNavigator: false,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(S.current.ok))
                  ]));
      }
    } catch (e) {
      if (e == 'email-already-in-use') {
        if(context.mounted) {
          showDialog(
              context: context,useRootNavigator: false,
              builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: const Text("email-already-in-use"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(S.current.ok))
                  ]));
        }
      } else {
        if(context.mounted) {
          showDialog(
              context: context,useRootNavigator: false,
              builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content:   Text('Error: $e'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(S.current.ok))
                  ]));
        }
        // print('Error: $e');
      }
    }
  }



  //  SignOut the current user
  Future<void> signOut() async {
    prefs.setBool(AppKeys.isUserRegister, false);
    await _auth.signOut();
  }
}
