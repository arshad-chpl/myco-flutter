// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';
// import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';
// import 'chat_screen.dart';
// import 'country_code_txtf.dart';
//
// class ItemDetailsScreen extends StatefulWidget {
//   final Map<String, dynamic> item;
//
//   const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);
//
//   @override
//   State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
// }
//
// class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
//   late Map<String, dynamic> item;
//   String selectedCountry = 'IND';
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController descController = TextEditingController();
//   final TextEditingController contactPersonNameController =
//       TextEditingController(text: 'Name');
//   final TextEditingController branchController = TextEditingController(
//     text: 'Branch',
//   );
//   final TextEditingController departmentController = TextEditingController(
//     text: 'Department',
//   );
//   final phoneController = TextEditingController(text: '898298299');
//
//   final List<CountryModel> countryList = [
//     CountryModel(name: 'INA', dialCode: '+91'),
//     CountryModel(name: 'USA', dialCode: '+1'),
//     CountryModel(name: 'AUSTRALIA', dialCode: '+61'),
//     CountryModel(name: 'BELGIUM', dialCode: '+32'),
//     CountryModel(name: 'EGYPT', dialCode: '+20'),
//     CountryModel(name: 'LIBYA', dialCode: '+218'),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     item = widget.item;
//     nameController.text = item['name'] ?? '';
//     descController.text = item['desc'] ?? '';
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       scrolledUnderElevation: 0,
//       elevation: 0,
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back, color: Colors.black),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//       title: Text(
//         'Item Found',
//         style: TextStyle(
//           fontFamily: 'Gilroy-Bold',
//           fontSize: 18,
//           fontWeight: FontWeight.w400,
//           color: AppTheme.getColor(context).onSurfaceVariant,
//         ),
//       ),
//       centerTitle: false,
//     ),
//     body: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16 * getResponsive(context)),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               height: 0.18 * getHeight(context),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFEEF7FD),
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: const Color(0xFF2F648E)),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: item['image'] != null
//                     ? Image.file(
//                         item['image'] as File,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       )
//                     : const Center(child: Text('No Image')),
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: const Color(0xFF2F648E)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildLabel(context, 'Item Name'),
//                   const SizedBox(height: 4),
//
//                   MyCoTextField(
//                     height: 44,
//                     typingtextStyle: _typingStyle(context),
//
//                     controller: nameController,
//                     isReadOnly: true,
//                     hintTextStyle: _hintStyle(context),
//                     prefix: _prefixIcon('assets/lost_and_found/item-name.png'),
//                     contentPadding: _contentPadding(context),
//                     isSuffixIconOn: null,
//                   ),
//                   const SizedBox(height: 12),
//
//                   _buildLabel(context, 'Description'),
//                   const SizedBox(height: 4),
//
//                   MyCoTextField(
//                     height: 44,
//                     typingtextStyle: _typingStyle(context),
//
//                     controller: descController,
//                     isReadOnly: true,
//                     hintTextStyle: _hintStyle(context),
//                     prefix: _prefixIcon(
//                       'assets/lost_and_found/message-edit.png',
//                     ),
//                     contentPadding: _contentPadding(context),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             _buildHeader(context, 'Contact Details'),
//             const SizedBox(height: 16),
//             _buildLabel(context, 'Contact Person Name'),
//             const SizedBox(height: 4),
//             MyCoTextField(
//               height: 44,
//               typingtextStyle: _typingStyle(context),
//               controller: contactPersonNameController,
//               isReadOnly: true,
//               hintText: item['contactName'] ?? 'Name',
//               hintTextStyle: _hintStyle(context),
//               prefix: _prefixIcon('assets/lost_and_found/profile-circle.png'),
//               contentPadding: _contentPadding(context),
//             ),
//             const SizedBox(height: 16),
//
//             _buildLabel(context, 'Contact Person Mobile Number'),
//             const SizedBox(height: 4),
//
//             CustomMobileNumberField(
//               readOnly: true,
//               width: 200,
//               height: 44,
//               // dropdownHeight: 200,
//               // dropdownWidth: 600,
//               // dropdownWidth: 200,
//               dropdownHeight: 200,
//               countries: countryList,
//               controller: phoneController,
//               onCountryChanged: (selected) {
//                 print(
//                   'Selected country: ${selected.name} (${selected.dialCode})',
//                 );
//               },
//             ),
//             const SizedBox(height: 16),
//
//             _buildLabel(context, 'Branch'),
//             const SizedBox(height: 4),
//
//             MyCoTextField(
//               height: 44,
//               typingtextStyle: _typingStyle(context),
//               controller: branchController,
//               isReadOnly: true,
//               hintText: item['branch'] ?? 'Branch',
//               hintTextStyle: _hintStyle(context),
//               prefix: _prefixIcon('assets/lost_and_found/data.png'),
//
//               contentPadding: _contentPadding(context),
//             ),
//             const SizedBox(height: 16),
//
//             _buildLabel(context, 'Department'),
//             const SizedBox(height: 4),
//
//             MyCoTextField(
//               height: 44,
//               controller: departmentController,
//               typingtextStyle: _typingStyle(context),
//               isReadOnly: true,
//               hintText: item['department'] ?? 'Department',
//               hintTextStyle: _hintStyle(context),
//               prefix: _prefixIcon('assets/lost_and_found/note-favorite.png'),
//               contentPadding: _contentPadding(context),
//             ),
//             SizedBox(height: 0.03 * getHeight(context)),
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: MyCoButton(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ChatScreen()),
//                   );
//                 },
//                 title: 'CHAT',
//                 isShadowBottomLeft: true,
//                 boarderRadius: 50,
//                 fontFamily: 'Gilroy-Bold',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//
//   TextStyle _hintStyle(BuildContext context) => const TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: Colors.black54,
//   );
//
//   TextStyle _typingStyle(BuildContext context) => TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: AppTheme.getColor(context).onSurfaceVariant,
//   );
//
//   EdgeInsets _contentPadding(BuildContext context) =>
//       EdgeInsets.symmetric(vertical: 14 * getResponsive(context));
//
//   Widget _prefixIcon(String assetPath) => Padding(
//     padding: const EdgeInsets.all(12.0) * getResponsive(context),
//     child: Image.asset(
//       assetPath,
//       width: 0.020 * getWidth(context),
//       height: 0.20 * getHeight(context),
//       fit: BoxFit.contain,
//     ),
//   );
//
//   Widget _buildLabel(BuildContext context, String label) => CustomText(
//     label,
//     fontSize: 12 * getResponsive(context),
//     fontWeight: FontWeight.w700,
//     color: AppTheme.getColor(context).onSurface,
//   );
//
//   Widget _buildHeader(BuildContext context, String header) => Padding(
//     padding: EdgeInsets.only(bottom: 0.01 * getHeight(context)),
//     child: CustomText(
//       header,
//       color: AppTheme.getColor(context).onPrimaryFixedVariant,
//       fontSize: 18 * getResponsive(context),
//       fontWeight: FontWeight.w700,
//     ),
//   );
// }


