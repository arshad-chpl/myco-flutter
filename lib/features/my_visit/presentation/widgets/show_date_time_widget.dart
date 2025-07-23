import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_bloc.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ShowDateTimeWidget extends StatelessWidget {
  final Color color;
  final FontWeight weight;

  const ShowDateTimeWidget({
    required this.color,
    required this.weight,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<VisitBloc, VisitState>(
        builder: (context, state) {
          if (state is VisitLoaded) {
            return CustomText(
              state.dateTime.trim().isEmpty ? 'EMPTY' : state.dateTime,
              color: color,
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: weight,
            );
          }
          return const CustomText(
            'loading...',
            isKey: true,
            color: AppColors.white,
          );
        },
      );
}
