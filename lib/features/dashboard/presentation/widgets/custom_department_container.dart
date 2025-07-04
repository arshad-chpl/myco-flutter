import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String department;
  final double  ? width;
  final double ?height;
  final double ?imageHeight;
  final double ?imageWidth;
  final double ?vectorWidth;
  final double ?vectorHeight;
  final Offset ?vectorOffset;
  final Offset?imageOffset;
  final Decoration ? decoration;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.department,
    this.width,
    this.height ,
    this.imageHeight,
    this.imageWidth ,
    this.vectorWidth ,
    this.vectorHeight,
    this.vectorOffset,
    this.imageOffset,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) => Column(
      children: [
        // Stack image directly on top of vector shape
        Container(
          decoration:decoration ?? BoxDecoration(
            borderRadius: BorderRadius.circular(
              18,

              // Example radius value
            ),
            border: Border.all(color: Colors.grey.shade400),
            color: Colors.white70,
          ),
          width :140,
          height:200,
          child: SizedBox(
            width: 140,
            height: vectorHeight?? 130,
            child: Stack(
              children: [
                Transform.translate(
                  offset: vectorOffset??const Offset(0, 0),
                  child: CustomPaint(
                    size: Size(width ?? 145, vectorHeight?? 130),
                    painter: DiagonalCornerPainter(),
                  ),
                ),
                // Profile image slightly above vector center
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: imageOffset??const Offset(1, 20), // move image up (x, y)
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image(
                            image: imagePath.startsWith('http')
                                ? NetworkImage(imagePath)
                                : AssetImage(imagePath) as ImageProvider,
                            width: imageWidth ?? 90,
                            height: imageHeight ?? 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      //  Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          department,
                          style: const TextStyle(
                            fontSize: 15,
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

        // ProfileDemo()
      ],
    );
}

class DiagonalCornerPainter extends CustomPainter {
  final Color fillColor;
  final Color shadowColor;
  final double blur;
  final double borderRadius;
  final Offset shadowOffset;

  DiagonalCornerPainter({
    this.fillColor = const Color(0xFF00BFA5),
    this.shadowColor = Colors.black,
    this.blur = 6.0,
    this.borderRadius = 18.0,
    this.shadowOffset = const Offset(8, 0), // subtle for inner shadow
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path shapePath = Path()
      ..moveTo(0, borderRadius)
      ..quadraticBezierTo(0, 0, borderRadius, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, borderRadius)
      ..lineTo(borderRadius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - borderRadius)
      ..close();

    // Step 1: Fill the original shape
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(shapePath, fillPaint);

    // Step 2: Shadow path using even-odd fill technique
    final Path innerShadowPath = Path()
      ..addPath(shapePath.shift(shadowOffset), Offset.zero) // shifted for shadow illusion
      ..addPath(shapePath, Offset.zero)
      ..fillType = PathFillType.evenOdd;

    // Step 3: Shadow paint
    final shadowPaint = Paint()
      ..color = shadowColor.withOpacity(0.5)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    // Step 4: Save layer and clip to original shape to prevent shadow overflow
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    canvas.clipPath(shapePath);
    canvas.drawPath(innerShadowPath, shadowPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
