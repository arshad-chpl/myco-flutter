import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFB7CCE3),
                  Color(0xFFEFF9F7),
                  Color(0xFFD1F2EB),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BackButton(color: Colors.black),
                          const SizedBox(width: 4),
                          const Text(
                            "Manish Chandra",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.call_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                const Center(
                  child: Text(
                    "Start Chat",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
                  child: MyCoTextField(
                    controller: messageController,
                    boarderRadius: 50,
                    height: 50,
                    hintText: "Type Message",
                    hintTextStyle: TextStyle(
                      color: AppTheme.getColor(context).outline,
                    ),
                    isSuffixIconOn: true,
                    image1: "assets/lost_and_found/link.png",

                    image2: "assets/lost_and_found/send.png",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//====================================responsive==================================
//
// import 'package:flutter/material.dart';
// import '../custom_widgets/text_field.dart';
// import '../themes_colors/colors.dart';
// import '../custom_widgets/responsive.dart'; // Responsive utils
//
// class ChatScreen extends StatelessWidget {
//   final TextEditingController messageController = TextEditingController();
//
//   ChatScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double res = Responsive.getResponsive(context);
//
//     return Scaffold(
//       extendBody: true,
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color(0xFFB7CCE3),
//                   Color(0xFFEFF9F7),
//                   Color(0xFFD1F2EB),
//                 ],
//               ),
//             ),
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 12 * res,
//                     vertical: 8 * res,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           const BackButton(color: Colors.black),
//                           SizedBox(width: 4 * res),
//                           const Text(
//                             "Manish Chandra",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.call_outlined,
//                           color: Colors.black,
//                         ),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const Spacer(),
//
//                 const Center(
//                   child: Text(
//                     "Start Chat",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//
//                 const Spacer(),
//
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(12 * res, 0, 12 * res, 20 * res),
//                   child: MyCoTextField(
//                     controller: messageController,
//                     boarderRadius: 50,
//                     height: 50 * res,
//                     hintText: "Type Message",
//                     hintTextStyle: TextStyle(color: AppColors.borderColor),
//                     isSuffixIconOn: true,
//                     image1: "assets/lost_and_found/link.png",
//                     image2: "assets/lost_and_found/send.png",
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
