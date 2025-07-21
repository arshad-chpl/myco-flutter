// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myco_flutter/core/theme/colors.dart';
//
// class ShowMonthYearHeader extends StatefulWidget {
//   const ShowMonthYearHeader({super.key});
//
//   @override
//   State<ShowMonthYearHeader> createState() => _ShowMonthYearHeaderState();
// }
//
// class _ShowMonthYearHeaderState extends State<ShowMonthYearHeader> {
//   int selectedMonth = DateTime.now().month - 1; // 0-indexed
//   int selectedYear = DateTime.now().year;
//
//   List<String> months = const [
//     'Jan',
//     'Feb',
//     'Mar',
//     'Apr',
//     'May',
//     'Jun',
//     'Jul',
//     'Aug',
//     'Sep',
//     'Oct',
//     'Nov',
//     'Dec',
//   ];
//
//   void _changeMonth(int direction) {
//     setState(() {
//       selectedMonth += direction;
//       if (selectedMonth < 0) {
//         selectedMonth = 11;
//         selectedYear--;
//       } else if (selectedMonth > 11) {
//         selectedMonth = 0;
//         selectedYear++;
//       }
//       widget.onChanged(selectedMonth, selectedYear);
//     });
//   }
//
//   void _openMonthYearPicker() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (context) => MonthYearPickerBottomSheet(
//         initialMonth: selectedMonth,
//         initialYear: selectedYear,
//         onSubmit: (month, year) {
//           setState(() {
//             selectedMonth = month;
//             selectedYear = year;
//             widget.onChanged(month, year);
//           });
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       ArrowButton(icon: Icons.chevron_left, onTap: () => _changeMonth(-1)),
//       const SizedBox(width: 8),
//       InkWell(
//         onTap: _openMonthYearPicker,
//         child: Row(
//           children: [
//             Text(
//               '${months[selectedMonth]}, $selectedYear',
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(width: 4),
//             const Icon(Icons.keyboard_arrow_down),
//           ],
//         ),
//       ),
//       const SizedBox(width: 8),
//       ArrowButton(icon: Icons.chevron_right, onTap: () => _changeMonth(1)),
//     ],
//   );
// }
//
// class ArrowButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//
//   const ArrowButton({super.key, required this.icon, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Material(
//       color: AppColors.lightBlue, // Replace with AppColors.lightBlue if available
//       borderRadius: BorderRadius.circular(0),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(4),
//         child: SizedBox(
//           width: screenWidth * 0.01, // ~32 on 400px width
//           height: screenHeight * 0.01, // ~32 on 800px height
//           child: Icon(
//             icon,
//             size: screenWidth * 0.02, // ~20 on 400px width
//           ),
//         ),
//       ),
//     );
//   }
// }
