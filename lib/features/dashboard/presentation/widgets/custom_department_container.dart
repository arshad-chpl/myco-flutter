import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String department;
  final double? width;
  final double? height;
  final double? imageHeight;
  final double? imageWidth;
  final double? vectorWidth;
  final double? vectorHeight;
  final Offset? vectorOffset;
  final Offset? imageOffset;
  final Decoration? decoration;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.department,
    this.width,
    this.height,
    this.imageHeight,
    this.imageWidth,
    this.vectorWidth,
    this.vectorHeight,
    this.vectorOffset,
    this.imageOffset,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        decoration: decoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey.shade400),
              color: Colors.white,
            ),
        width: 140,
        height: 200,
        child: SizedBox(
          width: 140,
          height: vectorHeight ?? 130,
          child: Stack(
            children: [
              Transform.translate(
                offset: vectorOffset ?? const Offset(0, 0),
                child: Container(), // Placeholder for background
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: imageOffset ?? const Offset(1, 20),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Outer Circle with shadow
                          Container(
                            width: imageWidth ?? 80,
                            height: imageHeight ?? 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: imagePath.endsWith('.svg')
                                  ? SvgPicture.asset(
                                imagePath,
                                width: imageWidth ?? 76,
                                height: imageHeight ?? 76,
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                imagePath,
                                width: imageWidth ?? 76,
                                height: imageHeight ?? 76,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Dot at bottom right
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade400,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        department,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
