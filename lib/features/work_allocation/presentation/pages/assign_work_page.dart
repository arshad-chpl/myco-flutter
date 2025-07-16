import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssignWorkPage extends StatefulWidget {
  const AssignWorkPage({super.key});

  @override
  State<AssignWorkPage> createState() => _AssignWorkState();
}

class _AssignWorkState extends State<AssignWorkPage> {
  final List<String> visitPurposes = ['Sales', 'Support', 'Demo'];
  String? selectedVisitPurpose;
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      elevation: 0,
      centerTitle: false,
      leading: const BackButton(),
      appBarTitleWidget: CustomText(
        'Assign Work',
        fontSize: 24 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
        color: AppTheme.getColor(context).onSurface,
      ),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 20 * Responsive.getResponsive(context),
        vertical: 12 * Responsive.getResponsive(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Work Category
          CustomText(
            'Category *',
            isKey: true,
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 6 * Responsive.getResponsive(context)),
          CustomPopupDropdownStyled<String>(
            items: visitPurposes,
            hintText: 'Work Category',
            /*prefix: SvgPicture.asset(AppAssets.gps, fit: BoxFit.scaleDown),*/
            selectedItem: selectedVisitPurpose,
            onChanged: (v, i) => setState(() => selectedVisitPurpose = v),
            itemToString: (item) => item,
            /*spacing: 0.02 * Responsive.getWidth(context),*/
            hintTextStyle: TextStyle(
              fontSize: 16 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).outline,
              fontWeight: FontWeight.w600,
            ),
            border: Border.all(color: AppTheme.getColor(context).outline),
          ),
          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Type here
          LabeledTextField(
            label: 'Project Sr No *',
            hint: 'Type here',
            hintTextStyle: TextStyle(color: AppTheme.getColor(context).outline),
            controller: amountController,
            widthFactor: Responsive.getWidth(context),
            textInputType: TextInputType.datetime,
            textAlignment: TextAlign.start,
            /* prefix: SvgPicture.asset(
              AppAssets.noteFavorite,
              fit: BoxFit.scaleDown,
            ),*/
            validator: (v) =>
                v == null || v.isEmpty ? 'Please enter Project Sr No' : null,
          ),
          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Site
          LabeledTextField(
            label: 'Site *',
            hint: 'Type here',
            hintTextStyle: TextStyle(color: AppTheme.getColor(context).outline),
            controller: amountController,
            widthFactor: Responsive.getWidth(context),
            textInputType: TextInputType.datetime,
            textAlignment: TextAlign.start,
            /*prefix: SvgPicture.asset(
              AppAssets.noteFavorite,
              fit: BoxFit.scaleDown,
            ),*/
            validator: (v) =>
                v == null || v.isEmpty ? 'Please enter Site' : null,
          ),
          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Location
          LabeledTextField(
            label: 'Location *',
            hint: 'Type here',
            hintTextStyle: TextStyle(color: AppTheme.getColor(context).outline),
            controller: amountController,
            widthFactor: Responsive.getWidth(context),
            textInputType: TextInputType.datetime,
            textAlignment: TextAlign.start,
            /* prefix: SvgPicture.asset(
              AppAssets.noteFavorite,
              fit: BoxFit.scaleDown,
            ),*/
            validator: (v) =>
                v == null || v.isEmpty ? 'Please enter Location' : null,
          ),
          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Start Date
          LabeledTextField(
            label: 'Start Date (DD/MM/YYYY) *',
            hint: 'Select',
            hintTextStyle: TextStyle(color: AppTheme.getColor(context).outline),
            controller: amountController,
            widthFactor: Responsive.getWidth(context),
            textInputType: TextInputType.datetime,
            textAlignment: TextAlign.start,
            /*prefix: SvgPicture.asset(
              AppAssets.noteFavorite,
              fit: BoxFit.scaleDown,
            ),*/
            validator: (v) =>
                v == null || v.isEmpty ? 'Please enter Start Date' : null,
          ),
          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Target Date of Completion
          LabeledTextField(
            label: 'Target Date of Completion (DD/MM/YYYY) *',
            hint: 'Select',
            hintTextStyle: TextStyle(color: AppTheme.getColor(context).outline),
            controller: amountController,
            widthFactor: Responsive.getWidth(context),
            textInputType: TextInputType.datetime,
            textAlignment: TextAlign.start,
            /*prefix: SvgPicture.asset(
              AppAssets.noteFavorite,
              fit: BoxFit.scaleDown,
            ),*/
            validator: (v) => v == null || v.isEmpty
                ? 'Please enter Target Date of Completion'
                : null,
          ),
          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Assign Work Engineer *

          //Remark
          CustomText(
            'Remark',
            isKey: true,
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 8 * Responsive.getResponsive(context)),
          BigMyCoTextField(
            controller: amountController,
            hintText: 'Type here',
            /*prefixImage: SvgPicture.asset(
              AppAssets.stickynote,
              fit: BoxFit.scaleDown,
              height: 20 * Responsive.getResponsive(context),
              width: 20 * Responsive.getResponsive(context),
            ),*/
            maxLines: 5,
            height: 120 * Responsive.getResponsive(context),
            textInputType: TextInputType.multiline,
            validator: (v) =>
                v == null || v.isEmpty ? 'Please enter a remark' : null,
            hintStyle: TextStyle(
              color: AppTheme.getColor(context).outline,
              fontSize: 16 * Responsive.getResponsiveText(context),
            ),
            style: TextStyle(
              fontSize: 16 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).primary,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
            ),
          ),
          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Submit
          MyCoButton(
            title: 'Submit',
            onTap: () {},
            backgroundColor: AppColors.primary,
            textStyle: TextStyle(
              fontSize: 16 * Responsive.getResponsiveText(context),
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            width: double.infinity,
            isShadowBottomLeft: true,
            boarderRadius: 30,
          ),
        ],
      ),
    ),
  );
}
