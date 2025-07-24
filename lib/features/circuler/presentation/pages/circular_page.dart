import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/circuler/presentation/bloc/circular_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_month_year_picker_header/month_year_header.dart';

class CircularPage extends StatefulWidget {
  const CircularPage({super.key});

  @override
  State<CircularPage> createState() => _CircularPageState();
}

class _CircularPageState extends State<CircularPage> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    //  _fetchNoticeFilter();
  }

  void _fetchNoticeFilter() {
    context.read<CircularBloc>().add(NoticeFilterList());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Notice Board'), centerTitle: true),
    body: Column(
      children: [
        // Month Year Selector
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: MonthYearHeader(
            startYear: 2025,
            endYear: 2026,
            iconSize: 0.02 * Responsive.getHeight(context),
            onChanged: (month, year) {
              setState(() {
                selectedMonth = month;
                selectedYear = year;
              });
            },
          ),
        ),

        // Notice List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 5, // For now, static count for demo
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: NoticeCard(
                title: index % 2 == 0 ? "Notice" : "Lorem Ipsum",
                dateTime: "06:35 PM, 17th Jul 2025",
                description:
                    "As the world's leading online sports betting and iGaming operator, an additional US listing gives us access to...",
                attachmentUrl: index % 2 == 0 ? "View Attachment" : null,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class NoticeCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String description;
  final String? attachmentUrl;

  const NoticeCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.description,
    this.attachmentUrl,
  });

  @override
  Widget build(BuildContext context) => CommonCard(
    title: 'Hello',
    bottomWidget: Container(
      decoration: BoxDecoration(border: Border(left: BorderSide(color: AppTheme.getColor(context).surface))),
      child: Column(children: [



        // Body
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (attachmentUrl != null) ...[
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // Handle tap
                  },
                  child: const Text(
                    "View Attachment",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),


      ]),
    ),
  );

}
