import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class NoOrderPage extends StatelessWidget {
  const NoOrderPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(title: LanguageManager().get('no_order')),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
        vertical: 0.02 * Responsive.getHeight(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            'reason',
            fontSize: 14 * Responsive.getResponsiveText(context),
          ),
          SizedBox(height: 0.01 * Responsive.getHeight(context)),
          DropdownMenu(
            width: 0.9 * Responsive.getWidth(context),
            hintText: LanguageManager().get('select'),

            leadingIcon: const Icon(Icons.notes),
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: '1',
                label: 'select',
                leadingIcon: Icon(Icons.notes),
              ),
            ],
          ),

          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          // Remark Section
          CustomText(
            'remark',
            fontSize: 14 * Responsive.getResponsiveText(context),
          ),
          SizedBox(height: 0.01 * Responsive.getHeight(context)),
          BigMyCoTextField(
            hintText: LanguageManager().get('type_here'),
            prefixImage: SvgPicture.asset(
              AppAssets.messageEdit,
              colorFilter: ColorFilter.mode(
                AppTheme.getColor(context).primary,
                BlendMode.srcIn,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
            ),
          ),
          const Spacer(),
          MyCoButton(
            onTap: () {},
            title: LanguageManager().get('submit'),
            height: 0.05 * Responsive.getHeight(context),
            boarderRadius: 30 * Responsive.getResponsive(context),
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
        ],
      ),
    ),
  );
}
