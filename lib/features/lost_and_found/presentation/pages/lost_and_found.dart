// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';
// import 'package:myco_flutter/core/theme/colors.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/pages/add_screen.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_inner_shadow.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';
// import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/pages/item_details_screen.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';
//
// class LostAndFound extends StatefulWidget {
//   const LostAndFound({super.key});
//
//   @override
//   State<LostAndFound> createState() => _LostAndFoundState();
// }
//
// class _LostAndFoundState extends State<LostAndFound> {
//   final List<Map<String, dynamic>> lostFoundItems = [];
//
//   void _navigateToAddScreen() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const LostAndFoundAddScreen()),
//     );
//
//     if (result != null && result is Map<String, dynamic>) {
//       setState(() {
//         lostFoundItems.add(result);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       title: Row(
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               // color: AppTheme.getColor(context).onPrimaryFixedVariant,
//             ),
//             onPressed: () => Navigator.pop(context),
//           ),
//           CustomText(
//             'Lost & Found',
//
//             fontSize: 18 * Responsive.getResponsive(context),
//             fontWeight: FontWeight.w700,
//           ),
//         ],
//       ),
//       centerTitle: false,
//       elevation: 0,
//     ),
//     body: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
//       child: Column(
//         children: [
//           MyCoTextField(
//             isSuffixIconOn: false,
//
//             preFixImage: 'assets/lost_and_found/search-normal.png',
//             iconHeight: 30,
//             iconWidth: 30,
//             // prefix: Image.asset('assets/lost_and_found/search-normal.png'),
//             hintText: 'Search',
//             fillColor: Colors.white,
//             color: Colors.white,
//             boarderRadius: 12,
//             hintTextStyle: _hintStyle(context),
//             height: 44,
//             // maxLenght: 1,
//           ),
//           const SizedBox(height: 24),
//           Expanded(
//             child: GridView.builder(
//               itemCount: lostFoundItems.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemBuilder: (context, index) {
//                 final item = lostFoundItems[index];
//                 final image = item['image'] as File;
//                 final name = item['name'] ?? '';
//                 final status = item['status'] ?? 'Lost';
//
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ItemDetailsScreen(item: item),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     height: 150,
//                     width: 155,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: AppColors.primary, width: 0.75),
//                       color: AppTheme.getColor(context).surfaceContainer,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           blurRadius: 6,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Stack(
//                                 children: [
//                                   Image.file(
//                                     image,
//                                     width: double.infinity,
//                                     height: 95,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   Positioned(
//                                     top: 8,
//                                     right: 8,
//                                     child: InnerShadowContainer(
//                                       backgroundColor: status == 'Found'
//                                           ? AppTheme.getColor(context).secondary
//                                           : const Color(0xffDD4646),
//                                       height: 17,
//                                       width: 46,
//                                       border: null,
//                                       borderRadius: 50,
//                                       isShadowBottomLeft: true,
//                                       child: CustomText(
//                                         status,
//                                         fontSize: 10 * Responsive.getResponsive(context),
//                                         fontWeight: FontWeight.w500,
//                                         color: AppColors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
//                             child: CustomText(
//                               name,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16 * Responsive.getResponsive(context),
//                               color: AppColors.textPrimary,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(14, 0, 8, 12),
//                           child: CustomText(
//                             DateFormat(
//                               'dd MMM yyyy (EEE)',
//                             ).format(DateTime.now()),
//                             fontWeight: FontWeight.w400,
//                             fontSize: 12 * Responsive.getResponsive(context),
//                             color: AppColors.textPrimary,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//     floatingActionButton: MyCoButton(
//       boarderRadius: 50,
//       isShadowBottomLeft: true,
//       onTap: _navigateToAddScreen,
//       title: '',
//       image: const Icon(Icons.add, color: Colors.white, size: 40, weight: 50),
//       backgroundColor: AppColors.primary,
//       height: 63,
//       width: 63,
//     ),
//   );
//
//   TextStyle _hintStyle(BuildContext context) => const TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: Colors.black54,
//   );
//
//   TextStyle _typingStyle(BuildContext context) => TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: AppTheme.getColor(context).onSurface,
//   );
// }
// lost_and_found.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/add_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/item_details_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_inner_shadow.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import '../../model/lost_and_found_item_model.dart';

class LostAndFound extends StatefulWidget {
  const LostAndFound({super.key});

  @override
  State<LostAndFound> createState() => _LostAndFoundState();
}

class _LostAndFoundState extends State<LostAndFound> {
  final List<LostAndFoundItemModel> lostFoundItems = [];

