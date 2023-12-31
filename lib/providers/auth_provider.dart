import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';

class AuthProviderApp extends ChangeNotifier {
  bool obscureText = true;
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passController;
  void init() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  void providerDispose() {
    emailController.dispose();
    passController.dispose();
  }

  void toggleObscure() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<void> logIn(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        if (credential.user != null) {
          if (context.mounted) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Log In Completed Successfully!',
            );
          }
          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          if (context.mounted) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Oops...',
              text: 'Sorry, user not found',
            );
          }

        } else if (e.code == 'wrong-password') {
          if (context.mounted) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Oops...',
              text: 'Sorry, wrong password',
            );
          }
        }
      }
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        var credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        if (credential.user != null) {
          if (context.mounted) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Sign Up Completed Successfully!',
            );
          }
          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LogInScreen(),
              ),
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        if(e.code == 'email-already-in-use'){
          if (context.mounted) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.warning,
              text: 'Email already in use',
            );
          }
        }else if(e.code == 'weak-password'){
          if (context.mounted) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.warning,
              text: 'Weak Password',
            );
          }
        }
      }
    }
  }
  Future<void> signOut(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      await QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Sign Out Completed Successfully!',
      );
    }
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreen(),
        ),
      );
    }
  }
}