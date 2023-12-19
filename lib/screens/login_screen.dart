import 'package:auth_first_step_shopify/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/button_widget.dart';
import '../widgets/email_field_widget.dart';
import '../widgets/pass_field_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    Provider.of<AuthProviderApp>(context, listen: false).init();
    super.initState();
  }

  @override
  void deactivate() {
    Provider.of<AuthProviderApp>(context, listen: false).providerDispose();
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviderApp>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Form(
                  key: value.formKey,
                  child: Column(
                    children: [
                      EmailFieldWidget(
                        isFirst: true,
                        isLast: false,
                        controller: value.emailController,
                      ),
                      PassFieldWidget(
                        isFirst: false,
                        isLast: true,
                        controller: value.passController,
                        onTap: value.toggleObscure,
                        con: value.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        obstxt: value.obscureText,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonWidget(
                        txt: 'LOG IN',
                        onTap: () async {
                          await value.logIn(context);
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 231,
                        height: 50,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Don’t have an account? Swipe right to ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff515c6f),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                              },
                              child: Text(
                                'create a new account.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xffff6969),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
