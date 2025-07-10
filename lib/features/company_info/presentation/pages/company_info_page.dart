import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/company_info/domain/use_cases/get_company_info.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_event.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_state.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyInfoPage extends StatelessWidget {
  const CompanyInfoPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        CompanyInfoBloc(getCompanyInfo: GetIt.I<GetCompanyInfo>())
          ..add(FetchCompanyInfo()),
    child: Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Company Info'),
      ),
      body: BlocBuilder<CompanyInfoBloc, CompanyInfoState>(
        builder: (context, state) {
          if (state is CompanyInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CompanyInfoError) {
            return Center(child: Text(state.message));
          } else if (state is CompanyInfoLoaded) {
            final company = state.companyInfo;
            final commitie = company.commitie ?? [];
            final logoUrl = state.companyInfo.socieatyLogo;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      logoUrl != null && logoUrl.isNotEmpty
                          ? Image.network(
                              logoUrl,
                              height: 0.25 * Responsive.getHeight(context),
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                    'assets/sign_in/myco_logo.png',
                                    height:
                                        0.25 * Responsive.getHeight(context),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                            )
                          : Image.asset(
                              'assets/sign_in/myco_logo.png',
                              height: 0.25 * Responsive.getHeight(context),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 16,
                          ),
                          child: Text(
                            company.societyName ?? 'My Company',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  18 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                fontSize:
                                    18 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final companyName = company.societyName ?? 'My Company';
                                final address = company.societyAddress ?? 'No address available';

                                final latitude = company.societyLatitude;
                                final longitude = company.societyLongitude;

                                final googleMapsLink = (latitude != null && longitude != null)
                                    ? 'https://maps.google.com/?q=$latitude,$longitude'
                                    : 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}';

                                final shareText = '''
                                Company's Name : $companyName
                                
                                Address : $address
                                
                                $googleMapsLink
                                ''';

                                SharePlus.instance.share(
                                  ShareParams(text: shareText),
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/visit_svgs/share.svg',
                                height: 24,
                                width: 24,
                              ),
                            ),

                          ],
                        ),
                        Text(
                          company.societyAddress ?? 'No address available',
                          style: TextStyle(
                            fontSize:
                                18 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    child: Text(
                      "Company's Authorities",
                      style: TextStyle(
                        color: AppTheme.getColor(context).primary,
                        fontSize: 20 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (commitie.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text('No authorities available.'),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: commitie.length,
                      itemBuilder: (context, index) {
                        final authority = commitie[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                            bottom: 10,
                          ),
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
                                      authority.adminProfile != null &&
                                          authority.adminProfile!.isNotEmpty
                                      ? NetworkImage(authority.adminProfile!)
                                            as ImageProvider
                                      : const AssetImage(
                                          'assets/default_avatar.png',
                                        ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        authority.adminName ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Gilroy-SemiBold",
                                          fontSize:
                                              16 *
                                              Responsive.getResponsiveText(
                                                context,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        authority.roleName ?? '',
                                        style: TextStyle(
                                          fontFamily: "Gilroy-Medium",
                                          fontSize:
                                              14 *
                                              Responsive.getResponsiveText(
                                                context,
                                              ),
                                          color: AppTheme.getColor(
                                            context,
                                          ).primary,
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
                                            fontFamily: "Gilroy-Medium",
                                            fontSize: 14 * Responsive.getResponsiveText(context),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final email = authority.adminEmail?.trim() ?? '';
                                          if (email.isEmpty || !email.contains('@')) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Invalid or missing email address')),
                                            );
                                            return;
                                          }
                                          await EasyLauncher.email(email: email);
                                        },
                                        child: Text(
                                          authority.adminEmail ?? '',
                                          style: TextStyle(
                                            fontFamily: "Gilroy-SemiBold",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14 * Responsive.getResponsiveText(context),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
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
                      },
                    ),
                ],
              ),
            );
          }

          // Fallback in case of unexpected state
          return const SizedBox();
        },
      ),
    ),
  );
}
