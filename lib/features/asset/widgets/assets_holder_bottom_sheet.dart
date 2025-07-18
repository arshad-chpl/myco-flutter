import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/widgets/custom_dash_line.dart';
import 'package:myco_flutter/features/asset/widgets/image_gredal.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Future<void> showAssetsHoldersBottomSheet({
  required BuildContext context,
  required String image,
  deviceName,
  brand,
  srNo,
  handover,
  handoverDate,
  takeoverDate,
  String? takeover,
  bool? notAssign,
  required List<String>? handoverImageList,
  takeoverImageList,
  historyImageList,
}) => showModalBottomSheet(
  context: context,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(20 * Responsive.getResponsive(context)),
    ),
  ),
  isScrollControlled: true,
  builder: (context) => SizedBox(
    height:
        0.7 * Responsive.getHeight(context) +
        MediaQuery.of(context).viewInsets.bottom,
    child: AssetsHoldersBottomSheet(
      deviceName: deviceName ?? 'HP AS112',
      image: image ?? AppAssets.imageLaptop,
      brand: brand ?? 'Acer',
      srNo: srNo ?? 'KJJVKGDWD66t',
      handover: handover ?? '03-04-2025',
      handoverImageList: handoverImageList ?? [],
      takeoverImageList: takeoverImageList ?? [],
      historyImageList:
          historyImageList ??
          [
            'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
            'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
            AppAssets.imageLaptop,
            AppAssets.imageLaptop,
          ],
      handoverDate: handoverDate ?? '02-05-2025',
      takeoverDate: takeoverDate ?? '02-05-2025',
      notAssign: notAssign ?? false,
    ),
  ),
);

class AssetsHoldersBottomSheet extends StatelessWidget {
  final String deviceName;
  final String image;
  final String brand;
  final String srNo;
  final String handover;
  final String? takeover;
  final String handoverDate;
  final String takeoverDate;
  final bool? notAssign;
  final List<String> handoverImageList;
  final List<String> takeoverImageList;
  final List<String> historyImageList;

