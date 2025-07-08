import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_image_picker_container/dashed_border_container.dart';
import 'package:myco_flutter/features/visit/presentation/pages/test_new_visit.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/dashed_border_container.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/media_picker.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class RemarkPage extends StatefulWidget {
  const RemarkPage({super.key});

  @override
  State<RemarkPage> createState() => _RemarkPageState();
}

class _RemarkPageState extends State<RemarkPage> {
  String selectedGender = '';
  String? selectedExpenseType;
  bool autoStartVisit = false;
  final List<String> expenseTypes = [
    'Travel',
    'Food',
    'Accommodation',
    'Office Supplies',
    'Entertainment',
    'Miscellaneous',
    'Fuel',
    'Internet',
    'Medical',
    'Training',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 0.04 * getWidth(context)),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12 * getResponsive(context),
            children: [
              LabeledTextField(
                textAlignment: TextAlign.start,
                label: 'Remark',
                hint: 'Type here',
                isSuffixIconOn: false,
                fontWeight: FontWeight.w700,
                widthFactor: getWidth(context),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppTheme.getColor(context).outline,
                  ),
                  borderRadius: BorderRadius.circular(
                    10 * getResponsive(context),
                  ),
                ),
                prefix: SvgPicture.asset(
                  AppAssets.assetMessageEdit,
                  fit: BoxFit.scaleDown,
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Follow Up Visit Time',
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getColor(context).onSurfaceVariant,
                          fontSize: 16 * getResponsiveText(context),
                        ),
                        SizedBox(height: 0.005 * getHeight(context)),
                        SizedBox(
                          width: double.infinity,
                          child: CustomPopupDropdownStyled<String>(
                            spacing: 10 * getResponsive(context),
                            items: expenseTypes,
                            hintText: 'Select',
                            height: 0.07 * getHeight(context),
                            prefix: SvgPicture.asset(
                              AppAssets.assetClock,
                              fit: BoxFit.scaleDown,
                            ),
                            hintTextStyle: TextStyle(
                              fontSize: 18 * getResponsiveText(context),
                              color: AppTheme.getColor(context).outline,
                              fontWeight: FontWeight.w600,
                            ),

                            selectedItem: selectedExpenseType,
                            itemToString: (item) => item,
                            onChanged: (value, index) {
                              setState(() {
                                selectedExpenseType = value;
                              });
                            },
                            border: BoxBorder.all(
                              color: AppTheme.getColor(context).outline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 0.04 * getWidth(context)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Follow Up Visit Date',
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getColor(context).onSurfaceVariant,
                          fontSize: 16 * getResponsiveText(context),
                        ),
                        SizedBox(height: 0.005 * getHeight(context)),
                        SizedBox(
                          width: double.infinity,
                          child: CustomPopupDropdownStyled<String>(
                            items: expenseTypes,
                            spacing: 10 * getResponsive(context),
                            hintText: 'Select',
                            height: 0.07 * getHeight(context),
                            prefix: SvgPicture.asset(
                              AppAssets.assetNoteFavorite,
                              fit: BoxFit.scaleDown,
                            ),
                            hintTextStyle: TextStyle(
                              fontSize: 18 * getResponsiveText(context),
                              color: AppTheme.getColor(context).outline,
                              fontWeight: FontWeight.w600,
                            ),

                            selectedItem: selectedExpenseType,
                            itemToString: (item) => item,
                            onChanged: (value, index) {
                              setState(() {
                                selectedExpenseType = value;
                              });
                            },

                            border: BoxBorder.all(
                              color: AppTheme.getColor(context).outline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextRadioButton(
                    gender: 'Field Visit',
                    selectedGender: selectedGender,
                    onSelect: (val) {
                      setState(() {
                        selectedGender = val;
                      });
                    },
                    height: 0.07 * getHeight(context),
                    width: 0.44 * getWidth(context),

                    leading: Padding(
                      padding: EdgeInsets.only(
                        left: 12 * getResponsive(context),
                      ),
                      child: Radio<String>(
                        value: 'Field Visit',
                        groupValue: selectedGender,
                        activeColor: AppTheme.getColor(context).primary,
                        onChanged: (val) {
                          if (val == selectedGender) {
                            setState(() {
                              selectedGender = '';
                            });
                          } else {
                            setState(() {
                              selectedGender = val!;
                            });
                          }
                        },
                      ),
                    ),

                    customDecoration: BoxDecoration(
                      color: selectedGender == 'Field Visit'
                          ? AppTheme.getColor(context).surfaceContainer
                          : AppTheme.getColor(context).onPrimary,
                      border: Border.all(
                        color: AppTheme.getColor(context).outline,
                      ),
                      borderRadius: BorderRadius.circular(
                        10 * getResponsive(context),
                      ),
                    ),
                  ),

                  CustomTextRadioButton(
                    customDecoration: BoxDecoration(
                      color: selectedGender == 'Virtual Visit'
                          ? AppTheme.getColor(context).surfaceContainer
                          : AppTheme.getColor(context).onPrimary,
                      border: Border.all(
                        color: AppTheme.getColor(context).outline,
                      ),
                      borderRadius: BorderRadius.circular(
                        10 * getResponsive(context),
                      ),
                    ),
                    gender: 'Virtual Visit',
                    selectedGender: selectedGender,
                    onSelect: (val) {
                      setState(() {
                        selectedGender = val;
                      });
                    },
                    height: 0.07 * getHeight(context),
                    width: 0.44 * getWidth(context),

                    leading: Padding(
                      padding: EdgeInsets.only(
                        left: 12 * getResponsive(context),
                      ),
                      child: Radio<String>(
                        value: 'Virtual Visit',
                        groupValue: selectedGender,
                        activeColor: AppTheme.getColor(context).primary,
                        onChanged: (val) {
                          setState(() {
                            selectedGender = val == selectedGender ? '' : val!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              LabeledTextField(
                textAlignment: TextAlign.start,
                label: 'Visit Area',
                hint: 'Type here',
                isSuffixIconOn: false,
                fontWeight: FontWeight.w700,
                widthFactor: getWidth(context),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppTheme.getColor(context).outline,
                  ),
                  borderRadius: BorderRadius.circular(
                    10 * getResponsive(context),
                  ),
                ),
                prefix: SvgPicture.asset(
                  AppAssets.assetArrowSquare,
                  fit: BoxFit.scaleDown,
                ),
              ),

              LabeledTextField(
                textAlignment: TextAlign.start,
                label: 'Visit Catalogue',
                hint: 'Type here',
                isSuffixIconOn: false,
                fontWeight: FontWeight.w700,
                widthFactor: getWidth(context),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppTheme.getColor(context).outline,
                  ),
                  borderRadius: BorderRadius.circular(
                    10 * getResponsive(context),
                  ),
                ),
                prefix: SvgPicture.asset(
                  AppAssets.assetNoteFavorite,
                  fit: BoxFit.scaleDown,
                ),
              ),
              LabeledTextField(
                textAlignment: TextAlign.start,
                label: 'Visit Contact Person Name',
                hint: 'Type here',
                isSuffixIconOn: false,
                fontWeight: FontWeight.w700,
                widthFactor: getWidth(context),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppTheme.getColor(context).outline,
                  ),
                  borderRadius: BorderRadius.circular(
                    10 * getResponsive(context),
                  ),
                ),
                prefix: SvgPicture.asset(
                  AppAssets.assetProfileCircle,
                  fit: BoxFit.scaleDown,
                ),
              ),
              CustomText(
                'Attachment',
                fontWeight: FontWeight.w700,
                fontSize: 16 * getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),

              Padding(
                padding: EdgeInsets.all(1 * getResponsive(context)),
                child: DesignBorderContainer(
                   backgroundColor: AppTheme.getColor(context).surfaceContainer,
                  width: double.infinity,
                  height: 0.11 * getHeight(context),
                  borderRadius: 10,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      showMediaFilePicker(
                        isDialog: false,
                        isCameraShow: true,
                        isGalleryShow: true,
                        isDocumentShow: true,
                        context: context,
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.assetBookmark_2,
                          fit: BoxFit.scaleDown,
                        ),

                        SizedBox(height: 0.010 * getHeight(context)),

                        CustomText(
                          'Select Attachment',
                          fontSize: 14 * getResponsive(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 0.05 * getHeight(context)),
              Row(
                spacing: 10 * getResponsive(context),
                children: [
                  CustomCheckbox(
                    value: autoStartVisit,
                    onChanged: (value) =>
                        setState(() => autoStartVisit = value),
                    borderColor: AppTheme.getColor(context).onSurface,
                    activeColor: AppTheme.getColor(context).primary,
                    checkColor: AppTheme.getColor(context).onPrimary,
                    height: 20,
                    width: 20,
                    unCheckedBackground: AppTheme.getColor(context).onSecondary,
                  ),
                  const Text(
                    'Order Placed ?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              SizedBox(height: 0.02 * getHeight(context)),
              Row(
                children: [
                  Expanded(
                    child: MyCoButton(
                      onTap: () => Navigator.pop(context),
                      title: 'CLOSE',
                      textStyle: TextStyle(
                        color: AppTheme.getColor(context).primary,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.transparent,
                      boarderRadius: 30,
                      wantBorder: true,
                      borderColor: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 0.03 * getWidth(context)),
                  Expanded(
                    child: MyCoButton(
                      onTap: () {
                        //Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TestNewVisit(),
                          ),
                        );
                      },
                      title: 'END VISIT',
                      textStyle: TextStyle(
                        color: AppTheme.getColor(context).onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: AppTheme.getColor(context).primary,
                      boarderRadius: 30,
                      wantBorder: false,
                      isShadowBottomLeft: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.06 * getHeight(context)),
            ],
          ),
        ),
      ),
    ),
  );
}
