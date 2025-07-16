import 'package:flutter/material.dart';

class StatusStep {
  final String title;
  final StatusType type;
  final String? date;
  final String? remark;

  StatusStep({
    required this.title,
    required this.type,
    this.date,
    this.remark,
  });
}

enum StatusType { pending, approved, completed, authorized }

List<StatusStep> statusSteps = [
  StatusStep(title: "PENDING", type: StatusType.pending),
  StatusStep(title: "APPROVED", type: StatusType.approved),
  StatusStep(
    title: "COMPLETED",
    type: StatusType.completed,
    date: "2025-07-15",
    remark: "Task was finished successfully.",
  ),
  StatusStep(
    title: "AUTHORIZED",
    type: StatusType.authorized,
    date: "2025-07-16",
    remark: "Final verification done.",
  ),
];


class StatusTracker extends StatelessWidget {
  final int currentStep;

  const StatusTracker({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) => Column(
      children: List.generate(statusSteps.length, (index) {
        final step = statusSteps[index];
        final isCompleted = index < currentStep;
        final isCurrent = index == currentStep;

        Color getColor() {
          if (isCurrent) return Colors.orange;
          if (isCompleted || index <= currentStep) return Colors.green;
          return Colors.grey;
        }

        Icon getIcon() {
          if (index <= currentStep) return Icon(Icons.check, color: Colors.white);
          return const Icon(Icons.circle_outlined, color: Colors.grey, size: 12);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: getColor(),
                        shape: BoxShape.circle,
                      ),
                      child: getIcon(),
                    ),
                    if (index != statusSteps.length - 1)
                      Container(
                        width: 2,
                        height: 30,
                        color: Colors.grey.shade400,
                      ),
                  ],
                ),
                const SizedBox(width: 10),
                Text(
                  step.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: getColor(),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            if (step.type == StatusType.completed || step.type == StatusType.authorized)
              Container(
                margin: const EdgeInsets.only(left: 40, bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (step.date != null)
                      Text("Date: ${step.date!}", style: const TextStyle(fontSize: 14)),
                    if (step.remark != null)
                      Text("Remark: ${step.remark!}", style: const TextStyle(fontSize: 14)),
                  ],
                ),
              )
            else
              const SizedBox(height: 16),
          ],
        );
      }),
    );
}
