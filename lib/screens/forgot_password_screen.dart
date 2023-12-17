// import 'package:flutter/material.dart';
//
// import '../widgets/button_widget.dart';
// import '../widgets/txtfield_widget.dart';
//
// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: 297,
//           height: 61,
//           child: Text(
//             'Enter the email address you used to create your account and we will email you a link to reset your password',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w300,
//               color: Color(0xff515c6f),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 50,
//         ),
//         TxtFieldWidget(
//           isFirst: true,
//           isLast: true,
//           txt: 'EMAIL',
//           con: Icons.email_outlined,
//           obstxt: false,
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         ButtonWidget(txt: 'SEND EMAIL', onTap: () {},),
//       ],
//     );
//   }
// }