  const AssetsHoldersBottomSheet({
    required this.image,
    required this.brand,
    required this.srNo,
    required this.handover,
    required this.handoverImageList,
    required this.takeoverImageList,
    required this.deviceName,
    required this.handoverDate,
    required this.takeoverDate,
    super.key,
    this.takeover,
    this.notAssign,
    required this.historyImageList,
  });

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonCard(
              title: 'Assets Holder',
              showBlackShadowInChild: true,
              // headerColor: AppTheme.getColor(context).primary,
              borderColor: AppTheme.lightTheme(context).dividerColor,
              headerPadding: EdgeInsets.symmetric(
                horizontal: 16 * Responsive.getResponsive(context),
                vertical: 12 * Responsive.getResponsive(context),
              ),
              bottomWidget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      16.0 * Responsive.getResponsive(context),
                    ),
                    child: notAssign == true
                        ? Row(
                            children: [
                              Image.asset(
                                AppAssets.imageNoAssets,
                                width: 0.12 * Responsive.getWidth(context),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomText(
                                  isKey: true,
                                  'not_assigned_to_any_user',
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.getColor(context).primary,
                                ),
                              ),
                            ],
                          )
                        : profileRowData(
                            context: context,
                            image:
                                'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                            title: 'Mukund Madhav',
                            subTitle: 'QA',
                            address: 'QA Technical - Junagadh',
                          ),
                  ),
                  Divider(color: AppTheme.getColor(context).outline, height: 0),
                  Padding(
                    padding: EdgeInsets.all(
                      16.0 * Responsive.getResponsive(context),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    deviceName,
                                    color: AppTheme.getColor(context).primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        24 *
                                        Responsive.getResponsiveText(context),
                                  ),
                                  SizedBox(
                                    height:
                                        0.02 * Responsive.getHeight(context),
                                  ),
                                  Image.asset(
                                    image,
                                    width: 0.3 * Responsive.getWidth(context),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: DashedLine(
                                  color: AppTheme.getColor(context).primary,
                                  axis: Axis.vertical,
                                  width: 4,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AssetsVerticalData(
                                      title: 'brand',
                                      data: brand,
                                    ),
                                    SizedBox(
                                      height:
                                          0.02 * Responsive.getHeight(context),
                                    ),
                                    AssetsVerticalData(
                                      title: 'sr_no',
                                      data: srNo,
                                    ),
                                    SizedBox(
                                      height:
                                          0.02 * Responsive.getHeight(context),
                                    ),
                                    if (handoverImageList.isEmpty)
                                      AssetsVerticalData(
                                        title: 'handover',
                                        data: handover,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0.02 * Responsive.getHeight(context)),
                        if (handoverImageList.isNotEmpty)
                          Row(
                            children: [
                              SizedBox(
                                width: 0.36 * Responsive.getWidth(context),
                                child: AssetsVerticalData(
                                  title: 'handover',
                                  data: handover,
                                ),
                              ),
                              Expanded(
                                child: ImageGridPreviewWidget(
                                  boxHeight:
                                      0.14 * Responsive.getWidth(context),
                                  boxWidth: 0.14 * Responsive.getWidth(context),
                                  borderRadius: 10,
                                  imageList: handoverImageList,
                                ),
                              ),
                            ],
                          ),
                        if (handoverImageList.isNotEmpty &&
                            takeoverImageList.isNotEmpty)
                          SizedBox(
                            height: 0.02 * Responsive.getHeight(context),
                          ),
                        if (takeoverImageList.isNotEmpty)
                          Row(
                            children: [
                              SizedBox(
                                width: 0.36 * Responsive.getWidth(context),
                                child: AssetsVerticalData(
                                  title: 'takeover',
                                  data: takeover ?? '',
                                ),
                              ),
                              Expanded(
                                child: ImageGridPreviewWidget(
                                  boxHeight:
                                      0.14 * Responsive.getWidth(context),
                                  boxWidth: 0.14 * Responsive.getWidth(context),
                                  borderRadius: 10,
                                  imageList: takeoverImageList,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.04 * Responsive.getHeight(context)),

            // -- Assets History --
            CommonCard(
              title: 'Assets Holder',
              showBlackShadowInChild: true,
              headerColor: AppTheme.getColor(context).primary,
              borderColor: AppTheme.lightTheme(context).dividerColor,
              headerPadding: EdgeInsets.symmetric(
                horizontal: 16 * Responsive.getResponsive(context),
                vertical: 12 * Responsive.getResponsive(context),
              ),
              bottomWidget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      16.0 * Responsive.getResponsive(context),
                    ),
                    child: profileRowData(
                      context: context,
                      image:
                          'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                      title: 'Mukund Madhav',
                      subTitle: 'QA',
                      address: 'QA Technical - Junagadh',
                    ),
                  ),
                  Divider(color: AppTheme.getColor(context).outline, height: 0),
                  Padding(
                    padding: EdgeInsets.all(
                      16.0 * Responsive.getResponsive(context),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AssetsVerticalData(
                              title: 'takeover_date',
                              data: takeoverDate,
                              titleColor: AppTheme.getColor(context).primary,
                            ),
                            AssetsVerticalData(
                              titleColor: AppTheme.getColor(context).primary,
                              title: 'handover_date',
                              data: handoverDate,
                            ),
                          ],
                        ),
                        if (historyImageList.isNotEmpty)
                          SizedBox(
                            height: 0.01 * Responsive.getHeight(context),
                          ),
                        if (historyImageList.isNotEmpty)
                          ImageGridPreviewWidget(
                            boxHeight: 0.14 * Responsive.getWidth(context),
                            boxWidth: 0.14 * Responsive.getWidth(context),
                            borderRadius: 10,
                            imageList: historyImageList,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.04 * Responsive.getHeight(context)),

            // -- Close Button --
            MyCoButton(
              onTap: () => Navigator.pop(context),
              title: 'Close',
              boarderRadius: 50 * Responsive.getWidth(context),
              isShadowBottomLeft: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget profileRowData({
    required BuildContext context,
    required String image,
    required String title,
    required String subTitle,
    required String address,
  }) => Row(
    children: [
      Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 1),
              color: Colors.black26,
              blurRadius: 4,
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 0.06 * Responsive.getWidth(context),
          child: ClipOval(
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: 0.34 * Responsive.getWidth(context),
              height: 0.34 * Responsive.getWidth(context),
            ),
          ),
        ),
      ),
      const SizedBox(width: 12),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            isKey: true,
            title,
            fontSize: 20 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
            color: AppTheme.getColor(context).primary,
          ),
          CustomText(
            isKey: true,
            subTitle,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
          CustomText(
            address,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
        ],
      ),
    ],
  );
}
