import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AllDistributorPage extends StatelessWidget {
  const AllDistributorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.bgWhite,
    appBar: AppBar(
      backgroundColor: AppColors.bgWhite,
      leading: const BackButton(),
      title: const Text('All Distributor'),
    ),

    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * getWidth(context),
        vertical: 0.02 * getHeight(context),
      ),
      child: Column(
        children: [
          MyCoTextfield(
            prefix: const Icon(Icons.search),
            hintText: 'Search',

            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black38),
              borderRadius: BorderRadius.circular(12 * getResponsive(context)),
            ),
          ),
          SizedBox(height: 0.02 * getHeight(context)),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => InkWell(
                onTap: () => context.pushNamed('distributor-visitor'),
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DistributorVisitorPage(),
                //   ),
                // ),
                child: DistributorCard(
                  headerHeight: 0.05 * getHeight(context),
                  title: 'Mukund',
                  bottomWidget: Padding(
                    padding: EdgeInsets.all(8 * getResponsive(context)),
                    child: Column(
                      children: [
                        getCommonRow(
                          context,
                          icon: Icons.person,
                          title: 'Manish',
                          isRadio: true,
                        ),
                        getCommonRow(
                          context,
                          icon: Icons.email,
                          title: 'Mukund@yopmail.com',
                        ),
                        SizedBox(height: 0.01 * getHeight(context)),
                        getCommonRow(
                          context,
                          icon: Icons.call,
                          title: '+919909945983',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.01 * getHeight(context)),
            ),
          ),
        ],
      ),
    ),
  );

  Row getCommonRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    bool isRadio = false,
  }) => Row(
    children: [
      Icon(icon),
      SizedBox(width: 0.01 * getWidth(context)),
      Text(title, style: TextStyle(fontSize: 16 * getResponsiveText(context))),
      const Spacer(),
      isRadio
          ? Radio(value: true, groupValue: '', onChanged: (value) {})
          : const SizedBox.shrink(),
    ],
  );
}
