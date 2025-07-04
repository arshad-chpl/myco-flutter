import 'package:flutter/material.dart';

getBottomSheet(BuildContext context, Widget bottomSheet) =>
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      useSafeArea: true,
      context: context,
      builder: (context) => bottomSheet,
    );
