import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/search_company/presentation/widgets/bottomsheet_radio_btn.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class SearchCompanyScreen extends StatelessWidget {
  const SearchCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: AppColors.welcomeGradient,
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 26 * getResponsive(context), right: 26 * getResponsive(context),top: 180 * getResponsive(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Image.asset("assets/search_society/search-company.png",
               width: 0.8 * getWidth(context),),
              SizedBox(height: 0.055 * getHeight(context)),
              CustomText(
                'Select Your Company',

                  fontSize: 30 * getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF101828),
                
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.014 * getHeight(context)),
              Text(
                'Your Journey Starts Here! Select your Company to register or sign in.',
                style: TextStyle(
                  fontSize: 15 * getResponsiveText(context),
                  color: const Color(0xFF475467),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.04 * getHeight(context)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Company Name',
                  style: TextStyle(
                    fontSize: 15 * getResponsiveText(context),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF101828),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 0.017 * getHeight(context)),
               MyCoTextfield(
                hintText: 'Search Your Company',
                hintTextStyle: TextStyle(
                  fontSize: 18 * getResponsiveText(context),
                  color: const Color(0xFF98A2B3),
                ),
                preFixImage: 'assets/search_society/company_icon.png',
        
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
                ),
                height: 0.02 * getHeight(context),
              
                
              ),
              SizedBox(height: 0.02 * getHeight(context)),
             MyCoButton(
                onTap: () {showModalBottomSheet(
            context: context,
            isScrollControlled: true,

            backgroundColor: Colors.transparent,
            builder: (_) => BottomsheetRadioButton(
              height: getHeight(context) * 0.9,
              showSnackBar: true,
              items: const [
                {
                  'id': '1',
                  'title': 'Delta Corporation Pvt. Ltd',
                  'subtitle':
                      'A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042',
                },
                {
                  'id': '2',
                  'title': 'Communities heritage Pvt. Ltd',
                  'subtitle':
                      'A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051',
                },
                {
                  'id': '3',
                  'title': 'Belta Corporation Pvt. Ltd',
                  'subtitle':
                      'A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042',
                },
                {
                  'id': '4',
                  'title': 'Zommunities heritage Pvt. Ltd',
                  'subtitle':
                      'A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051',
                },
                {
                  'id': '5',
                  'title': 'Aelta Corporation Pvt. Ltd',
                  'subtitle':
                      'A-305 3rd Floor Azure Corporation Trade Tower Starlight Sarkhej, Ahmedabad Gujarat 380042',
                },
                {
                  'id': '6',
                  'title': 'Jommunities heritage Pvt. Ltd',
                  'subtitle':
                      'A-Block, 5th Floor, WTT, World Trade Tower, Makarba, Sarkhej, Ahmedabad Gujarat 380051',
                },
              ],
            ),
          );},
                title: 'Search',
                width:  getWidth(context),
                height: 0.065 * getHeight(context),
                boarderRadius: 30,
                textStyle:  TextStyle(
                  fontSize: 18 * getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0xFF2F648E),
                isShadowBottomLeft: true,
              ),
            ],
          ),
        ),
      ) ,
    );
}