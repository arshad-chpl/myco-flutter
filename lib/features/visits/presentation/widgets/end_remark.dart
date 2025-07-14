import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/get_common_row.dart';

class EndRemark extends StatelessWidget {
  const EndRemark({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getCommonRow(
          context,
          title: 'End Visit Remark',
          value: 'sdfsdasgas',
          textColor: AppTheme.getColor(context).onSurface,
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'End Visit Area',
          value: 'sdfsdasgas',
          textColor: AppTheme.getColor(context).onSurface,
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'End Visit Catalogue',
          value: 'sdfsdasgas',
          textColor: AppTheme.getColor(context).onSurface,
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'Contact Person number',
          valueWidget: RichText(
            text: TextSpan(
              text: '+91 ',
              style: TextStyle(
                color: AppTheme.getColor(context).primary,
                fontSize: 12 * getResponsiveText(context),
              ),
              children: [
                TextSpan(
                  text: '9356326355',
                  style: TextStyle(
                    color: AppTheme.getColor(context).onSurface,
                    fontSize: 12 * getResponsiveText(context),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {},
          value: '',
        ),
      ],
    );
  }
}
