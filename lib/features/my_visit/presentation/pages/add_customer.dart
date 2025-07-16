import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
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
  final List<String> areaList = [
    'PrahaladNagar',
    'RamdevNagar',
    'KrishnaNagar',
    'Thaltej',
  ];

  // Country code selections for phone number fields
  String selectedCountry1 = 'INA';
  String selectedCountry2 = 'INA';

  // Controllers for phone number text fields
  final TextEditingController phoneController1 = TextEditingController();
  final TextEditingController phoneController2 = TextEditingController();
  final TextEditingController anniversaryController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

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
          iconSize: WidgetStatePropertyAll(0.05 * Responsive.getWidth(context)),
        ),
      ),
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      elevation: 0,
      title: 'add_customer',
      isKey: true,
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0 * Responsive.getResponsive(context),
      ),

      child: Column(
        spacing: 16 * Responsive.getResponsive(context),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Customer Company Name
          CommonTextField(
            'Customer Company Name',
            LanguageManager().get('type_here'),
            AppAssets.building,
          ),

          // Customer Category
          CommonTextField(
            'customer_category',
            LanguageManager().get('select_category'),
            AppAssets.element,
          ),

          // Contact Person Name
          CommonTextField(
            'contact_person_name',
            LanguageManager().get('type_here'),
            AppAssets.profileCircle,
          ),

          // Contact Person Mobile Number field with country code
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'contact_person_mobile',
                fontWeight: FontWeight.w700,
                fontSize: 12 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              PhoneField(
                selectedCountry: selectedCountry1,
                countries: countryMap.keys.toList(),
                onCountryChanged: (_) {},
                controller: phoneController1,
                countryDialCodes: countryMap,
                borderRadius: 5 * Responsive.getResponsive(context),
                textFieldHeight: 47,
                borderColor: AppTheme.getColor(context).outline,
                hintText: '000 00 000 00',
                phoneFontWeight: FontWeight.w600,
                hintTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                ),
                countryFontSize: 16 * Responsive.getResponsiveText(context),
                countryCodeFontSize: 14 * Responsive.getResponsiveText(context),
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
                'alternate_phone_number',
                fontWeight: FontWeight.w700,
                fontSize: 12 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              PhoneField(
                selectedCountry: selectedCountry2,
                countries: countryMap.keys.toList(),
                onCountryChanged: (_) {},
                controller: phoneController2,
                countryDialCodes: countryMap,
                borderRadius: 5 * Responsive.getResponsive(context),
                textFieldHeight: 47,
                borderColor: AppTheme.getColor(context).outline,
                hintText: '000 00 000 00',
                phoneFontWeight: FontWeight.w600,
                hintTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                ),
                countryFontSize: 16 * Responsive.getResponsiveText(context),
                countryCodeFontSize: 14 * Responsive.getResponsiveText(context),
                countryCodeTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                ),
              ),
            ],
          ),

          // Date Of Birth
          CommonTextField(
            'anniversary_date',
            'Enter Anniversary Date',
            AppAssets.date,
            controller: birthDateController,
            readOnly: true,
            onTap: () async {
              final result = await showModalBottomSheet<Map<String, int>>(
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
            'date_of_birth',
            'Enter Birth Date',
            AppAssets.date,
            readOnly: true,
            controller: anniversaryController,
            onTap: () async {
              final result = await showModalBottomSheet<Map<String, int>>(
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
          CommonTextField(
            'email_id',
            LanguageManager().get('email_contact_finca'),
            AppAssets.sms,
          ),

          // Select Location
          CommonTextField(
            'select_location',
            LanguageManager().get('select_location'),
            AppAssets.locationVisit,
          ),

          // Address
          CommonTextField(
            'address',
            LanguageManager().get('type_here'),
            AppAssets.home,
          ),

          // Pincode
          CommonTextField(
            'pincode',
            LanguageManager().get('type_here'),
            AppAssets.lock,
          ),

          // City dropdown with Add button
          Column(
            children: [
              LabelWithAddButton(
                label: 'city',
                actionText: 'add_city',
                onTap: () {},
                iconPath: AppAssets.addButton,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              CustomPopupDropdownStyled<String>(
                items: cityList,
                selectedItem: selectedCity,
                hintText: LanguageManager().get('state_not_assigned'),
                itemToString: (item) => item,
                onChanged: (value, index) {},
                borderRadius: 8 * Responsive.getResponsive(context),
                popupElevation: 6 * Responsive.getResponsive(context),
                spacing: 25 * Responsive.getResponsive(context),
                hintTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).outline,
                  fontSize: 14 * Responsive.getResponsiveText(context),
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
                label: 'area',
                actionText: 'add_area',
                onTap: () {},
                iconPath: AppAssets.addButton,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              CustomPopupDropdownStyled<String>(
                items: areaList,
                selectedItem: selectedAreaList,
                hintText: LanguageManager().get('select_area'),
                itemToString: (item) => item,
                onChanged: (value, index) {},
                borderRadius: 8 * Responsive.getResponsive(context),
                popupElevation: 6 * Responsive.getResponsive(context),
                spacing: 25 * Responsive.getResponsive(context),
                hintTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).outline,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                ),
                prefix: SvgPicture.asset(AppAssets.map),
                border: Border.all(color: AppTheme.getColor(context).outline),
              ),
            ],
          ),

          // Retailer Type
          CommonTextField(
            'retailer_type',
            LanguageManager().get('select'),
            AppAssets.businessAndTrade,
          ),

          // Website
          CommonTextField(
            'website_contact_finca',
            LanguageManager().get('type_here'),
            AppAssets.global,
          ),

          // GST Number
          CommonTextField(
            'tax_number',
            LanguageManager().get('type_here'),
            AppAssets.gst,
          ),

          // Select Distributor
          CommonTextField(
            'select_distributor',
            LanguageManager().get('select_distributor'),
            AppAssets.cardCoin,
          ),

          // Credit Limit
          CommonTextField(
            'credit_limit',
            LanguageManager().get('type_here'),
            AppAssets.bitCinCard,
          ),

          // Credit Days
          CommonTextField(
            'credit_days',
            LanguageManager().get('type_here'),
            AppAssets.emptyWalletTime,
          ),

          // Shop Photo media picker
          CustomMediaPickerContainer(
            title: 'shop_photo',
            titleColor: AppTheme.getColor(context).onSurfaceVariant,
            titleFontSize: 12 * Responsive.getResponsiveText(context),
            imageTitle: 'select_media',
            containerHeight: 100,
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

          //  space below media picker
          SizedBox(height: 0.03 * Responsive.getHeight(context)),

          // Submit button
          MyCoButton(
            onTap: () {},
            title: LanguageManager().get('submit'),
            isShadowBottomLeft: true,
            boarderRadius: 50 * Responsive.getResponsive(context),
            textStyle: TextStyle(
              fontSize: 20 * Responsive.getResponsiveText(context),
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
    textColor: AppTheme.getColor(context).onSurfaceVariant,
    textFontSize: 12 * Responsive.getResponsiveText(context),
    controller: controller,
    isReadOnly: readOnly,
    heightFactor: 44,
    onClick: onTap,
    boarderRadius: 8 * Responsive.getResponsive(context),
    contentPadding: EdgeInsets.all(9 * Responsive.getResponsive(context)),
    hintTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppTheme.getColor(context).outline,
      fontSize: 14 * Responsive.getResponsiveText(context),
    ),
    textAlignment: TextAlign.start,
    widthFactor: Responsive.getWidth(context),
    prefix: SvgPicture.asset(iconPath, fit: BoxFit.scaleDown),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.getColor(context).outline),
    ),
  );
}
