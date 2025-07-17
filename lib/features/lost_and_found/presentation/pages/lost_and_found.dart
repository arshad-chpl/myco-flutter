// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:myco_flutter/constants/app_assets.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';
// import 'package:myco_flutter/core/theme/colors.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/pages/add_screen.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/pages/item_details_screen.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_inner_shadow.dart';
// import 'package:myco_flutter/widgets/custom_appbar.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';
// import 'package:myco_flutter/widgets/custom_text_field.dart';
// import 'package:myco_flutter/widgets/floating_action_btn.dart';
// import '../../model/lost_and_found_item_model.dart';
//
// class LostAndFound extends StatefulWidget {
//   const LostAndFound({super.key});
//
//   @override
//   State<LostAndFound> createState() => _LostAndFoundState();
// }
//
// class _LostAndFoundState extends State<LostAndFound> {
//   final List<LostAndFoundItemModel> lostFoundItems = [];
//
//   void _navigateToAddScreen() async {
//     final result =
//         await
//         // context.pushNamed("/lost-and-found-add-screen");
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const LostAndFoundAddScreen(),
//           ),
//         );
//     if (result != null && result is LostAndFoundItemModel) {
//       setState(() {
//         lostFoundItems.add(result);
//       });
//     }
//   }
//
//   String _searchQuery = '';
//
//   List<LostAndFoundItemModel> get _filteredItems {
//     if (_searchQuery.isEmpty) return lostFoundItems;
//     return lostFoundItems
//         .where(
//           (item) =>
//               item.name.toLowerCase().contains(_searchQuery.toLowerCase()),
//         )
//         .toList();
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: CustomAppbar(
//       automaticallyImplyLeading: false,
//       title: CustomText(
//         isKey: true,
//         'lost_found',
//         fontSize: 18 * Responsive.getResponsiveText(context),
//         fontWeight: FontWeight.w700,
//       ),
//       centerTitle: false,
//       elevation: 0,
//     ),
//     body: Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: 28 * Responsive.getResponsive(context),
//       ),
//       child: Column(
//         children: [
//           MyCoTextfield(
//             height: .044 * Responsive.getHeight(context),
//             isSuffixIconOn: false,
//             prefix: SvgPicture.asset(
//               AppAssets.searchNormal,
//               fit: BoxFit.scaleDown,
//             ),
//             // preFixImage: AppAssets.searchNormal,
//             contentPadding: EdgeInsets.all(
//               9 * Responsive.getResponsive(context),
//             ),
//             hintText: 'search',
//             fillColor: Colors.white,
//             color: Colors.white,
//             boarderRadius: 12,
//             hintTextStyle: _hintStyle(context),
//
//             onChanged: (val) {
//               setState(() {
//                 _searchQuery = val;
//               });
//             },
//           ),
//
//           SizedBox(height: .024 * Responsive.getHeight(context)),
//           Expanded(
//             child: GridView.builder(
//               itemCount: _filteredItems.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//
//               itemBuilder: (context, index) {
//                 final item = _filteredItems[index];
//                 final formattedDate = DateFormat(
//                   'dd MMM yyyy (EEE)',
//                 ).format(item.dateTime);
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
//                     height: .0150 * Responsive.getHeight(context),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
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
//                           borderRadius: BorderRadius.circular(15),
//                           child: Stack(
//                             children: [
//                               Image.file(
//                                 item.image,
//                                 width: double.infinity,
//                                 height: .095 * Responsive.getHeight(context),
//                                 fit: BoxFit.cover,
//                               ),
//                               Positioned(
//                                 top: 8,
//                                 right: 8,
//                                 child: InnerShadowContainer(
//                                   backgroundColor: item.status == 'found'
//                                       ? AppTheme.getColor(context).secondary
//                                       : const Color(0xffDD4646),
//                                   height: .017 * Responsive.getHeight(context),
//                                   width: .086 * Responsive.getWidth(context),
//                                   borderRadius: 50,
//                                   isShadowBottomLeft: true,
//                                   child: CustomText(
//                                     item.status,
//                                     isKey: true,
//                                     fontSize:
//                                         10 * Responsive.getResponsive(context),
//                                     fontWeight: FontWeight.w500,
//                                     color: AppColors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Expanded(
//                         //   child:
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
//                           child: CustomText(
//                             isKey: true,
//                             item.name,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             fontWeight: FontWeight.w600,
//                             fontSize:
//                                 16 * Responsive.getResponsiveText(context),
//                             color: AppColors.textPrimary,
//                           ),
//                         ),
//                         // ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(14, 0, 8, 12),
//                           child: CustomText(
//                             formattedDate,
//                             fontWeight: FontWeight.w400,
//                             fontSize:
//                                 12 * Responsive.getResponsiveText(context),
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
//     floatingActionButton: GestureDetector(
//       onTap: _navigateToAddScreen,
//       // _navigateToAddScreen,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           // color: AppColors.red,
//         ),
//         height: .063 * Responsive.getHeight(context),
//         width: .063 * Responsive.getHeight(context),
//         child: SvgPicture.asset(AppAssets.vector, fit: BoxFit.fill),
//       ),
//     ),
//     // floatingActionButton: ExpandableFab(
//     //   openIcon: Icons.add,
//     //   closeIcon: Icons.close,
//     //   actions: [
//     //     ExpandableFabAction(
//     //       label: 'Camera',
//     //       icon: Icons.camera_alt,
//     //       onTap: () {
//     //         debugPrint('Camera Tapped');
//     //       },
//     //     ),
//     //     ExpandableFabAction(
//     //       label: 'Gallery',
//     //       iconPath: 'assets/icons/gallery.png', // use your image path
//     //       onTap: () {
//     //         debugPrint('Gallery Tapped');
//     //       },
//     //     ),
//     //   ],
//     // ),
//     // MyCoButton(
//     //   boarderRadius: 50,
//     //   isShadowBottomLeft: true,
//     //   onTap: _navigateToAddScreen,
//     //   title: '',
//     //   image: Icon(
//     //     Icons.add,
//     //     color: AppColors.white,
//     //     size: .070 * Responsive.getWidth(context),
//     //   ),
//     //   backgroundColor: AppColors.primary,
//     //   height: .063 * Responsive.getHeight(context),
//     //   width: .063 * Responsive.getHeight(context),
//     // ),
//   );
//
//   TextStyle _hintStyle(BuildContext context) => TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14 * Responsive.getResponsiveText(context),
//     color: Colors.black54,
//   );
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/bloc/lost_and_found_bloc.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/bloc/lost_and_found_event.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/bloc/lost_and_found_state.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_inner_shadow.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_loader.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class LostAndFound extends StatefulWidget {
  const LostAndFound({super.key});

  @override
  State<LostAndFound> createState() => _LostAndFoundState();
}

class _LostAndFoundState extends State<LostAndFound> {
  String _searchQuery = '';
  @override
  void initState() {
    super.initState();
    context.read<LostAndFoundBloc>().add(
      const GetLostAndFoundItemsEvent({
        'getListNew': 'getListNew',
        'society_id': '1',
        'user_id': '10',
        'language_id': '1',
        'lost_found_master_id': '',
        'is_details_view': 0,
      }),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(
      automaticallyImplyLeading: false,
      title: 'lost_found',

      // CustomText(
      //   isKey: true,
      //   'lost_found',
      //   fontSize: 18 * Responsive.getResponsiveText(context),
      //   fontWeight: FontWeight.w700,
      // ),
      centerTitle: false,
      elevation: 0,
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 28 * Responsive.getResponsive(context),
      ),
      child: Column(
        children: [
          MyCoTextfield(
            height: .044 * Responsive.getHeight(context),
            isSuffixIconOn: false,
            prefix: SvgPicture.asset(AppAssets.search, fit: BoxFit.scaleDown),
            contentPadding: EdgeInsets.all(
              9 * Responsive.getResponsive(context),
            ),
            hintText: 'search',
            fillColor: Colors.white,
            color: Colors.white,
            boarderRadius: 12,
            hintTextStyle: _hintStyle(context),
            typingtextStyle: _typingStyle(context),
            onChanged: (val) {
              setState(() {
                _searchQuery = val;
              });
            },
          ),
          SizedBox(height: .024 * Responsive.getHeight(context)),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                onRefresh:
                () async {
                  context.read<LostAndFoundBloc>().add(
                    const GetLostAndFoundItemsEvent({
                      'getListNew': 'getListNew',
                      'society_id': '1',
                      'user_id': '10',
                      'language_id': '1',
                      'lost_found_master_id': '',
                      'is_details_view': 0,
                    }),
                  );
                };
              },
              child: BlocBuilder<LostAndFoundBloc, LostAndFoundState>(
                builder: (context, state) {
                  if (state is LostAndFoundLoading) {
                    return const CustomLoader(); // 🔄 Replaced loader
                  }

                  if (state is LostAndFoundError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is LostAndFoundLoaded) {
                    final items = state.items;
                    final filteredItems = _searchQuery.isEmpty
                        ? items
                        : items
                              .where(
                                (item) =>
                                    item.lostFoundTitle?.toLowerCase().contains(
                                      _searchQuery.toLowerCase(),
                                    ) ??
                                    false,
                              )
                              .toList();

                    if (filteredItems.isEmpty) {
                      return const Center(child: Text("No items found."));
                    }
                    return GridView.builder(
                      itemCount: filteredItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        final isFound = item.lostFoundTypeInt == '0';
                        final statusLabel = isFound ? 'Found' : 'Lost';
                        final statusColor = isFound
                            ? AppTheme.getColor(context).secondary
                            : AppTheme.getColor(context).error;

                        final formattedDate = DateFormat('dd MMM yyyy (EEE)')
                            .format(
                              DateTime.tryParse(item.lostFoundDate ?? '') ??
                                  DateTime.now(),
                            );

                        return GestureDetector(
                          onTap: () {
                            // Handle item details navigation
                          },
                          child: Container(
                            height: .150 * Responsive.getHeight(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.primary,
                                width: 0.75,
                              ),
                              color: AppTheme.getColor(
                                context,
                              ).surfaceContainer,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withAlpha(1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height:
                                            0.120 *
                                            Responsive.getHeight(context),
                                        width: double.infinity,
                                        child: Builder(
                                          builder: (context) {
                                            final imageUrl =
                                                item.lostFoundImage;

                                            if (imageUrl == null ||
                                                imageUrl.isEmpty) {
                                              return Image.asset(
                                                AppAssets.myCoLogo,
                                                fit: BoxFit.contain,
                                              );
                                            }

                                            return CachedNetworkImage(
                                              imageUrl: imageUrl,
                                              // child: Image.network(
                                              //   imageUrl,
                                              //   fit: BoxFit.cover,
                                              fit: BoxFit.cover,

                                              errorWidget:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => SvgPicture.asset(
                                                    AppAssets.myCoLogo,
                                                  ),
                                              // ),
                                            );
                                          },
                                        ),
                                      ),

                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: InnerShadowContainer(
                                          backgroundColor: statusColor,
                                          height:
                                              .017 *
                                              Responsive.getHeight(context),
                                          width:
                                              .086 *
                                              Responsive.getWidth(context),
                                          borderRadius: 50,
                                          isShadowBottomLeft: true,
                                          child: CustomText(
                                            statusLabel,
                                            isKey: true,
                                            fontSize:
                                                10 *
                                                Responsive.getResponsive(
                                                  context,
                                                ),
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    14,
                                    12,
                                    8,
                                    3,
                                  ),
                                  child: CustomText(
                                    isKey: true,
                                    item.lostFoundTitle ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        16 *
                                        Responsive.getResponsiveText(context),
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    14,
                                    0,
                                    8,
                                    5,
                                  ),
                                  child: CustomText(
                                    formattedDate,
                                    fontSize:
                                        12 *
                                        Responsive.getResponsiveText(context),
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),

          // Expanded(
          //   child: RefreshIndicator(
          //     onRefresh: () async {
          //       context.read<LostAndFoundBloc>().add(
          //         const GetLostAndFoundItemsEvent({
          //           'getListNew': 'getListNew',
          //           'society_id': '1',
          //           'user_id': '10',
          //           'language_id': '1',
          //           'lost_found_master_id': '',
          //           'is_details_view': 0,
          //         }),
          //       );
          //     },
          //     child: BlocBuilder<LostAndFoundBloc, LostAndFoundState>(
          //       builder: (context, state) {
          //         if (state is LostAndFoundLoading) {
          //           return const CustomLoader(); // 🔄 Replaced loader
          //         }
          //
          //         if (state is LostAndFoundError) {
          //           return Center(child: Text(state.message));
          //         }
          //
          //         if (state is LostAndFoundLoaded) {
          //           final items = state.items;
          //           final filteredItems = _searchQuery.isEmpty
          //               ? items
          //               : items
          //               .where(
          //                 (item) =>
          //             item.lostFoundTitle?.toLowerCase().contains(
          //               _searchQuery.toLowerCase(),
          //             ) ??
          //                 false,
          //           )
          //               .toList();
          //
          //           if (filteredItems.isEmpty) {
          //             return const Center(child: Text("No items found."));
          //           }
          //
          //           return GridView.builder(
          //             physics: const AlwaysScrollableScrollPhysics(),
          //             itemCount: filteredItems.length,
          //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisCount: 2,
          //               crossAxisSpacing: 16,
          //               mainAxisSpacing: 16,
          //             ),
          //             itemBuilder: (context, index) {
          //               final item = filteredItems[index];
          //               // ... unchanged itemBuilder code
          //               return ...;
          //             },
          //           );
          //         }
          //
          //         return const SizedBox.shrink();
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
    floatingActionButton: GestureDetector(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        height: .063 * Responsive.getHeight(context),
        width: .063 * Responsive.getHeight(context),
        child: SvgPicture.asset(AppAssets.vector, fit: BoxFit.fill),
      ),
    ),
  );

  TextStyle _hintStyle(BuildContext context) => TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
    fontSize: 14 * Responsive.getResponsiveText(context),
    color: Colors.black54,
  );
  TextStyle _typingStyle(BuildContext context) => TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w600,
    fontSize: 14 * Responsive.getResponsiveText(context),
    color: AppColors.textPrimary,
  );
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:myco_flutter/constants/app_assets.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';
// import 'package:myco_flutter/core/theme/colors.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/pages/add_screen.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/pages/item_details_screen.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_inner_shadow.dart';
// import 'package:myco_flutter/widgets/custom_appbar.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';
// import 'package:myco_flutter/widgets/custom_text_field.dart';
//
// class LostAndFound extends StatefulWidget {
//   const LostAndFound({super.key});
//
//   @override
//   State<LostAndFound> createState() => _LostAndFoundState();
// }
//
// class _LostAndFoundState extends State<LostAndFound> {
//   final List<LostAndFoundItemModel> lostFoundItems = [];
//
//   void _navigateToAddScreen() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const LostAndFoundAddScreen()),
//     );
//     if (result != null && result is LostAndFoundItemModel) {
//       setState(() {
//         lostFoundItems.add(result);
//       });
//     }
//   }
//
//   String _searchQuery = '';
//
//   List<LostAndFoundItemModel> get _filteredItems {
//     if (_searchQuery.isEmpty) return lostFoundItems;
//     return lostFoundItems
//         .where(
//           (item) =>
//               item.name.toLowerCase().contains(_searchQuery.toLowerCase()),
//         )
//         .toList();
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: CustomAppbar(
//       automaticallyImplyLeading: false,
//       title: CustomText(
//         isKey: true,
//         'lost_found',
//         fontSize: 18 * Responsive.getResponsiveText(context),
//         fontWeight: FontWeight.w700,
//       ),
//       centerTitle: false,
//       elevation: 0,
//     ),
//     body: Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: 28 * Responsive.getResponsive(context),
//       ),
//       child: Column(
//         children: [
//           MyCoTextfield(
//             height: .044 * Responsive.getHeight(context),
//             isSuffixIconOn: false,
//             prefix: SvgPicture.asset(
//               AppAssets.searchNormal,
//               fit: BoxFit.scaleDown,
//             ),
//             contentPadding: EdgeInsets.all(
//               9 * Responsive.getResponsive(context),
//             ),
//             hintText: 'search',
//             fillColor: Colors.white,
//             color: Colors.white,
//             boarderRadius: 12,
//             hintTextStyle: _hintStyle(context),
//             onChanged: (val) {
//               setState(() {
//                 _searchQuery = val;
//               });
//             },
//           ),
//           SizedBox(height: .024 * Responsive.getHeight(context)),
//           Expanded(
//             child: GridView.builder(
//               itemCount: _filteredItems.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 16,
//                 mainAxisSpacing: 16,
//               ),
//               itemBuilder: (context, index) {
//                 final item = _filteredItems[index];
//                 final isFound = item.status.toString() == '0';
//                 final statusLabel = isFound ? 'Found' : 'Lost';
//                 final statusColor = isFound
//                     ? AppTheme.getColor(context).secondary
//                     : AppTheme.getColor(context).error;
//
//                 final formattedDate = DateFormat(
//                   'dd MMM yyyy (EEE)',
//                 ).format(item.dateTime);
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
//                     height: .150 * Responsive.getHeight(context),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(color: AppColors.primary, width: 0.75),
//                       color: AppTheme.getColor(context).surfaceContainer,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withAlpha(1),
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
//                           borderRadius: BorderRadius.circular(15),
//                           child: Stack(
//                             children: [
//                               Image.file(
//                                 item.image,
//                                 width: double.infinity,
//                                 height: .120 * Responsive.getHeight(context),
//                                 fit: BoxFit.cover,
//                               ),
//                               Positioned(
//                                 top: 8,
//                                 right: 8,
//                                 child: InnerShadowContainer(
//                                   backgroundColor: statusColor,
//                                   height: .017 * Responsive.getHeight(context),
//                                   width: .086 * Responsive.getWidth(context),
//                                   borderRadius: 50,
//                                   isShadowBottomLeft: true,
//                                   child: CustomText(
//                                     statusLabel,
//                                     isKey: true,
//                                     fontSize:
//                                         10 * Responsive.getResponsive(context),
//                                     fontWeight: FontWeight.w500,
//                                     color: AppColors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(14, 12, 8, 3),
//                           child: CustomText(
//                             isKey: true,
//                             item.name,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             fontWeight: FontWeight.w600,
//                             fontSize:
//                                 16 * Responsive.getResponsiveText(context),
//                             color: AppColors.textPrimary,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(14, 0, 8, 5),
//                           child: CustomText(
//                             formattedDate,
//                             fontSize:
//                                 12 * Responsive.getResponsiveText(context),
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
//     floatingActionButton: GestureDetector(
//       onTap: _navigateToAddScreen,
//       child: Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
//         height: .063 * Responsive.getHeight(context),
//         width: .063 * Responsive.getHeight(context),
//         child: SvgPicture.asset(AppAssets.vector, fit: BoxFit.fill),
//       ),
//     ),
//   );
//
//   TextStyle _hintStyle(BuildContext context) => TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14 * Responsive.getResponsiveText(context),
//     color: Colors.black54,
//   );
// }
