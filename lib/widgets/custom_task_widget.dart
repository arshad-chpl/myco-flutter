import 'package:flutter/material.dart';

class CustomTaskWidget extends StatelessWidget {
  final String? imagePath;
  // final String title;
  final double? width;
  final double? height;
  final Widget? image;

  const CustomTaskWidget({
    // required this.title,
    this.imagePath,
    super.key,
    this.width,
    this.height,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            // Outer colored container (60x60)
            SizedBox(width: width ?? 70.91, height: height ?? 70.91),
            // Inner shadow (bottom, left, right only)
            Positioned(
              top: 1,
              left: -1,
              bottom: 3,
              child: Container(
                width: width ?? 70.91,
                height: height ?? 70.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black12],
                    stops: [0.7, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1,
              left: -1,
              bottom: 3,
              child: Container(
                width: width ?? 70.91,
                height: height ?? 70.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    colors: [Colors.transparent, Colors.black12],
                    stops: [0.7, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1,
              left: -1,
              bottom: 3,
              child: Container(
                width: width ?? 70.91,
                height: height ?? 70.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [Colors.transparent, Colors.black12],
                    stops: [0.7, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1,
              left: -1,
              bottom: 3,
              child: Container(
                width: width ?? 70.91,
                height: height ?? 70.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerLeft,
                    colors: [Colors.transparent, Colors.black12],
                    stops: [0.7, 0.9],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1,
              left: -1,
              bottom: 3,
              child: Container(
                width: width ?? 70.91,
                height: height ?? 70.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                    colors: [Colors.transparent, Colors.black12],
                    stops: [0.7, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1,
              left: -1,
              bottom: 3,
              child: Container(
                width: width ?? 70.91,
                height: height ?? 70.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.topLeft,
                    colors: [Colors.transparent, Colors.black12],
                    stops: [0.7, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1,
              left: -1,
              bottom: 3,
              child: Container(
                width: width ?? 70.91,
                height: height ?? 70.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.topRight,
                    colors: [Colors.transparent, Colors.black12],
                    stops: [0.7, 1.0],
                  ),
                ),
              ),
            ),

            // Inner container that holds the image
            Positioned.fill(
              child: Center(
                child: Container(
                  width: width != null ? (width ?? 29.87 - 29.87) : 50.04,
                  height: height != null ? (height ?? 29.87 - 29.87) : 50.61,
                  decoration: BoxDecoration(
                    // color: Color(0xFF2FBBA4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:
                    image ??
                        Image.asset(
                          imagePath ?? '',
                          fit: BoxFit.contain,
                          height: 80,
                          width: 80,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 10),
        // Text(
        //   title,
        //   style: const TextStyle(
        //     fontSize: 11.82,
        //     fontWeight: FontWeight.w400,
        //     color: Colors.black87,
        //   ),
        // ),
      ],
    );
  }
}