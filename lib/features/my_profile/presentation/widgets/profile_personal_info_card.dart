import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_label_gifs.dart';
import 'package:myco_flutter/features/my_profile/domain/entites/profile_entity.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_shadow_container.dart';

class ProfilePersonalInfoCard extends StatelessWidget {
  final List personalInfoList;
  ProfilePersonalInfoCard({super.key, required this.personalInfoList});


  @override
  Widget build(BuildContext context) => Column(
    spacing: 0.015 * Responsive.getHeight(context),
    children: [
      CustomLabelGifs(
        title: 'Personal Info',
        gifAssetPath: 'assets/gifs/profile_info.gif',
      ),
      GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: personalInfoList.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 8,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final ProfileMenuEntity item = personalInfoList[index];
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 16 * Responsive.getResponsive(context),
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
              border: Border.all(
                color: AppTheme.getColor(context).outlineVariant,
              ),
            ),
            child: InkWell(
              onTap: () {
                log(personalInfoList.toString());
              },
              child: CustomShadowContainer(
                textAlign: TextAlign.center,
                image: Image.network(item.profileMenuPhoto.toString()),
                title: item.profileMenuName.toString(),
                containerHeight: 0.08 * Responsive.getHeight(context),
                titleStyle: TextStyle(
                  fontSize: 50 * Responsive.getResponsiveText(context),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}
