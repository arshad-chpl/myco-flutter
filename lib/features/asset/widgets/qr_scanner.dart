import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class QRScannerWidget extends StatefulWidget {
  final Function(String) onScanned;
  final double height;
  final double? width;
  final double? imageBorderRadius;
  final double? imageRadius;
  final double? containerMargin;
  final double? imageMargin;
  final double? imageButtonSpacing;
  final double? buttonWidth;
  final double? boarderRadius;
  final Widget? image;
  final double scannerFlex;
  final double resultFlex;

  const QRScannerWidget({
    required this.onScanned,
    super.key,
    this.scannerFlex = 4,
    this.resultFlex = 1,
    this.imageBorderRadius,
    this.imageRadius,
    this.containerMargin,
    this.imageMargin,
    this.imageButtonSpacing,
    this.buttonWidth,
    this.boarderRadius,
    this.image,
    required this.height,
    this.width,
  });

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  bool hasScanned = false;
  Key scannerKey = UniqueKey();

  final MobileScannerController controller = MobileScannerController();
  final ImagePicker _picker = ImagePicker();
  Future<void> pickImageAndScan() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    if (image == null) return;

    final BarcodeCapture? result = await controller.analyzeImage(image.path);

    if (result != null && result.barcodes.isNotEmpty && !hasScanned) {
      for (final barcode in result.barcodes) {
        final String? code = barcode.rawValue;
        if (code != null) {
          setState(() => hasScanned = true);
          widget.onScanned(code);
          break;
        }
      }
    } else if (hasScanned == true) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reset QR Scanner to scan again')),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No QR code found in image')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: widget.height,
    width: widget.width ?? double.infinity,
    child: Column(
      children: [
        Expanded(
          flex: widget.scannerFlex.toInt(),
          child: Container(
            margin: EdgeInsets.all(
              widget.containerMargin ?? 0.12 * getWidth(context),
            ),
            child: CustomPaint(
              painter: CornerStylePainter(),
              child: Container(
                margin: EdgeInsets.all(widget.imageMargin ?? 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    widget.imageBorderRadius ?? 12,
                  ),
                  border: Border.all(color: AppColors.borderColor, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.imageRadius ?? 10),
                  child: MobileScanner(
                    key: scannerKey,

                    controller: controller,
                    onDetect: (barcodes) {
                      if (hasScanned) return;
                      for (final barcode in barcodes.barcodes) {
                        final String? code = barcode.rawValue;
                        if (code != null) {
                          setState(() => hasScanned = true);
                          widget.onScanned(code);
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: widget.imageButtonSpacing ?? 20),
        Expanded(
          flex: widget.resultFlex.toInt(),
          child: Center(
            child: MyCoButton(
              width: widget.buttonWidth ?? 200,
              backgroundColor: AppColors.white,

              onTap: pickImageAndScan,
              image:
                  widget.image ??
                  Image.asset('assets/images/gallery-export.png', width: 24),
              spacing: 10,
              boarderRadius: widget.boarderRadius ?? 50,
              title: 'Select Photo',
              textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(context),
            ),
          ),
        ),
      ],
    ),
  );
}

class CornerStylePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double cornerLength = 24;
    const double radius = 10;
    const double strokeWidth = 3;

    final paintTopLeft = Paint()
      ..color = Colors.blue[800]!
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final paintTopRight = Paint()
      ..color = Colors.teal
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final paintBottomRight = Paint()
      ..color = Colors.blue[800]!
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final paintBottomLeft = Paint()
      ..color = Colors.teal
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Top-left
    final topLeftPath = Path()
      ..moveTo(0, radius)
      ..arcToPoint(
        const Offset(radius, 0),
        radius: const Radius.circular(radius),
      )
      ..lineTo(cornerLength + radius, 0);
    canvas.drawPath(topLeftPath, paintTopLeft);

    final topLeftVertical = Path()
      ..moveTo(0, radius)
      ..lineTo(0, radius + cornerLength);
    canvas.drawPath(topLeftVertical, paintTopLeft);

    // Top-right
    final topRightPath = Path()
      ..moveTo(size.width, radius)
      ..arcToPoint(
        Offset(size.width - radius, 0),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(size.width - cornerLength - radius, 0);
    canvas.drawPath(topRightPath, paintTopRight);

    final topRightVertical = Path()
      ..moveTo(size.width, radius)
      ..lineTo(size.width, radius + cornerLength);
    canvas.drawPath(topRightVertical, paintTopRight);

    // Bottom-right
    final bottomRightPath = Path()
      ..moveTo(size.width, size.height - radius)
      ..arcToPoint(
        Offset(size.width - radius, size.height),
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width - cornerLength - radius, size.height);
    canvas.drawPath(bottomRightPath, paintBottomRight);

    final bottomRightVertical = Path()
      ..moveTo(size.width, size.height - radius)
      ..lineTo(size.width, size.height - radius - cornerLength);
    canvas.drawPath(bottomRightVertical, paintBottomRight);

    // Bottom-left
    final bottomLeftPath = Path()
      ..moveTo(0, size.height - radius)
      ..arcToPoint(
        Offset(radius, size.height),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(cornerLength + radius, size.height);
    canvas.drawPath(bottomLeftPath, paintBottomLeft);

    final bottomLeftVertical = Path()
      ..moveTo(0, size.height - radius)
      ..lineTo(0, size.height - radius - cornerLength);
    canvas.drawPath(bottomLeftVertical, paintBottomLeft);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QRScannerWidget extends StatefulWidget {
//   final Function(String) onScanned;
//   final double scannerFlex;
//   final double resultFlex;

//   const QRScannerWidget({
//     Key? key,
//     required this.onScanned,
//     this.scannerFlex = 4,
//     this.resultFlex = 1,
//   }) : super(key: key);

//   @override
//   State<QRScannerWidget> createState() => _QRScannerWidgetState();
// }

// class _QRScannerWidgetState extends State<QRScannerWidget> {
//   bool hasScanned = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           flex: widget.scannerFlex.toInt(),
//           child: MobileScanner(

//             // allowDuplicates: false,
//             onDetect: (barcodes) {
//               if (hasScanned) return;

//               for (final barcode in barcodes.barcodes) {
//                 final String? code = barcode.rawValue;
//                 if (code != null) {
//                   setState(() => hasScanned = true);
//                   widget.onScanned(code);
//                 }
//               }
//             },
//           ),
//         ),
//         Expanded(
//           flex: widget.resultFlex.toInt(),
//           child: Center(
//             child: Text(
//               hasScanned ? 'QR Code Scanned!' : 'Scan a QR code',
//               style: const TextStyle(fontSize: 18),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
