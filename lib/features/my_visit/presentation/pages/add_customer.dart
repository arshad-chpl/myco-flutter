import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/label_with_add_botton.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  /// Country code selections for phone number fields
  String selectedCountry1 = 'INA';
  String selectedCountry2 = 'INA';

  // Controllers for phone number text fields
  final TextEditingController phoneController1 = TextEditingController();
  final TextEditingController phoneController2 = TextEditingController();
  final TextEditingController anniversaryController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  /// Country code mapping
  final Map<String, String> countryMap = {
    'INA': '+62',
    'USA': '+1',
    'IND': '+91',
  };

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'add_customer', isKey: true),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: VariableBag.screenHorizontalPadding * Responsive.getResponsive(context),
      ),

      child: Column(
        spacing: VariableBag.formContentSpacingVertical * Responsive.getResponsive(context),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Customer Company Name
          NewTextField(
            isKey: true,
            label: 'Customer Company Name',
            hintText: LanguageManager().get('type_here'),
            prefixIconPath: AppAssets.building,
          ),

          /// Customer Category
          NewTextField(
            isKey: true,
            label: 'customer_category',
            hintText: LanguageManager().get('select_category'),
            prefixIconPath: AppAssets.element,
          ),

          /// Contact Person Name
          NewTextField(
            isKey: true,
            label: 'contact_person_name',
            hintText: LanguageManager().get('type_here'),
            prefixIconPath: AppAssets.profileCircle,
          ),

          /// Contact Person Mobile Number field with country code
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'contact_person_mobile',
                fontWeight: FontWeight.w700,
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              PhoneNumberField(
                selectedCountry: selectedCountry1,
                countries: countryMap.keys.toList(),
                onCountryChanged: (p0, p1) {},
                phoneController: phoneController2,
                countryDialCodes: countryMap,
                textFieldHeight: 0.065 * Responsive.getHeight(context),
                hintTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).outline,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                ),
                hintText: '000 00 000 00',
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).onPrimary,
                  border: Border.all(color: AppTheme.getColor(context).outline),
                  borderRadius: BorderRadius.circular(
                    12 * Responsive.getResponsive(context),
                  ),
                ),
              ),
            ],
          ),

          /// Alternative Phone Number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'alternate_phone_number',
                fontWeight: FontWeight.w700,
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              PhoneNumberField(
                selectedCountry: selectedCountry1,
                countries: countryMap.keys.toList(),
                onCountryChanged: (p0, p1) {},
                phoneController: phoneController2,
                countryDialCodes: countryMap,
                textFieldHeight: 0.065 * Responsive.getHeight(context),
                hintTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).outline,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                ),
                hintText: '000 00 000 00',
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).onPrimary,
                  border: Border.all(color: AppTheme.getColor(context).outline),
                  borderRadius: BorderRadius.circular(
                    12 * Responsive.getResponsive(context),
                  ),
                ),
              ),
            ],
          ),

          /// Date Of Birth
          NewTextField(
            isKey: true,
            label: 'date_of_birth',
            hintText: 'Enter Birth Date',
            prefixIconPath: AppAssets.date,
            controller: birthDateController,
            enabled: false,
          ),

          /// Anniversary Date
          NewTextField(
            isKey: true,
            label: 'anniversary_date',
            hintText: 'Enter Anniversary Date',
            prefixIconPath: AppAssets.date,
            controller: anniversaryController,
            enabled: false,
          ),

          /// Email ID
          NewTextField(
            isKey: true,
            label: 'email_id',
            hintText: LanguageManager().get('email_contact_finca'),
            prefixIconPath: AppAssets.sms,
          ),

          /// Select Location
          NewTextField(
            isKey: true,
            label: 'select_location',
            hintText: LanguageManager().get('select_location'),
            prefixIconPath: AppAssets.locationVisit,
          ),

          /// Address
          NewTextField(
            isKey: true,
            label: 'address',
            hintText: LanguageManager().get('type_here'),
            prefixIconPath: AppAssets.home,
          ),

          /// Pincode
          NewTextField(
            isKey: true,
            label: 'pincode',
            hintText: LanguageManager().get('type_here'),
            prefixIconPath: AppAssets.lock,
          ),

          /// City dropdown with Add button
          Column(
            children: [
              LabelWithAddButton(
                label: 'city',
                actionText: 'add_city',
                labelFontSize: 14 * Responsive.getResponsiveText(context),
                actionFontSize: 14 * Responsive.getResponsiveText(context),
                onTap: () {},
                iconPath: AppAssets.addButton,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              NewTextField(
                isKey: true,
                prefixIconPath: AppAssets.building,
                suffixIconPath: AppAssets.downArrow,
                hintText: LanguageManager().get('state_not_assigned'),
              ),
            ],
          ),

          /// Area dropdown with Add button
          Column(
            children: [
              LabelWithAddButton(
                label: 'area',
                actionText: 'add_area',
                labelFontSize: 14 * Responsive.getResponsiveText(context),
                actionFontSize: 14 * Responsive.getResponsiveText(context),
                onTap: () {},
                iconPath: AppAssets.addButton,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              NewTextField(
                isKey: true,
                prefixIconPath: AppAssets.areaMap,
                suffixIconPath: AppAssets.downArrow,
                hintText: LanguageManager().get('state_not_assigned'),
              ),
            ],
          ),

          /// Retailer Type
          NewTextField(
            isKey: true,
            label: 'retailer_type',
            hintText: LanguageManager().get('select'),
            prefixIconPath: AppAssets.businessAndTrade,

          ),

          /// Website
          NewTextField(
            isKey: true,
            label: 'website_contact_finca',
            hintText: LanguageManager().get('type_here'),
            prefixIconPath: AppAssets.global,
          ),

          /// GST Number
          NewTextField(
            isKey: true,
            label: 'tax_number',
            hintText: LanguageManager().get('type_here'),
            prefixIconPath: AppAssets.gst,
          ),

          /// Select Distributor
          NewTextField(
            isKey: true,
            label: 'select_distributor',
            hintText: LanguageManager().get('select_distributor'),
            prefixIconPath: AppAssets.cardCoin,
          ),

          /// Credit Limit
          NewTextField(
            isKey: true,
            label: 'credit_limit',
            hintText: LanguageManager().get('type_here'),
            prefixIconPath: AppAssets.bitCinCard,
          ),

          /// Credit Days
          NewTextField(
            isKey: true,
            label: 'credit_days',
            hintText: LanguageManager().get('type_here'),
            prefixIconPath: AppAssets.emptyWalletTime,
          ),

          /// Shop Photo media picker
          CustomMediaPickerContainer(
            title: 'shop_photo',
            titleColor: AppTheme.getColor(context).onSurfaceVariant,
            titleFontSize: 14 * Responsive.getResponsiveText(context),
            imageTitle: 'select_media',
            containerHeight:  0.125 * Responsive.getHeight(context),
            multipleImage: 5,
            imagePath: 'assets/media_picker/gallery-export.png',
            backgroundColor: AppTheme.getColor(context).surfaceContainer,
            isCameraShow: true,
            isGalleryShow: true,
            isDocumentShow: true,
            isCropImage: true,
            imageTitleSize: 14 * Responsive.getResponsiveText(context),
            imageTitleColor: AppTheme.getColor(context).onSurfaceVariant,
          ),

          ///  space below media picker
          SizedBox(height: 0.03 * Responsive.getHeight(context)),

          /// Submit button
          MyCoButton(
            onTap: () {},
            title: LanguageManager().get('submit'),
            isShadowBottomLeft: true,
            boarderRadius: VariableBag.buttonBorderRadius  * Responsive.getResponsive(context),
            textStyle: TextStyle(
              fontSize: 20 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppTheme.getColor(context).onPrimary,
            ),
          ),

          /// Extra spacing at end
          const SizedBox(),
          const SizedBox(),
        ],
      ),
    ),
  );
}