//============================   with model class  ============================================
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/model/lost_and_found_item_model.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/chat_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/country_code_txtf.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ItemDetailsScreen extends StatefulWidget {
  final LostAndFoundItemModel item;

  const ItemDetailsScreen({required this.item, super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  String selectedCountry = 'IND';

  final TextEditingController contactPersonNameController =
      TextEditingController(text: 'Name');
  final TextEditingController branchController = TextEditingController(
    text: 'Branch',
  );
  final TextEditingController departmentController = TextEditingController(
    text: 'Department',
  );
  final phoneController = TextEditingController(text: '898298299');

  final List<CountryModel> countryList = [
    CountryModel(name: 'INA', dialCode: '+91'),
    CountryModel(name: 'USA', dialCode: '+1'),
    CountryModel(name: 'AUSTRALIA', dialCode: '+61'),
    CountryModel(name: 'BELGIUM', dialCode: '+32'),
    CountryModel(name: 'EGYPT', dialCode: '+20'),
    CountryModel(name: 'LIBYA', dialCode: '+218'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Item Found',
        style: TextStyle(
          fontFamily: 'Gilroy-Bold',
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppTheme.getColor(context).onSurfaceVariant,
        ),
      ),
      centerTitle: false,
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16 * getResponsive(context)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _imagePreview(widget.item.image),
             SizedBox(height: .016 * getHeight(context)),
            _itemDetails(context),
             SizedBox(height: .024 * getHeight(context)),
            _buildHeader(context, 'Contact Details'),
             SizedBox(height: .016 * getHeight(context)),
            _readOnlyField(
              'Contact Person Name',
              contactPersonNameController,
              'assets/lost_and_found/profile-circle.png',
            ),
             SizedBox(height: .016 * getHeight(context)),
            _buildLabel(context, 'Contact Person Mobile Number'),
             SizedBox(height: .004 * getHeight(context)),
            CustomMobileNumberField(
              numberTextStyle: _typingStyle(context),
              hintTextStyle: _hintStyle(context),
              readOnly: true,
              width: 200,
              height: 44,
              dropdownHeight: .200 * getHeight(context),
              countries: countryList,
              controller: phoneController,
              onCountryChanged: (selected) {},
            ),
             SizedBox(height: .016 * getHeight(context)),
            _readOnlyField(
              'Branch',
              branchController,
              'assets/lost_and_found/data.png',
            ),
             SizedBox(height: .016 * getHeight(context)),
            _readOnlyField(
              'Department',
              departmentController,
              'assets/lost_and_found/note-favorite.png',
            ),
            SizedBox(height: 0.03 * getHeight(context)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyCoButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChatScreen()),
                ),
                title: 'CHAT',
                isShadowBottomLeft: true,
                boarderRadius: 50,
                fontFamily: 'Gilroy-Bold',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _imagePreview(File image) => Container(
    height: 0.18 * getHeight(context),
    decoration: BoxDecoration(
      color: const Color(0xFFEEF7FD),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color(0xFF2F648E)),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Image.file(image, fit: BoxFit.cover, width: double.infinity),
    ),
  );

  Widget _itemDetails(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFF2F648E)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(context, 'Item Name'),
         SizedBox(height: .004 * getHeight(context)),
        MyCoTextField(
          height: .048 * getHeight(context),
          controller: TextEditingController(text: widget.item.name),
          isReadOnly: true,
          typingtextStyle: _typingStyle(context),
          hintTextStyle: _hintStyle(context),
          prefix: _prefixIcon('assets/lost_and_found/item-name.png'),
          contentPadding: _contentPadding(context),
        ),
         SizedBox(height: .012 * getHeight(context)),
        _buildLabel(context, 'Description'),
         SizedBox(height: .004 * getHeight(context)),
        MyCoTextField(
          height: .048 * getHeight(context),
          controller: TextEditingController(text: widget.item.description),
          isReadOnly: true,
          typingtextStyle: _typingStyle(context),
          hintTextStyle: _hintStyle(context),
          prefix: _prefixIcon('assets/lost_and_found/message-edit.png'),
          contentPadding: _contentPadding(context),
        ),
      ],
    ),
  );

  Widget _readOnlyField(
    String label,
    TextEditingController controller,
    String iconPath,
  ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildLabel(context, label),
       SizedBox(height: .004 * getHeight(context) ),
      MyCoTextField(
        height: 44 * getResponsive(context),
        controller: controller,
        isReadOnly: true,
        typingtextStyle: _typingStyle(context),
        hintTextStyle: _typingStyle(context),
        prefix: _prefixIcon(iconPath),
        contentPadding: _contentPadding(context),
      ),
    ],
  );

  TextStyle _hintStyle(BuildContext context) =>   TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
    fontSize: 14 * getResponsive(context),
    color: AppColors.textfieldBorder,
  );

  TextStyle _typingStyle(BuildContext context) =>  TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
    fontSize: 14 * getResponsive(context),
    color: AppColors.textPrimary,
  );

  EdgeInsets _contentPadding(BuildContext context) =>
      EdgeInsets.symmetric(vertical: 14 * getResponsive(context));

  Widget _prefixIcon(String assetPath) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Image.asset(
      assetPath,
      width: 0.020 * getWidth(context),
      height: 0.20 * getHeight(context),
      fit: BoxFit.contain,
    ),
  );

  Widget _buildLabel(BuildContext context, String label) => CustomText(
    label,
    fontSize: 12 * getResponsive(context),
    fontWeight: FontWeight.w700,
    color: AppTheme.getColor(context).onSurfaceVariant,
  );

  Widget _buildHeader(BuildContext context, String header) => Padding(
    padding: EdgeInsets.only(bottom: 0.01 * getHeight(context)),
    child: CustomText(
      header,
      color: AppTheme.getColor(context).onSurface,
      fontSize: 18 * getResponsive(context),
      fontWeight: FontWeight.w700,
    ),
  );
}

