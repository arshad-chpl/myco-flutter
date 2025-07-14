import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_left_column.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_right_column.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/last_visit_expanded_info.dart';


class CardBottomContent extends StatefulWidget {
  final bool isOrderNow;
  final bool isOnlyVisit;

  const CardBottomContent({
    super.key,
    this.isOrderNow = false,
    this.isOnlyVisit = false,
  });

  @override
  State<CardBottomContent> createState() => _CardBottomContentState();
}

class _CardBottomContentState extends State<CardBottomContent> {
  bool isExpanded = false;

  void toggleExpand() {
    if (!widget.isOrderNow && !widget.isOnlyVisit) {
      setState(() {
        isExpanded = !isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNoOrder = !widget.isOrderNow && !widget.isOnlyVisit;

    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(12 * Responsive.getResponsive(context)),
      ),

      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [

            // Main Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Left Column
                CustomerLeftColumn(),
                SizedBox(width: 12 * Responsive.getResponsive(context)),

                // Right Column
                CustomerRightColumn(
                  isOrderNow: widget.isOrderNow,
                  isOnlyVisit: widget.isOnlyVisit,
                  isNoOrder: isNoOrder,
                  isExpanded: isExpanded,
                  toggleExpand: toggleExpand,
                ),
              ],
            ),

            // Expanded Visit Info
            if (isNoOrder && isExpanded)
              const LastVisitExpandedInfo(),
          ],
        ),
      ),
    );
  }
}
