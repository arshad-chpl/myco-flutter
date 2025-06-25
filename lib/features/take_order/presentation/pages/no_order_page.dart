import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class NoOrderPage extends StatelessWidget {
  const NoOrderPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.getColor(context).surface,
    appBar: AppBar(
      backgroundColor: AppColors.getColor(context).surface,
      title: Text('No Order'),
      leading: BackButton(),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * getWidth(context),
        vertical: 0.02 * getHeight(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reason',
            style: TextStyle(
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.w400,
            ),
          ),
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
          Text(
            'Remark',
            style: TextStyle(
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 0.01 * getHeight(context)),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
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
                    decoration: const InputDecoration(
                      hintText: 'Type Here',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
