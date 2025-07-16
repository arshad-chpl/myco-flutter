import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class PersonData {
  final String firstName;
  final String lastName;
  final String imagePath;
  final bool isActive;

  PersonData({
    this.isActive = false,
    required this.firstName,
    required this.lastName,
    required this.imagePath,
  });
}

class OverlappingPeopleCard extends StatelessWidget {
  final List<PersonData> people;
  final Color? cardBgr;
  final OutlinedBorder? cardShape;
  final double? cardElevation;
  final EdgeInsetsGeometry? cardMargin;
  final EdgeInsetsGeometry? cardPadding;
  final double? cardHeight;
  final double? cardWidth;
  final TextStyle? firstNameStyle;
  final TextStyle? lastNameStyle;
  final double? imageHeight;
  final double? imageWidth;
  final Decoration? decoration;
  final double? statusHeight;
  final double? statusWidth;

  const OverlappingPeopleCard({
    super.key,
    required this.people,
    this.cardBgr,
    this.cardShape,
    this.cardElevation,
    this.cardMargin,
    this.cardPadding,
    this.cardHeight,
    this.cardWidth,
    this.firstNameStyle,
    this.lastNameStyle,
    this.imageHeight,
    this.imageWidth,
    this.decoration,
    this.statusHeight,
    this.statusWidth,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
      height: cardHeight ?? 145,
      width: cardWidth ?? double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: List.generate(people.length, (index) {
          final person = people[index];
          final Color statusColor = person.isActive
              ? const Color(0xFF1CE742)
              : Colors.red;
          return Positioned(
            left: index * 75, // Controls horizontal overlap
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: imageWidth ?? 100,
                      height: imageHeight ?? 90,
                      decoration:
                          decoration ??
                          BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: person.imagePath.startsWith('http')
                                  ? NetworkImage(person.imagePath)
                                  : AssetImage(person.imagePath)
                                        as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                    ),
                    Positioned(
                      bottom: -3,
                      right: 44,
                      child: Container(
                        width: statusHeight ?? 12,
                        height: statusWidth ?? 18,
                        decoration:
                            decoration ??
                            BoxDecoration(
                              color: statusColor,
                              shape: BoxShape.circle,
                              // border: Border.all(color: Colors.white, width: 2),
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: 90,
                  child: Column(
                    children: [
                      CustomText(
                        person.firstName,
                        fontSize: firstNameStyle?.fontSize ?? 12,
                        fontWeight: firstNameStyle?.fontWeight ?? FontWeight.bold,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CustomText(
                        person.lastName,
                        fontSize: firstNameStyle?.fontSize ?? 12,
                        fontWeight: firstNameStyle?.fontWeight ?? FontWeight.bold,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
}