  void _navigateToAddScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LostAndFoundAddScreen()),
    );

    if (result != null && result is LostAndFoundItemModel) {
      setState(() {
        lostFoundItems.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          CustomText(
            'Lost & Found',
            fontSize: 18 * Responsive.getResponsive(context),
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
      centerTitle: false,
      elevation: 0,
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          MyCoTextField(
            isSuffixIconOn: false,
            preFixImage: 'assets/lost_and_found/search-normal.png',
            iconHeight: 30,
            iconWidth: 30,
            hintText: 'Search',
            fillColor: Colors.white,
            color: Colors.white,
            boarderRadius: 12,
            hintTextStyle: _hintStyle(context),
            height: 44,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              itemCount: lostFoundItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final item = lostFoundItems[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailsScreen(item: item),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary, width: 0.75),
                      color: AppTheme.getColor(context).surfaceContainer,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Image.file(
                                item.image,
                                width: double.infinity,
                                height: 95,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: InnerShadowContainer(
                                  backgroundColor: item.status == 'Found'
                                      ? AppTheme.getColor(context).secondary
                                      : const Color(0xffDD4646),
                                  height: 17,
                                  width: 46,
                                  borderRadius: 50,
                                  isShadowBottomLeft: true,
                                  child: CustomText(
                                    item.status,
                                    fontSize:
                                        10 * Responsive.getResponsive(context),
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
                            child: CustomText(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                              fontSize: 16 * Responsive.getResponsive(context),
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 0, 8, 12),
                          child: CustomText(
                            DateFormat(
                              'dd MMM yyyy (EEE)',
                            ).format(DateTime.now()),
                            fontWeight: FontWeight.w400,
                            fontSize: 12 * Responsive.getResponsive(context),
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: MyCoButton(
      boarderRadius: 50,
      isShadowBottomLeft: true,
      onTap: _navigateToAddScreen,
      title: '',
      image: const Icon(Icons.add, color: Colors.white, size: 40),
      backgroundColor: AppColors.primary,
      height: 63,
      width: 63,
    ),
  );

  TextStyle _hintStyle(BuildContext context) => const TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black54,
  );
}

// ============================= responsive.dart =============================

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:new_myco/custom_widgets/custom_inner_shadow.dart';
// import 'package:new_myco/custom_widgets/new_myco_button.dart';
// import 'package:new_myco/custom_widgets/text_field.dart';
// import 'package:new_myco/lost_and_found/add_screen.dart';
// import '../themes_colors/colors.dart';
// import '../custom_widgets/responsive.dart';
// import 'item_details_screen.dart';
//
// class LostAndFound extends StatefulWidget {
//   const LostAndFound({super.key});
//
//   @override
//   State<LostAndFound> createState() => _LostAndFoundState();
// }
//
// class _LostAndFoundState extends State<LostAndFound> {
//   final List<Map<String, dynamic>> lostFoundItems = [];
//
//   void _navigateToAddScreen() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const LostAndFoundAddScreen()),
//     );
//
//     if (result != null && result is Map<String, dynamic>) {
//       setState(() {
//         lostFoundItems.add(result);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double res = Responsive.getResponsive(context);
//
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBackgroundColor,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: AppColors.subTitleColor),
//           onPressed: () => Navigator.pop(context),
//         ),
//         backgroundColor: AppColors.scaffoldBackgroundColor,
//         title: const Text(
//           "Lost & Found",
//           style: TextStyle(
//             fontFamily: "Gilroy-Bold",
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: AppColors.subTitleColor,
//           ),
//         ),
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 32 * res, vertical: 24 * res),
//         child: Column(
//           children: [
//             MyCoTextField(
//               isSuffixIconOn: false,
//               preFixImage: "assets/lost_and_found/search-normal.png",
//               hintText: "Search",
//               fillColor: Colors.white,
//               color: Colors.white,
//               boarderRadius: 12,
//               hintTextStyle: _hintStyle(context),
//               height: 44 * res,
//             ),
//             SizedBox(height: 24 * res),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: lostFoundItems.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16 * res,
//                   mainAxisSpacing: 16 * res,
//                   childAspectRatio:
//                       155 / 186, // to respect original card proportions
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = lostFoundItems[index];
//                   final image = item['image'] as File;
//                   final name = item['name'] ?? '';
//                   final status = item['status'] ?? 'Lost';
//
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ItemDetailsScreen(item: item),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       height: 150 * res,
//                       width: 155 * res,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12 * res),
//                         border: Border.all(
//                           color: AppColors.primary,
//                           width: 0.75,
//                         ),
//                         color: AppColors.imagePickerBg,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             blurRadius: 6,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10 * res),
//                             child: Stack(
//                               children: [
//                                 Image.file(
//                                   image,
//                                   width: double.infinity,
//                                   height: 95 * res,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 Positioned(
//                                   top: 8 * res,
//                                   right: 8 * res,
//                                   child: InnerShadowContainer(
//                                     backgroundColor: status == "Found"
//                                         ? AppColors.secondPrimary
//                                         : const Color(0xffDD4646),
//                                     height: 17 * res,
//                                     width: 46 * res,
//                                     border: null,
//                                     borderRadius: 50,
//                                     isShadowBottomLeft: true,
//                                     child: Text(
//                                       status,
//                                       style: const TextStyle(
//                                         fontFamily: "Inter",
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 10,
//                                         color: Color(0xFFFFFFFF),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.fromLTRB(
//                                 14 * res,
//                                 12 * res,
//                                 8 * res,
//                                 8 * res,
//                               ),
//                               child: Text(
//                                 name,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontFamily: "Gilroy-SemiBold",
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xFF101828),
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(
//                               14 * res,
//                               0,
//                               8 * res,
//                               12 * res,
//                             ),
//                             child: Text(
//                               DateFormat(
//                                 'dd MMM yyyy (EEE)',
//                               ).format(DateTime.now()),
//                               style: const TextStyle(
//                                 fontFamily: "Gilroy-Regular",
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xFF101828),
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: MyCoButton(
//         boarderRadius: 50,
//         isShadowBottomLeft: true,
//         onTap: _navigateToAddScreen,
//         title: '',
//         image: Icon(Icons.add, color: Colors.white, size: 40 * res),
//         backgroundColor: AppColors.primary,
//         height: 63 * res,
//         width: 63 * res,
//       ),
//     );
//   }
//
//   TextStyle _hintStyle(BuildContext context) => const TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: Colors.black54,
//   );
//
//   TextStyle _typingStyle(BuildContext context) => TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: AppColors.textFieldColor,
//   );
// }
