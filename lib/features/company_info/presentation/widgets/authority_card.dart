import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthorityCard extends StatelessWidget {
  final Commitie authority;
  final BuildContext context;

  const AuthorityCard({
    super.key,
    required this.authority,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.getColor(context);

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  (authority.adminProfile != null &&
                      authority.adminProfile!.isNotEmpty)
                  ? NetworkImage(authority.adminProfile!)
                  : const AssetImage('assets/default_avatar.png')
                        as ImageProvider,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authority.adminName ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy-SemiBold',
                      fontSize: 16 * Responsive.getResponsiveText(context),
                    ),
                  ),
                  Text(
                    authority.roleName ?? '',
                    style: TextStyle(
                      fontFamily: 'Gilroy-Medium',
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      color: theme.primary,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final phone = authority.adminMobile ?? '';
                      final uri = Uri(scheme: 'tel', path: phone);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    child: Text(
                      authority.adminMobile ?? '',
                      style: TextStyle(
                        fontFamily: 'Gilroy-Medium',
                        fontSize: 14 * Responsive.getResponsiveText(context),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final email = authority.adminEmail?.trim() ?? '';
                      if (email.isEmpty || !email.contains('@')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid or missing email address'),
                          ),
                        );
                        return;
                      }
                      await EasyLauncher.email(email: email);
                    },
                    child: Text(
                      authority.adminEmail ?? '',
                      style: TextStyle(
                        fontFamily: 'Gilroy-SemiBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 14 * Responsive.getResponsiveText(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Add your "Add Contact" logic here
              },
              child: SvgPicture.asset(
                'assets/visit_svgs/add_contact.svg',
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
