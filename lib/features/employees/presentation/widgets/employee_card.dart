import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class EmployeeCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;

  const EmployeeCard({
    required this.imageUrl,
    required this.name,
    required this.role,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = AppTheme.getColor(context);

    return Container(
      width: 140 * getResponsive(context),
      padding: EdgeInsets.symmetric(
        vertical: 16 * getResponsive(context),
        horizontal: 10 * getResponsive(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppTheme.getColor(context).primary,
          width: 0.5,
        ),
        // boxShadow: const [
        //   // BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Colors.white, Color(0xFFE0E6F3)],
                    center: Alignment.center,
                    radius: 0.8,
                  ),
                ),
              ),
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 6,
                right: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD8D8D8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomText(
            name,
            fontSize: 12 * getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: themeColor.onSurface,
          ),
          const SizedBox(height: 6),
          CustomText(
            role,
            fontSize: 12 * getResponsiveText(context),
            color: themeColor.onSurface,
          ),
        ],
      ),
    );
  }
}
