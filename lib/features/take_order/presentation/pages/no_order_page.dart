import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class NoOrderPage extends StatelessWidget {
  const NoOrderPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: CustomText(
        'No Order',
        fontSize: 20 * getResponsiveText(context),
        fontWeight: FontWeight.w700,
      ),
      leading: const BackButton(),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * getWidth(context),
        vertical: 0.02 * getHeight(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('Reason', fontSize: 14 * getResponsiveText(context)),
          SizedBox(height: 0.01 * getHeight(context)),
          DropdownMenu(
            width: 0.9 * getWidth(context),
            hintText: 'Select',

            leadingIcon: const Icon(Icons.notes),
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: '1',
                label: 'select',
                leadingIcon: Icon(Icons.notes),
              ),
            ],
          ),

          SizedBox(height: 0.02 * getHeight(context)),
          // Remark Section
          CustomText('Remark', fontSize: 14 * getResponsiveText(context)),
          SizedBox(height: 0.01 * getHeight(context)),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(12 * getResponsive(context)),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 0.018 * getWidth(context),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 0.01 * getHeight(context)),
                  child: Image.asset(
                    'assets/take_order/message-edit.png',
                    height: 0.025 * getHeight(context),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    maxLines: 5,
                    minLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Type Here',
                      hintStyle: TextStyle(
                        color: AppTheme.getColor(context).outline,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          MyCoButton(
            onTap: () {},
            title: 'SUBMIT',
            height: 0.05 * getHeight(context),
            boarderRadius: 30 * getResponsive(context),
          ),
          SizedBox(height: 0.02 * getHeight(context)),
        ],
      ),
    ),
  );
}
