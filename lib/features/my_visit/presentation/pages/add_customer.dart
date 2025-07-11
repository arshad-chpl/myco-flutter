import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/label_with_add_botton.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/phone_field.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_calendar_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_media_picker_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  // Dropdown selected values
  String? selectedCity;
  String? selectedAreaList;

  // Dropdown list options
  final List<String> cityList = ['Ahmedabad', 'Surat', 'Rajkot', 'Vadodara'];
  final List<String> areaList = ['Maninagar', 'Navrangpura', 'Bopal', 'Iskon'];

  // Country code selections for phone number fields
  String selectedCountry1 = 'INA';
  String selectedCountry2 = 'INA';

  // Controllers for phone number text fields
  final TextEditingController phoneController1 = TextEditingController();
  final TextEditingController phoneController2 = TextEditingController();

  // Country code mapping
  final Map<String, String> countryMap = {
    'INA': '+62',
    'USA': '+1',
    'IND': '+91',
  };

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      leading: BackButton(
        style: ButtonStyle(
          iconSize: WidgetStatePropertyAll(0.04 * getWidth(context)),
        ),
      ),
      backgroundColor: AppTheme.getColor(context).surface,
      elevation: 0,
      title: CustomText(
        'Add Customer',
        fontSize: 16 * getResponsiveText(context),
        fontWeight: FontWeight.w700,
        color: AppTheme.getColor(context).onSurface,
      ),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 32.0 * getResponsive(context)),
      child: Column(
        spacing: 16 * getResponsive(context),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Customer Company Name
          CommonTextField(
            'Customer Company Name',
            'Type Here',
            AppAssets.building,
          ),

          // Customer Category
          CommonTextField(
            'Customer Category',
            'Select Category',
            AppAssets.element,
          ),

          // Contact Person Name
          CommonTextField(
            'Contact Person Name',
            'Type Here',
            AppAssets.profileCircle,
          ),

          // Contact Person Mobile Number field with country code
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Contact Person Mobile Number',
                fontWeight: FontWeight.w700,
                fontSize: 12 * getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 0.005 * getHeight(context)),
              PhoneField(
                selectedCountry: selectedCountry1,
                countries: countryMap.keys.toList(),
                onCountryChanged: (_) {},
                controller: phoneController1,
                countryDialCodes: countryMap,
                borderRadius: 8 * getResponsive(context),
                textFieldHeight: 44  ,
                borderColor: AppTheme.getColor(context).outline,
                hintText: '000 00 000 00',
                phoneFontWeight: FontWeight.w600,
                hintTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                ),
                countryFontSize: 18 * getResponsiveText(context),
                countryCodeFontSize: 14 * getResponsiveText(context),
                countryCodeTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                ),
              ),
            ],
          ),

          // Alternative Phone Number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Alt. Phone Number',
                fontWeight: FontWeight.w700,
                fontSize: 12 * getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 0.005 * getHeight(context)),
              PhoneField(
                selectedCountry: selectedCountry2,
                countries: countryMap.keys.toList(),
                onCountryChanged: (_) {},
                controller: phoneController2,
                countryDialCodes: countryMap,
                borderRadius: 8 * getResponsive(context),
                textFieldHeight: 47,
                borderColor: AppTheme.getColor(context).outline,
                hintText: '000 00 000 00',
                phoneFontWeight: FontWeight.w600,
                hintTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                ),
                countryFontSize: 18 * getResponsiveText(context),
                countryCodeFontSize: 14 * getResponsiveText(context),
                countryCodeTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                ),
              ),
            ],
          ),

          // Date Of Birth
          CommonTextField(
            'Date Of Birth',
            'Enter Birth Date',
            AppAssets.date,
            readOnly: true,
            onTap: () async {
              await showModalBottomSheet<Map<String, int>>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => CustomCalendarBottomSheet(
                  initialMonth: DateTime.now().month,
                  initialYear: DateTime.now().year,
                  previousYears: 5,
                  nextYears: 5,
                ),
              );
            },
          ),

          // Anniversary Date
          CommonTextField(
            'Anniversary Date',
            'Enter Anniversary Date',
            AppAssets.date,
            readOnly: true,
            onTap: () async {
              await showModalBottomSheet<Map<String, int>>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => CustomCalendarBottomSheet(
                  initialMonth: DateTime.now().month,
                  initialYear: DateTime.now().year,
                  previousYears: 5,
                  nextYears: 5,
                ),
              );
            },
          ),

          // Email ID
          CommonTextField('Email ID', 'Email', AppAssets.sms),

          // Select Location
          CommonTextField(
            'Select Location',
            'Select Location',
            AppAssets.location,
          ),

          // Address
          CommonTextField('Address', 'Type Here', AppAssets.home),

          // Pincode
          CommonTextField('Pincode', 'Type Here', AppAssets.lock),

          // City dropdown with Add button
          Column(
            children: [
              LabelWithAddButton(
                label: 'City',
                actionText: 'Add City',
                onTap: () {},
                iconPath: AppAssets.addButton,
              ),
              SizedBox(height: 0.005 * getHeight(context)),
              CustomPopupDropdownStyled<String>(
                items: cityList,
                selectedItem: selectedCity,
                hintText: 'State not assigned',
                itemToString: (item) => item,
                onChanged: (value, index) {},
                borderRadius: 8 * getResponsive(context),
                popupElevation: 6 * getResponsive(context),
                spacing: 25 * getResponsive(context),
                hintTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).outline,
                  fontSize: 14 * getResponsiveText(context),
                ),
                prefix: SvgPicture.asset(AppAssets.building),
                border: Border.all(color: AppTheme.getColor(context).outline),

              ),
            ],
          ),

          // Area dropdown with Add button
          Column(
            children: [
              LabelWithAddButton(
                label: 'Area',
                actionText: 'Add Area',
                onTap: () {},
                iconPath: AppAssets.addButton,
              ),
              SizedBox(height: 0.005 * getHeight(context)),
              CustomPopupDropdownStyled<String>(
                items: areaList,
                selectedItem: selectedAreaList,
                hintText: 'Select Area',
                itemToString: (item) => item,
                onChanged: (value, index) {},
                borderRadius: 8 * getResponsive(context),
                popupElevation: 6 * getResponsive(context),
                spacing: 25 * getResponsive(context),
                hintTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).outline,
                  fontSize: 14 * getResponsiveText(context),
                ),
                prefix: SvgPicture.asset(AppAssets.map),
                border: Border.all(color: AppTheme.getColor(context).outline),
              ),
            ],
          ),

          // Retailer Type
          CommonTextField(
            'Retailer Type',
            'Select ',
            AppAssets.businessAndTrade,
          ),

          // Website
          CommonTextField('Website', 'Type Here', AppAssets.global),

          // GST Number
          CommonTextField('GST Number', 'Type Here', AppAssets.gst),

          // Select Distributor
          CommonTextField(
            'Select Distributor',
            'Select Distributor',
            AppAssets.cardCoin,
          ),

          // Credit Limit
          CommonTextField('Credit Limit', 'Type Here', AppAssets.bitCinCard),

          // Credit Days
          CommonTextField(
            'Credit Days',
            'Type Here',
            AppAssets.emptyWalletTime,
          ),

          // Shop Photo media picker
          CustomMediaPickerContainer(
            title: 'Shop Photo',
            titleColor: AppTheme.getColor(context).onSurfaceVariant,
            titleFontSize: 12 * getResponsiveText(context),
            imageTitle: 'Select Media',
            containerHeight: 100,
            multipleImage: 5,
            imagePath: 'assets/media_picker/gallery-export.png',
            backgroundColor: AppTheme.getColor(context).surfaceContainer,
            isCameraShow: true,
            isGalleryShow: true,
            isDocumentShow: true,
            isCropImage: true,
            imageTitleSize: 14 * getResponsiveText(context),
            imageTitleColor: AppTheme.getColor(context).onSurfaceVariant,
          ),

          //  space below media picker
          SizedBox(height: 0.03 * getHeight(context)),

          // Submit button
          MyCoButton(
            onTap: () {},
            title: 'SUBMIT',
            isShadowBottomLeft: true,
            boarderRadius: 50 * getResponsive(context),
            textStyle: TextStyle(
              fontSize: 20 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
              color: AppTheme.getColor(context).onPrimary,
            ),
          ),

          // Extra spacing at end
          const SizedBox(),
          const SizedBox(),
        ],
      ),
    ),
  );

  // Common text field widget
  Widget CommonTextField(
    String label,
    String hint,
    String iconPath, {
    bool readOnly = false,
    TextEditingController? controller,
    VoidCallback? onTap,
  }) => LabeledTextField(
    label: label,
    hint: hint,
    controller: controller,
    isReadOnly: readOnly,
    onClick: onTap,
    boarderRadius: 8 * getResponsive(context),
    labelTextStyle: TextStyle(
      color: AppTheme.getColor(context).onSurfaceVariant,
      fontSize: 12 * getResponsiveText(context),
      fontWeight: FontWeight.w700,
    ),
    hintTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppTheme.getColor(context).outline,
      fontSize: 14 * getResponsiveText(context),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 12 * getResponsive(context)),
    textAlignment: TextAlign.start,
    widthFactor: getWidth(context),
    prefix: SvgPicture.asset(iconPath, fit: BoxFit.scaleDown),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.getColor(context).outline),
    ),
  );
}
