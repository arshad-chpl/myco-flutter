import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/admin_view/presentation/pages/admin_menu_list.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AdminReminderNotification extends StatelessWidget {
  final AdminViewResponseEntity? adminViewResponse;

  const AdminReminderNotification({super.key, this.adminViewResponse});

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      LanguageManager().get('pending_actions'),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: CustomText(
                        LanguageManager().get('close'),
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child:
                    adminViewResponse?.adminMenuCategory?.isNotEmpty ?? false
                        ? AdminMenuList(
                          categories: adminViewResponse!.adminMenuCategory!,
                          searchQuery: '',
                          isFromNotificationReminder: true,
                          adminViewResponse: adminViewResponse!,
                        )
                        : Center(
                          child: CustomText(
                            LanguageManager().get('no_data_available'),
                            fontSize: 16,
                          ),
                        ),
              ),
            ],
          ),
        ),
    );
}
