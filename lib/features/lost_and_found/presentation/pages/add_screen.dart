import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_image_picker_container/custom_image_picker_containe.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LostAndFoundAddScreen extends StatefulWidget {
  const LostAndFoundAddScreen({super.key});

  @override
  State<LostAndFoundAddScreen> createState() => _LostAndFoundAddScreenState();
}

class _LostAndFoundAddScreenState extends State<LostAndFoundAddScreen> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController aboutItemController = TextEditingController();
  File? selectedImage;
  String selectedOption = 'Lost';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Row(
        children: [
          CustomText(
            isKey: true,
            'lost_and_found_title',
            fontWeight: FontWeight.w700,
            color: AppTheme.getColor(context).onSurface,
            fontSize: 18 * Responsive.getResponsive(context),
          ),
        ],
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: .020 * Responsive.getHeight(context)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomImagePickerContainer(
              image: SvgPicture.asset(
                AppAssets.gallaryExport,
                fit: BoxFit.scaleDown,
              ),
              iconSize: 20 * Responsive.getResponsive(context),
              title: 'select_image',
              isTitle: true,
              isGallaryShow: true,
              isCameraShow: true,
              isDocumentShow: true,
              borderRadius: 8,
              containerHeight: .079 * Responsive.getHeight(context),
              imageTitle: 'select_image',

              onImageSelected: (file) {
                setState(() {
                  selectedImage = file;
                });
              },
            ),
          ),
          SizedBox(height: .024 * Responsive.getHeight(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: CustomRadioButton(
              title: 'select',
              options: const ['lost', 'found'],
              height: .049 * Responsive.getHeight(context),
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
          ),
          SizedBox(height: .024 * Responsive.getHeight(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: LabeledTextField(
              maxLenght: 20,

              textFontSize: 12 * Responsive.getResponsiveText(context),
              contentPadding: const EdgeInsets.all(9),
              heightFactor: .044 * Responsive.getHeight(context),
              height: .044 * Responsive.getHeight(context),
              controller: itemNameController,
              boarderRadius: 8,

              textAlignment: TextAlign.start,
              label: 'item_name',
              hint: 'type_here',
              typingtextStyle: _typingStyle(context),
              hintTextStyle: _hintStyle(context),
              fontWeight: FontWeight.w700,
              textColor: AppTheme.getColor(context).onSurfaceVariant,
              widthFactor: Responsive.getWidth(context),
              prefix: SvgPicture.asset(
                AppAssets.clipboard,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),

          SizedBox(height: .024 * Responsive.getHeight(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomText(
              'About Item',
              isKey: true,
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),
          ),

          SizedBox(height: .005 * Responsive.getHeight(context)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: BigMyCoTextField(
              height: 0.140 * Responsive.getHeight(context),
              maxLines: 5,
              controller: aboutItemController,
              hintText: 'type_here',
              style: _typingStyle(context),
              hintStyle: _hintStyle(context),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
              ),
              // typingtextStyle: _typingStyle(context),
              // isLabelOn: true,
              prefixImage: SvgPicture.asset(AppAssets.messageEdit),
            ),
          ),
          SizedBox(height: .080 * Responsive.getHeight(context)),
        ],
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: MyCoButton(
        // onTap: () {
        //   final itemName = itemNameController.text.trim();
        //   final aboutItem = aboutItemController.text.trim();
        //   DateFormat('dd MMM yyyy (EEE)').format(DateTime.now());
        //
        //   if (selectedImage == null) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(content: Text('Please select an image')),
        //     );
        //   } else if (itemName.isEmpty) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(content: Text('Please enter item name')),
        //     );
        //   } else if (aboutItem.isEmpty) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(content: Text('Please enter item description')),
        //     );
        //   } else {
        //     Navigator.pop(
        //       context,
        //       LostAndFoundItemModel(
        //         image: selectedImage!,
        //         name: itemName,
        //         description: aboutItem,
        //         status: selectedOption,
        //         dateTime: DateTime.now(),
        //       ),
        //     );
        //   }
        // },
        onTap: () {
          final itemName = itemNameController.text.trim();
          final aboutItem = aboutItemController.text.trim();
          final statusInt = selectedOption.toLowerCase() == 'lost' ? 1 : 0;

          final formattedDate = DateFormat(
            'dd MMM yyyy (EEE)',
          ).format(DateTime.now());

          if (selectedImage == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select an image')),
            );
          } else if (itemName.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter item name')),
            );
          } else if (aboutItem.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter item description')),
            );
          } else {
            Navigator.pop(
              context,

              LostAndFoundItemModel(
                image: selectedImage!,
                name: itemName,
                description: aboutItem,
                status: statusInt.toString(), // ✔️ stored as '1' or '0'
                dateTime: DateTime.now(),
              ),
            );
          }
        },

        title: 'submit',
        boarderRadius: 50,
        isShadowBottomLeft: true,
        backgroundColor: AppTheme.getColor(context).primary,
        height: .050 * Responsive.getHeight(context),
        width: double.infinity,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 15 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
      ),
    ),
  );

  TextStyle _hintStyle(BuildContext context) => TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
    fontSize: 14 * Responsive.getResponsiveText(context),
    color: AppTheme.getColor(context).outline,
  );

  TextStyle _typingStyle(BuildContext context) => TextStyle(
    fontFamily: 'Gilroy-SemiBold',
    fontWeight: FontWeight.w400,
    fontSize: 14 * Responsive.getResponsiveText(context),
    color: AppColors.textPrimary,
  );
}
