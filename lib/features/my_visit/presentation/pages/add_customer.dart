import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/custom_mobile_number_field.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
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
  String? selectedCity;
  final List<String> cityList = ['Ahmedabad', 'Surat', 'Rajkot', 'Vadodara'];

  String selectedCountry1 = 'INA';
  String selectedCountry2 = 'INA';

  final TextEditingController phoneController1 = TextEditingController();
  final TextEditingController phoneController2 = TextEditingController();

  final List<CountryModel> countryList = [
    CountryModel(name: 'INA', dialCode: '+91'),
    CountryModel(name: 'USA', dialCode: '+1'),
    CountryModel(name: 'AUSTRALIA', dialCode: '+61'),
    CountryModel(name: 'BELGIUM', dialCode: '+32'),
    CountryModel(name: 'EGYPT', dialCode: '+20'),
    CountryModel(name: 'LIBYA', dialCode: '+218'),
  ];
  final List<String> areaList = ['Maninagar', 'Navrangpura', 'Bopal', 'Iskon'];
  String? selectedAreaList;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      backgroundColor: AppTheme.getColor(context).surface,
      elevation: 0,
      title: CustomText(
        'Add Customer',
        fontSize: 16 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
        color: AppTheme.getColor(context).onSurface,
      ),
      leading: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.025 * Responsive.getHeight(context),
        ),
        child: Icon(
          Icons.arrow_back,
          size: 0.020 * Responsive.getHeight(context),
        ),
      ),
      leadingWidth: 60 * Responsive.getResponsive(context),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 32.0 * Responsive.getResponsive(context),
      ),
      child: Column(
        spacing: 16 * Responsive.getResponsive(context),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledTextField(
            label: 'Customer Company Name',
            labelTextStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),
            hintTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).outline,
              fontSize: 14 * Responsive.getResponsiveText(context),
            ),
            hint: 'Type Here',
            contentPadding: EdgeInsets.symmetric(
              vertical: 12 * Responsive.getResponsive(context),
            ),
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/building.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Customer Category',
            hint: 'Select Category',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/element-1.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Contact Person Name',
            hint: 'Type Here',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/profile-circle.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Contact Person Mobile Number',
                fontWeight: FontWeight.w700,
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              CustomMobileNumberField(
                countries: countryList,
                controller: phoneController1,
                hintText: '1234567890',
                hintTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w500,
                ),
                numberTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w500,
                ),
                height: 0.07 * Responsive.getHeight(context),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Alt. Phone Number',
                fontWeight: FontWeight.w700,
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              CustomMobileNumberField(
                countries: countryList,
                controller: phoneController2,
                hintText: '1234567890',
                hintTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w500,
                ),
                numberTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w500,
                ),
                height: 0.07 * Responsive.getHeight(context),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: LabeledTextField(
              label: 'Date Of Birth',
              hint: 'Enter Birth Date',
              textAlignment: TextAlign.start,
              widthFactor: Responsive.getWidth(context),
              prefix: SvgPicture.asset(
                'assets/visit/note-favorite.svg',
                fit: BoxFit.scaleDown,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
                borderRadius: BorderRadius.circular(
                  8 * Responsive.getResponsiveText(context),
                ),
              ),
            ),
          ),

          LabeledTextField(
            label: 'Anniversary Date',
            hint: 'Enter Anniversary Date',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/note-favorite.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Email ID',
            hint: 'Email',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/sms.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Select Location',
            hint: 'Select Location',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/location.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Address',
            hint: 'Type Here',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/home 1.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Pincode',
            hint: 'Type Here',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/lock.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  CustomText(
                    'City',
                    fontWeight: FontWeight.w700,
                    fontSize: 15 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/visit/Frame 1000003425.svg',
                    ),
                  ),
                  SizedBox(width: 0.02 * Responsive.getWidth(context)),
                  CustomText(
                    'Add City',
                    fontWeight: FontWeight.w700,
                    fontSize: 15 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                ],
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              CustomPopupDropdownStyled<String>(
                items: cityList,
                selectedItem: selectedCity,
                hintText: 'State not assigned',
                itemToString: (item) => item,
                onChanged: (value, index) {},
                borderRadius: 8 * Responsive.getResponsive(context),
                popupElevation: 6 * Responsive.getResponsive(context),
                spacing: 25 * Responsive.getResponsive(context),
                hintTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w600,
                ),
                prefix: SvgPicture.asset('assets/visit/note-favorite.svg'),
                border: Border.all(color: AppTheme.getColor(context).outline),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  CustomText(
                    'Area',
                    fontWeight: FontWeight.w700,
                    fontSize: 15 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/visit/Frame 1000003425.svg',
                    ),
                  ),
                  SizedBox(width: 0.02 * Responsive.getWidth(context)),
                  CustomText(
                    'Add Area',
                    fontWeight: FontWeight.w700,
                    fontSize: 15 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                ],
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              CustomPopupDropdownStyled<String>(
                items: areaList,
                selectedItem: selectedAreaList,
                hintText: 'Select Area',
                itemToString: (item) => item,
                onChanged: (value, index) {},
                borderRadius: 8 * Responsive.getResponsive(context),
                popupElevation: 6 * Responsive.getResponsive(context),
                spacing: 25 * Responsive.getResponsive(context),
                hintTextStyle: TextStyle(
                  color: AppTheme.getColor(context).outline,
                  fontWeight: FontWeight.w600,
                ),
                prefix: SvgPicture.asset('assets/visit/note-favorite.svg'),
                border: Border.all(color: AppTheme.getColor(context).outline),
              ),
            ],
          ),
          LabeledTextField(
            label: 'Retailer Type',
            hint: 'Select ',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/business-and-trade 1.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Website',
            hint: 'Type Here',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/global.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'GST Number',
            hint: 'Type Here',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/Group 1410104499.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Select Distributor',
            hint: 'Select Distributor',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/card-coin.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Credit Limit',
            hint: 'Type Here',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/bitcoin-card.svg',
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          LabeledTextField(
            label: 'Credit Days',
            hint: 'Type Here',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            prefix: SvgPicture.asset(
              'assets/visit/empty-wallet-time.svg',
              fit: BoxFit.scaleDown,
            ),

            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                8 * Responsive.getResponsiveText(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomMediaPickerContainer(
              title: 'Shop Photo',
              titleColor: AppTheme.getColor(context).onSurfaceVariant,
              titleFontSize: 14,
              imageTitle: 'Select Media',
              containerHeight: 100,
              multipleImage: 1,
              imagePath: 'assets/media_picker/gallery-export.png',
              backgroundColor: AppTheme.getColor(context).surfaceContainer,
              isCameraShow: true,
              isGalleryShow: true,
              isDocumentShow: true,
              isCropImage: true,
            ),
          ),
          SizedBox(height: 0.03 * Responsive.getHeight(context)),
          MyCoButton(
            onTap: () {},
            title: 'SUBMIT',
            isShadowBottomLeft: true,
            boarderRadius: 50 * Responsive.getResponsive(context),
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppTheme.getColor(context).onPrimary,
            ),
          ),
          SizedBox(),
        ],
      ),
    ),
  );
}