//================================responsive==================================

// import 'dart:io';
// import 'package:flutter/material.dart';
// import '../custom_widgets/new_myco_button.dart';
// import '../custom_widgets/responsive.dart';
// import '../custom_widgets/text_field.dart';
// import '../themes_colors/colors.dart';
// import 'chat_screen.dart';
// import 'country_code_txtf.dart';
//
// class ItemDetailsScreen extends StatefulWidget {
//   final Map<String, dynamic> item;
//
//   const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);
//
//   @override
//   State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
// }
//
// class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
//   late Map<String, dynamic> item;
//   String selectedCountry = 'IND';
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController descController = TextEditingController();
//   final TextEditingController contactPersonNameController =
//       TextEditingController(text: "Name");
//   final TextEditingController branchController = TextEditingController(
//     text: "Branch",
//   );
//   final TextEditingController departmentController = TextEditingController(
//     text: "Department",
//   );
//   final phoneController = TextEditingController(text: "898298299");
//
//   final List<CountryModel> countryList = [
//     CountryModel(name: 'INA', dialCode: '+91'),
//     CountryModel(name: 'USA', dialCode: '+1'),
//     CountryModel(name: 'AUSTRALIA', dialCode: '+61'),
//     CountryModel(name: 'BELGIUM', dialCode: '+32'),
//     CountryModel(name: 'EGYPT', dialCode: '+20'),
//     CountryModel(name: 'LIBYA', dialCode: '+218'),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     item = widget.item;
//     nameController.text = item['name'] ?? '';
//     descController.text = item['desc'] ?? '';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double res = getResponsive(context);
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F7FB),
//       appBar: AppBar(
//         scrolledUnderElevation: 0,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Item Found',
//           style: TextStyle(
//             fontFamily: "Gilroy-Bold",
//             fontSize: 18,
//             fontWeight: FontWeight.w400,
//             color: AppColors.subTitleColor,
//           ),
//         ),
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16 * res),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 height: 0.18 * getHeight(context),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFEEF7FD),
//                   borderRadius: BorderRadius.circular(10 * res),
//                   border: Border.all(color: const Color(0xFF2F648E)),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10 * res),
//                   child: item['image'] != null
//                       ? Image.file(
//                           item['image'] as File,
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         )
//                       : const Center(child: Text('No Image')),
//                 ),
//               ),ss
//               SizedBox(height: 16 * res),
//
//               Container(
//                 padding: EdgeInsets.all(12 * res),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12 * res),
//                   border: Border.all(color: const Color(0xFF2F648E)),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildLabel(context, 'Item Name'),
//                     SizedBox(height: 4 * res),
//                     MyCoTextField(
//                       height: 44 * res,
//                       typingtextStyle: _typingStyle(context),
//                       controller: nameController,
//                       isReadOnly: true,
//                       hintTextStyle: _hintStyle(context),
//                       prefix: _prefixIcon(
//                         'assets/lost_and_found/item-name.png',
//                       ),
//                       contentPadding: _contentPadding(context),
//                       isSuffixIconOn: null,
//                     ),
//                     SizedBox(height: 12 * res),
//                     _buildLabel(context, 'Description'),
//                     SizedBox(height: 4 * res),
//                     MyCoTextField(
//                       height: 44 * res,
//                       typingtextStyle: _typingStyle(context),
//                       controller: descController,
//                       isReadOnly: true,
//                       hintTextStyle: _hintStyle(context),
//                       prefix: _prefixIcon(
//                         'assets/lost_and_found/message-edit.png',
//                       ),
//                       contentPadding: _contentPadding(context),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24 * res),
//               _buildHeader(context, 'Contact Details'),
//               SizedBox(height: 16 * res),
//               _buildLabel(context, 'Contact Person Name'),
//               SizedBox(height: 4 * res),
//               MyCoTextField(
//                 height: 44 * res,
//                 typingtextStyle: _typingStyle(context),
//                 controller: contactPersonNameController,
//                 isReadOnly: true,
//                 hintText: item['contactName'] ?? 'Name',
//                 hintTextStyle: _hintStyle(context),
//                 prefix: _prefixIcon('assets/lost_and_found/profile-circle.png'),
//                 contentPadding: _contentPadding(context),
//               ),
//               SizedBox(height: 16 * res),
//               _buildLabel(context, 'Contact Person Mobile Number'),
//               SizedBox(height: 4 * res),
//               CustomMobileNumberField(
//                 // readOnly: true,
//                 // width: 200 * res,
//                 height: 46 * res,
//                 dropdownHeight: 200 * res,
//                 countries: countryList,
//                 controller: phoneController,
//                 onCountryChanged: (selected) {
//                   print(
//                     "Selected country: ${selected.name} (${selected.dialCode})",
//                   );
//                 },
//               ),
//               SizedBox(height: 16 * res),
//               _buildLabel(context, 'Branch'),
//               SizedBox(height: 4 * res),
//               MyCoTextField(
//                 height: 44 * res,
//                 typingtextStyle: _typingStyle(context),
//                 controller: branchController,
//                 isReadOnly: true,
//                 hintText: item['branch'] ?? 'Branch',
//                 hintTextStyle: _hintStyle(context),
//                 prefix: _prefixIcon('assets/lost_and_found/data.png'),
//                 contentPadding: _contentPadding(context),
//               ),
//               SizedBox(height: 16 * res),
//               _buildLabel(context, 'Department'),
//               SizedBox(height: 4 * res),
//               MyCoTextField(
//                 height: 44 * res,
//                 controller: departmentController,
//                 typingtextStyle: _typingStyle(context),
//                 isReadOnly: true,
//                 hintText: item['department'] ?? 'Department',
//                 hintTextStyle: _hintStyle(context),
//                 prefix: _prefixIcon('assets/lost_and_found/note-favorite.png'),
//                 contentPadding: _contentPadding(context),
//               ),
//               SizedBox(height: 0.03 * getHeight(context)),
//               Padding(
//                 padding: EdgeInsets.all(8.0 * res),
//                 child: MyCoButton(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ChatScreen()),
//                     );
//                   },
//                   title: 'CHAT',
//                   isShadowBottomLeft: true,
//                   boarderRadius: 50,
//                   fontFamily: 'Gilroy-Bold',
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   TextStyle _hintStyle(BuildContext context) => const TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: Colors.black54,
//   );
//
//   TextStyle _typingStyle(BuildContext context) => TextStyle(
//     fontFamily: 'Gilroy-SemiBold',
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//     color: AppColors.textFieldColor,
//   );
//
//   EdgeInsets _contentPadding(BuildContext context) =>
//       EdgeInsets.symmetric(vertical: 14 * getResponsive(context));
//
//   Widget _prefixIcon(String assetPath) => Padding(
//     padding: EdgeInsets.all(12.0 * getResponsive(context)),
//     child: Image.asset(
//       assetPath,
//       width: 0.020 * getWidth(context),
//       height: 0.20 * getHeight(context),
//       fit: BoxFit.contain,
//     ),
//   );
//
//   Widget _buildLabel(BuildContext context, String label) => Text(
//     label,
//     style: TextStyle(
//       fontSize: 12,
//       fontFamily: 'Gilroy-Bold',
//       fontWeight: FontWeight.w400,
//       color: AppColors.titleColor,
//     ),
//   );
//
//   Widget _buildHeader(BuildContext context, String header) => Padding(
//     padding: EdgeInsets.only(bottom: 0.01 * getHeight(context)),
//     child: Text(
//       header,
//       style: TextStyle(
//         color: const Color(0xff000000),
//         fontSize: 18,
//         fontFamily: 'Gilroy-Bold',
//         fontWeight: FontWeight.w400,
//       ),
//     ),
//   );
// }
