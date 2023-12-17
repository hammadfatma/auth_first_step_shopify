// import 'package:auth_first_step_shopify/screens/forgot_password_screen.dart';
// import 'package:auth_first_step_shopify/screens/login_screen.dart';
// import 'package:auth_first_step_shopify/screens/signup_screen.dart';
// import 'package:flutter/material.dart';
//
// class MasterScreen extends StatelessWidget {
//   const MasterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Color(0xffF5F6F8),
//         body: Column(
//           children: [
//             Theme(
//               data: Theme.of(context).copyWith(
//                 colorScheme: Theme.of(context)
//                     .colorScheme
//                     .copyWith(surfaceVariant: Colors.transparent),
//               ),
//               child: TabBar(
//                 unselectedLabelColor: Color(0xff515c6f).withOpacity(0.200),
//                 labelColor: Color(0xff515c6f),
//                 indicator: BoxDecoration(),
//                 tabs: [
//                   Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Log In',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Forgot Password',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   SignUpScreen(),
//                   LogInScreen(),
//                   ForgotPasswordScreen(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
