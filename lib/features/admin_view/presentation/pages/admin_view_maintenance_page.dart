import 'package:flutter/material.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AdminViewMaintenancePage extends StatelessWidget {
  final String title;
  final Map<String, dynamic>? extra;

  const AdminViewMaintenancePage({required this.title, super.key, this.extra});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: CustomText(title,
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.construction,
            size: 64,
            color: Colors.orange,
          ),
          const SizedBox(height: 16),
          CustomText(
            title,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const CustomText(
            'Page under construction',
            color: Colors.grey,
            textAlign: TextAlign.center,
          ),
          if (extra != null) ...[
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomText(
                'Parameters: ${extra.toString()}',
                fontSize: 12,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    ),
  );
}