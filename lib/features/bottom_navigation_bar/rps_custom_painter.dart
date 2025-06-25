import 'dart:ui';

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9747333, size.height * 0.1906000);
    path_0.cubicTo(
      size.width * 0.9890744,
      size.height * 0.1982082,
      size.width,
      size.height * 0.2626589,
      size.width,
      size.height * 0.3396534,
    );
    path_0.lineTo(size.width, size.height * 0.6502479);
    path_0.cubicTo(
      size.width,
      size.height * 0.8150082,
      size.width,
      size.height * 0.8973877,
      size.width * 0.9904205,
      size.height * 0.9485712,
    );
    path_0.cubicTo(
      size.width * 0.9808385,
      size.height * 0.9997562,
      size.width * 0.9654179,
      size.height * 0.9997562,
      size.width * 0.9345795,
      size.height * 0.9997562,
    );
    path_0.lineTo(size.width * 0.06542051, size.height * 0.9997562);
    path_0.cubicTo(
      size.width * 0.03458103,
      size.height * 0.9997562,
      size.width * 0.01916123,
      size.height * 0.9997562,
      size.width * 0.009580615,
      size.height * 0.9485712,
    );
    path_0.cubicTo(
      0,
      size.height * 0.8973877,
      0,
      size.height * 0.8150082,
      0,
      size.height * 0.6502479,
    );
    path_0.lineTo(0, size.height * 0.3396534);
    path_0.cubicTo(
      size.width * 0.01038146,
      size.height * -0.06849315,
      size.width * 0.04916436,
      size.height * 0.05837616,
      size.width * 0.03710051,
      size.height * 0.1349930,
    );
    path_0.cubicTo(
      size.width * 0.03567641,
      size.height * 0.1, // Replace NaN with some meaningful value
      size.width * 0.05,
      size.height * 0.15,
      size.width * 0.1,
      size.height * 0.2,
    );
    path_0.lineTo(size.width * 0.3834513, size.height * 0.0005955767);
    path_0.cubicTo(
      size.width * 0.4016821,
      size.height * -0.009074767,
      size.width * 0.4158846,
      size.height * 0.1030160,
      size.width * 0.4158846,
      size.height * 0.2008877,
    );
    path_0.lineTo(size.width * 0.4158846, size.height * 0.2008877);
    path_0.cubicTo(
      size.width * 0.4158846,
      size.height * 0.4490644,
      size.width * 0.4535436,
      size.height * 0.6502534,
      size.width * 0.4999974,
      size.height * 0.6502534,
    );
    path_0.cubicTo(
      size.width * 0.5464513,
      size.height * 0.6502534,
      size.width * 0.5841103,
      size.height * 0.4490644,
      size.width * 0.5841103,
      size.height * 0.2008877,
    );
    path_0.lineTo(size.width * 0.5841103, size.height * 0.2008877);
    path_0.cubicTo(
      size.width * 0.5841103,
      size.height * 0.1030119,
      size.width * 0.5983128,
      size.height * -0.009086274,
      size.width * 0.6165436,
      size.height * 0.0005848904,
    );
    path_0.lineTo(size.width * 0.9747333, size.height * 0.1906000);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff000000).withValues(alpha: 1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9747333, size.height * 0.1906000);
    path_1.cubicTo(
      size.width * 0.9890744,
      size.height * 0.1982082,
      size.width,
      size.height * 0.2626589,
      size.width,
      size.height * 0.3396534,
    );
    path_1.lineTo(size.width, size.height * 0.6502479);
    path_1.cubicTo(
      size.width,
      size.height * 0.8150082,
      size.width,
      size.height * 0.8973877,
      size.width * 0.9904205,
      size.height * 0.9485712,
    );
    path_1.cubicTo(
      size.width * 0.9808385,
      size.height * 0.9997562,
      size.width * 0.9654179,
      size.height * 0.9997562,
      size.width * 0.9345795,
      size.height * 0.9997562,
    );
    path_1.lineTo(size.width * 0.06542051, size.height * 0.9997562);
    path_1.cubicTo(
      size.width * 0.03458103,
      size.height * 0.9997562,
      size.width * 0.01916123,
      size.height * 0.9997562,
      size.width * 0.009580615,
      size.height * 0.9485712,
    );
    path_1.cubicTo(
      0,
      size.height * 0.8973877,
      0,
      size.height * 0.8150082,
      0,
      size.height * 0.6502479,
    );
    path_1.lineTo(0, size.height * 0.3396534);
    path_1.cubicTo(
      size.width * 0.01038146,
      size.height * -0.06849315,
      size.width * 0.04916436,
      size.height * 0.05837616,
      size.width * 0.03710051,
      size.height * 0.1349930,
    );
    path_1.cubicTo(
      size.width * 0.03567641,
      size.height * 0.1, // Replace NaN with some meaningful value
      size.width * 0.05,
      size.height * 0.15,
      size.width * 0.1,
      size.height * 0.2,
    );
    path_1.lineTo(size.width * 0.3834513, size.height * 0.0005955767);
    path_1.cubicTo(
      size.width * 0.4016821,
      size.height * -0.009074767,
      size.width * 0.4158846,
      size.height * 0.1030160,
      size.width * 0.4158846,
      size.height * 0.2008877,
    );
    path_1.lineTo(size.width * 0.4158846, size.height * 0.2008877);
    path_1.cubicTo(
      size.width * 0.4158846,
      size.height * 0.4490644,
      size.width * 0.4535436,
      size.height * 0.6502534,
      size.width * 0.4999974,
      size.height * 0.6502534,
    );
    path_1.cubicTo(
      size.width * 0.5464513,
      size.height * 0.6502534,
      size.width * 0.5841103,
      size.height * 0.4490644,
      size.width * 0.5841103,
      size.height * 0.2008877,
    );
    path_1.lineTo(size.width * 0.5841103, size.height * 0.2008877);
    path_1.cubicTo(
      size.width * 0.5841103,
      size.height * 0.1030119,
      size.width * 0.5983128,
      size.height * -0.009086274,
      size.width * 0.6165436,
      size.height * 0.0005848904,
    );
    path_1.lineTo(size.width * 0.9747333, size.height * 0.1906000);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.9747333, size.height * 0.1906000);
    path_2.lineTo(size.width * 0.9749846, size.height * 0.1769685);
    path_2.lineTo(size.width * 0.9749846, size.height * 0.1769685);
    path_2.lineTo(size.width * 0.9747333, size.height * 0.1906000);
    path_2.close();
    path_2.moveTo(size.width, size.height * 0.3396534);
    path_2.lineTo(size.width * 1.002564, size.height * 0.3396534);
    path_2.lineTo(size.width * 1.002564, size.height * 0.3396521);
    path_2.lineTo(size.width, size.height * 0.3396534);
    path_2.close();
    path_2.moveTo(0, size.height * 0.3396534);
    path_2.lineTo(size.width * -0.002564103, size.height * 0.3396521);
    path_2.lineTo(size.width * -0.002564103, size.height * 0.3396534);
    path_2.lineTo(0, size.height * 0.3396534);
    path_2.close();
    path_2.moveTo(size.width * 0.02526792, size.height * 0.1906000);
    path_2.lineTo(size.width * 0.02501459, size.height * 0.1769685);
    path_2.lineTo(size.width * 0.02501456, size.height * 0.1769685);
    path_2.lineTo(size.width * 0.02526792, size.height * 0.1906000);
    path_2.close();
    path_2.moveTo(size.width * 0.4999974, size.height * 0.6502534);
    path_2.lineTo(size.width * 0.4999974, size.height * 0.6639521);
    path_2.lineTo(size.width * 0.4999974, size.height * 0.6639521);
    path_2.lineTo(size.width * 0.4999974, size.height * 0.6502534);
    path_2.close();
    path_2.moveTo(size.width * 0.6165436, size.height * 0.0005848904);
    path_2.lineTo(size.width * 0.6162923, size.height * 0.01421644);
    path_2.lineTo(size.width * 0.6165436, size.height * 0.0005848904);
    path_2.close();
    path_2.moveTo(size.width * 0.009580615, size.height * 0.9485712);
    path_2.lineTo(size.width * 0.007767513, size.height * 0.9582575);
    path_2.lineTo(size.width * 0.009580615, size.height * 0.9485712);
    path_2.close();
    path_2.moveTo(size.width * 0.9904205, size.height * 0.9485712);
    path_2.lineTo(size.width * 0.9922333, size.height * 0.9582575);
    path_2.lineTo(size.width * 0.9904205, size.height * 0.9485712);
    path_2.close();
    path_2.moveTo(size.width * 0.9747333, size.height * 0.1906000);
    path_2.lineTo(size.width * 0.9744795, size.height * 0.2042315);
    path_2.cubicTo(
      size.width * 0.9875077,
      size.height * 0.2111438,
      size.width * 0.9974359,
      size.height * 0.2697014,
      size.width * 0.9974359,
      size.height * 0.3396534,
    );
    path_2.lineTo(size.width, size.height * 0.3396534);
    path_2.lineTo(size.width * 1.002564, size.height * 0.3396521);
    path_2.cubicTo(
      size.width * 1.002564,
      size.height * 0.2556164,
      size.width * 0.9906385,
      size.height * 0.1852726,
      size.width * 0.9749846,
      size.height * 0.1769685,
    );
    path_2.lineTo(size.width * 0.9747333, size.height * 0.1906000);
    path_2.close();
    path_2.moveTo(size.width, size.height * 0.3396534);
    path_2.lineTo(size.width * 0.9974359, size.height * 0.3396534);
    path_2.lineTo(size.width * 0.9974359, size.height * 0.6502479);
    path_2.lineTo(size.width, size.height * 0.6502479);
    path_2.lineTo(size.width * 1.002564, size.height * 0.6502479);
    path_2.lineTo(size.width * 1.002564, size.height * 0.3396534);
    path_2.lineTo(size.width, size.height * 0.3396534);
    path_2.close();
    path_2.moveTo(size.width * 0.9345795, size.height * 0.9997562);
    path_2.lineTo(size.width * 0.9345795, size.height * 0.9860575);
    path_2.lineTo(size.width * 0.06542051, size.height * 0.9860575);
    path_2.lineTo(size.width * 0.06542051, size.height * 0.9997562);
    path_2.lineTo(size.width * 0.06542051, size.height * 1.013455);
    path_2.lineTo(size.width * 0.9345795, size.height * 1.013455);
    path_2.lineTo(size.width * 0.9345795, size.height * 0.9997562);
    path_2.close();
    path_2.moveTo(0, size.height * 0.6502479);
    path_2.lineTo(size.width * 0.002564103, size.height * 0.6502479);
    path_2.lineTo(size.width * 0.002564103, size.height * 0.3396534);
    path_2.lineTo(0, size.height * 0.3396534);
    path_2.lineTo(size.width * -0.002564103, size.height * 0.3396534);
    path_2.lineTo(size.width * -0.002564103, size.height * 0.6502479);
    path_2.lineTo(0, size.height * 0.6502479);
    path_2.close();
    path_2.moveTo(0, size.height * 0.3396534);
    path_2.lineTo(size.width * 0.002564103, size.height * 0.3396534);
    path_2.cubicTo(
      size.width * 0.002564205,
      size.height * 0.2697014,
      size.width * 0.01249156,
      size.height * 0.2111438,
      size.width * 0.02552131,
      size.height * 0.2042315,
    );
    path_2.lineTo(size.width * 0.02526792, size.height * 0.1906000);
    path_2.lineTo(size.width * 0.02501456, size.height * 0.1769685);
    path_2.cubicTo(
      size.width * 0.009362103,
      size.height * 0.1852726,
      size.width * -0.002563990,
      size.height * 0.2556164,
      size.width * -0.002564103,
      size.height * 0.3396521,
    );
    path_2.lineTo(0, size.height * 0.3396534);
    path_2.close();
    path_2.moveTo(size.width * 0.02526792, size.height * 0.1906000);
    path_2.lineTo(size.width * 0.02552128, size.height * 0.2042315);
    path_2.lineTo(size.width * 0.3837051, size.height * 0.01422712);
    path_2.lineTo(size.width * 0.3834513, size.height * 0.0005955767);
    path_2.lineTo(size.width * 0.3831974, size.height * -0.01303603);
    path_2.lineTo(size.width * 0.02501459, size.height * 0.1769685);
    path_2.lineTo(size.width * 0.02526792, size.height * 0.1906000);
    path_2.close();
    path_2.moveTo(size.width * 0.4158846, size.height * 0.2008877);
    path_2.lineTo(size.width * 0.4133205, size.height * 0.2008877);
    path_2.cubicTo(
      size.width * 0.4133205,
      size.height * 0.4566301,
      size.width * 0.4521282,
      size.height * 0.6639521,
      size.width * 0.4999974,
      size.height * 0.6639521,
    );
    path_2.lineTo(size.width * 0.4999974, size.height * 0.6502534);
    path_2.lineTo(size.width * 0.4999974, size.height * 0.6365548);
    path_2.cubicTo(
      size.width * 0.4549590,
      size.height * 0.6365548,
      size.width * 0.4184487,
      size.height * 0.4414986,
      size.width * 0.4184487,
      size.height * 0.2008877,
    );
    path_2.lineTo(size.width * 0.4158846, size.height * 0.2008877);
    path_2.close();
    path_2.moveTo(size.width * 0.4999974, size.height * 0.6502534);
    path_2.lineTo(size.width * 0.4999974, size.height * 0.6639521);
    path_2.cubicTo(
      size.width * 0.5478667,
      size.height * 0.6639521,
      size.width * 0.5866744,
      size.height * 0.4566301,
      size.width * 0.5866744,
      size.height * 0.2008877,
    );
    path_2.lineTo(size.width * 0.5841103, size.height * 0.2008877);
    path_2.lineTo(size.width * 0.5815462, size.height * 0.2008877);
    path_2.cubicTo(
      size.width * 0.5815462,
      size.height * 0.4414986,
      size.width * 0.5450359,
      size.height * 0.6365548,
      size.width * 0.4999974,
      size.height * 0.6365548,
    );
    path_2.lineTo(size.width * 0.4999974, size.height * 0.6502534);
    path_2.close();
    path_2.moveTo(size.width * 0.6165436, size.height * 0.0005848904);
    path_2.lineTo(size.width * 0.6162923, size.height * 0.01421644);
    path_2.lineTo(size.width * 0.9744795, size.height * 0.2042315);
    path_2.lineTo(size.width * 0.9747333, size.height * 0.1906000);
    path_2.lineTo(size.width * 0.9749846, size.height * 0.1769685);
    path_2.lineTo(size.width * 0.6167974, size.height * -0.01304670);
    path_2.lineTo(size.width * 0.6165436, size.height * 0.0005848904);
    path_2.close();
    path_2.moveTo(size.width * 0.5841103, size.height * 0.2008877);
    path_2.lineTo(size.width * 0.5866744, size.height * 0.2008877);
    path_2.cubicTo(
      size.width * 0.5866744,
      size.height * 0.1551904,
      size.width * 0.5900103,
      size.height * 0.1056811,
      size.width * 0.5954949,
      size.height * 0.06894781,
    );
    path_2.cubicTo(
      size.width * 0.6009769,
      size.height * 0.03223192,
      size.width * 0.6083103,
      size.height * 0.009983055,
      size.width * 0.6162923,
      size.height * 0.01421644,
    );
    path_2.lineTo(size.width * 0.6165436, size.height * 0.0005848904);
    path_2.lineTo(size.width * 0.6167974, size.height * -0.01304670);
    path_2.cubicTo(
      size.width * 0.6065487,
      size.height * -0.01848438,
      size.width * 0.5976641,
      size.height * 0.01048018,
      size.width * 0.5914872,
      size.height * 0.05186438,
    );
    path_2.cubicTo(
      size.width * 0.5853103,
      size.height * 0.09323123,
      size.width * 0.5815462,
      size.height * 0.1487082,
      size.width * 0.5815462,
      size.height * 0.2008877,
    );
    path_2.lineTo(size.width * 0.5841103, size.height * 0.2008877);
    path_2.close();
    path_2.moveTo(size.width * 0.3834513, size.height * 0.0005955767);
    path_2.lineTo(size.width * 0.3837051, size.height * 0.01422712);
    path_2.cubicTo(
      size.width * 0.3916846,
      size.height * 0.009994110,
      size.width * 0.3990179,
      size.height * 0.03224151,
      size.width * 0.4045000,
      size.height * 0.06895534,
    );
    path_2.cubicTo(
      size.width * 0.4099846,
      size.height * 0.1056863,
      size.width * 0.4133205,
      size.height * 0.1551932,
      size.width * 0.4133205,
      size.height * 0.2008877,
    );
    path_2.lineTo(size.width * 0.4158846, size.height * 0.2008877);
    path_2.lineTo(size.width * 0.4184487, size.height * 0.2008877);
    path_2.cubicTo(
      size.width * 0.4184487,
      size.height * 0.1487110,
      size.width * 0.4146846,
      size.height * 0.09323603,
      size.width * 0.4085103,
      size.height * 0.05187137,
    );
    path_2.cubicTo(
      size.width * 0.4023308,
      size.height * 0.01048944,
      size.width * 0.3934487,
      size.height * -0.01847329,
      size.width * 0.3831974,
      size.height * -0.01303603,
    );
    path_2.lineTo(size.width * 0.3834513, size.height * 0.0005955767);
    path_2.close();
    path_2.moveTo(size.width * 0.06542051, size.height * 0.9997562);
    path_2.lineTo(size.width * 0.06542051, size.height * 0.9860575);
    path_2.cubicTo(
      size.width * 0.04992821,
      size.height * 0.9860575,
      size.width * 0.03856692,
      size.height * 0.9860274,
      size.width * 0.02987026,
      size.height * 0.9797808,
    );
    path_2.cubicTo(
      size.width * 0.02124703,
      size.height * 0.9735877,
      size.width * 0.01562821,
      size.height * 0.9615082,
      size.width * 0.01139372,
      size.height * 0.9388849,
    );
    path_2.lineTo(size.width * 0.009580615, size.height * 0.9485712);
    path_2.lineTo(size.width * 0.007767513, size.height * 0.9582575);
    path_2.cubicTo(
      size.width * 0.01311364,
      size.height * 0.9868192,
      size.width * 0.01999503,
      size.height * 1.000332,
      size.width * 0.02918692,
      size.height * 1.006934,
    );
    path_2.cubicTo(
      size.width * 0.03830487,
      size.height * 1.013484,
      size.width * 0.05007333,
      size.height * 1.013455,
      size.width * 0.06542051,
      size.height * 1.013455,
    );
    path_2.lineTo(size.width * 0.06542051, size.height * 0.9997562);
    path_2.close();
    path_2.moveTo(0, size.height * 0.6502479);
    path_2.lineTo(size.width * -0.002564103, size.height * 0.6502479);
    path_2.cubicTo(
      size.width * -0.002564103,
      size.height * 0.7322411,
      size.width * -0.002569538,
      size.height * 0.7951137,
      size.width * -0.001343662,
      size.height * 0.8438260,
    );
    path_2.cubicTo(
      size.width * -0.0001078559,
      size.height * 0.8929329,
      size.width * 0.002421397,
      size.height * 0.9296959,
      size.width * 0.007767513,
      size.height * 0.9582575,
    );
    path_2.lineTo(size.width * 0.009580615, size.height * 0.9485712);
    path_2.lineTo(size.width * 0.01139372, size.height * 0.9388849);
    path_2.cubicTo(
      size.width * 0.007159231,
      size.height * 0.9162630,
      size.width * 0.004898154,
      size.height * 0.8862438,
      size.width * 0.003738821,
      size.height * 0.8401753,
    );
    path_2.cubicTo(
      size.width * 0.002569538,
      size.height * 0.7937123,
      size.width * 0.002564103,
      size.height * 0.7330151,
      size.width * 0.002564103,
      size.height * 0.6502479,
    );
    path_2.lineTo(0, size.height * 0.6502479);
    path_2.close();
    path_2.moveTo(size.width, size.height * 0.6502479);
    path_2.lineTo(size.width * 0.9974359, size.height * 0.6502479);
    path_2.cubicTo(
      size.width * 0.9974359,
      size.height * 0.7330151,
      size.width * 0.9974308,
      size.height * 0.7937123,
      size.width * 0.9962615,
      size.height * 0.8401753,
    );
    path_2.cubicTo(
      size.width * 0.9951026,
      size.height * 0.8862438,
      size.width * 0.9928410,
      size.height * 0.9162630,
      size.width * 0.9886051,
      size.height * 0.9388849,
    );
    path_2.lineTo(size.width * 0.9904205, size.height * 0.9485712);
    path_2.lineTo(size.width * 0.9922333, size.height * 0.9582575);
    path_2.cubicTo(
      size.width * 0.9975795,
      size.height * 0.9296959,
      size.width * 1.000108,
      size.height * 0.8929329,
      size.width * 1.001344,
      size.height * 0.8438260,
    );
    path_2.cubicTo(
      size.width * 1.002569,
      size.height * 0.7951137,
      size.width * 1.002564,
      size.height * 0.7322411,
      size.width * 1.002564,
      size.height * 0.6502479,
    );
    path_2.lineTo(size.width, size.height * 0.6502479);
    path_2.close();
    path_2.moveTo(size.width * 0.9345795, size.height * 0.9997562);
    path_2.lineTo(size.width * 0.9345795, size.height * 1.013455);
    path_2.cubicTo(
      size.width * 0.9499256,
      size.height * 1.013455,
      size.width * 0.9616949,
      size.height * 1.013484,
      size.width * 0.9708128,
      size.height * 1.006934,
    );
    path_2.cubicTo(
      size.width * 0.9800051,
      size.height * 1.000332,
      size.width * 0.9868872,
      size.height * 0.9868192,
      size.width * 0.9922333,
      size.height * 0.9582575,
    );
    path_2.lineTo(size.width * 0.9904205, size.height * 0.9485712);
    path_2.lineTo(size.width * 0.9886051, size.height * 0.9388849);
    path_2.cubicTo(
      size.width * 0.9843718,
      size.height * 0.9615082,
      size.width * 0.9787538,
      size.height * 0.9735877,
      size.width * 0.9701308,
      size.height * 0.9797808,
    );
    path_2.cubicTo(
      size.width * 0.9614333,
      size.height * 0.9860274,
      size.width * 0.9500718,
      size.height * 0.9860575,
      size.width * 0.9345795,
      size.height * 0.9860575,
    );
    path_2.lineTo(size.width * 0.9345795, size.height * 0.9997562);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffEAECF0).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
