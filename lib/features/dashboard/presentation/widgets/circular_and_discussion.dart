import 'package:flutter/material.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_shadow_container.dart';

class CircularAndDiscussion extends StatelessWidget {
  const CircularAndDiscussion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: BorderContainerWraper(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: CustomShadowContainer(
                          width: double.infinity,
                          image:
                              Container(), // Replace with actual image if needed
                          title: 'Title',
                        ),
                      ),
                    ),
                    Expanded(
                      child: BorderContainerWraper(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: CustomShadowContainer(
                          width: double.infinity,
                          image:
                              Container(), // Replace with actual image if needed
                          title: 'Title',
                        ),
                      ),
                    ),
                  ],
                );
  }
}