import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/presentation/pages/appointment_details_bottom_sheet.dart';

class RejectRequestBottomSheet extends StatefulWidget {
  const RejectRequestBottomSheet({super.key});

  @override
  State<RejectRequestBottomSheet> createState() =>
      _RejectRequestBottomSheetState();
}

class _RejectRequestBottomSheetState extends State<RejectRequestBottomSheet> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () => showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16 * Responsive.getResponsive(context)),
                ),
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) => const AppointmentDetailsBottomSheet(),
            ),
            child: const Text('Next'),
          ),
        ),
      ],
    ),
  );
}
