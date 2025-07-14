// import 'package:flutter/material.dart';
//
// import '../../themes_colors/colors.dart';
//
// class CountryModel {
//   final String name;
//   final String dialCode;
//
//   CountryModel({required this.name, required this.dialCode});
// }
//
// class CustomMobileNumberField extends StatefulWidget {
//   final List<CountryModel> countries;
//   final TextEditingController controller;
//   final bool isEditable;
//   final TextStyle? countryTextStyle;
//   final TextStyle? numberTextStyle;
//   final Decoration? boxDecoration;
//   final ImageProvider? backgroundImage;
//   final void Function(CountryModel)? onCountryChanged;
//   final double? width;
//   final double? height;
//   final double? dropdownHeight;
//   final double? dropdownWidth;
//   final BorderRadius? borderRadius;
//   final Border? border;
//   final bool readOnly;
//   final String? hintText;
//   final TextStyle? hintTextStyle;
//   final Color? fillColor;
//   final Color? borderColor;
//
//   const CustomMobileNumberField({
//     super.key,
//     required this.countries,
//     required this.controller,
//     this.isEditable = true,
//     this.countryTextStyle,
//     this.numberTextStyle,
//     this.boxDecoration,
//     this.backgroundImage,
//     this.onCountryChanged,
//     this.width,
//     this.height,
//     this.dropdownHeight = 200,
//     this.dropdownWidth = 200,
//     this.borderRadius,
//     this.border,
//     required this.readOnly,
//     this.hintText,
//     this.hintTextStyle,
//     this.fillColor,
//     this.borderColor,
//   });
//
//   @override
//   State<CustomMobileNumberField> createState() =>
//       _CustomMobileNumberFieldState();
// }
//
// class _CustomMobileNumberFieldState extends State<CustomMobileNumberField> {
//   late CountryModel _selectedCountry;
//   final LayerLink _layerLink = LayerLink();
//   OverlayEntry? _overlayEntry;
//   final GlobalKey _countryKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedCountry = widget.countries.first;
//   }
//
//   void _toggleDropdown() {
//     if (_overlayEntry == null) {
//       _overlayEntry = _createOverlayEntry();
//       Overlay.of(context).insert(_overlayEntry!);
//     } else {
//       _overlayEntry?.remove();
//       _overlayEntry = null;
//     }
//   }
//
//   OverlayEntry _createOverlayEntry() {
//     RenderBox renderBox =
//         _countryKey.currentContext!.findRenderObject() as RenderBox;
//     final size = renderBox.size;
//     final offset = renderBox.localToGlobal(Offset.zero);
//
//     return OverlayEntry(
//       builder: (context) => Positioned(
//         left: offset.dx,
//         top: offset.dy + size.height + 4,
//         width: widget.dropdownWidth,
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           showWhenUnlinked: false,
//           child: Material(
//             elevation: 4,
//             borderRadius: BorderRadius.circular(8),
//             child: SizedBox(
//               height: widget.dropdownHeight ?? 200,
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(vertical: 4),
//                 children: widget.countries.map((country) {
//                   return ListTile(
//                     dense: true,
//                     title: Text("${country.name} (${country.dialCode})"),
//                     onTap: () {
//                       setState(() {
//                         _selectedCountry = country;
//                       });
//                       widget.onCountryChanged?.call(country);
//                       _overlayEntry?.remove();
//                       _overlayEntry = null;
//                     },
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _overlayEntry?.remove();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: widget.width,
//       height: widget.height,
//       child: CompositedTransformTarget(
//         link: _layerLink,
//         child: Container(
//           decoration:
//               widget.boxDecoration ??
//               BoxDecoration(
//                 color: widget.fillColor ?? Colors.white,
//                 borderRadius: widget.borderRadius ?? BorderRadius.circular(7.0),
//                 border:
//                     widget.border ??
//                     Border.all(
//                       color: widget.borderColor ?? AppColors.borderColor,
//                     ),
//                 image: widget.backgroundImage != null
//                     ? DecorationImage(
//                         image: widget.backgroundImage!,
//                         fit: BoxFit.cover,
//                       )
//                     : null,
//               ),
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//           child: Row(
//             children: [
//               GestureDetector(
//                 onTap: widget.readOnly ? null : _toggleDropdown,
//
//                 child: Container(
//                   key: _countryKey,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         _selectedCountry.name,
//                         style:
//                             widget.countryTextStyle ??
//                             const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                       ),
//                       const SizedBox(width: 6),
//                       const Icon(
//                         Icons.keyboard_arrow_down_outlined,
//                         color: AppColors.primary,
//                         size: 30,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Text(
//                 _selectedCountry.dialCode,
//                 style:
//                     widget.numberTextStyle ??
//                     const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//               ),
//               const SizedBox(width: 6),
//               Expanded(
//                 child: TextField(
//                   controller: widget.controller,
//                   keyboardType: TextInputType.phone,
//                   readOnly: widget.readOnly || !widget.isEditable,
//                   style: widget.numberTextStyle,
//                   decoration: InputDecoration.collapsed(
//                     hintText: widget.hintText ?? "Enter phone number",
//                     hintStyle:
//                         widget.hintTextStyle ??
//                         TextStyle(color: AppColors.borderColor),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//======================================responsive==============================
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CountryModel {
  final String name;
  final String dialCode;

  CountryModel({required this.name, required this.dialCode});
}

class CustomMobileNumberField extends StatefulWidget {
  final List<CountryModel> countries;
  final TextEditingController controller;
  final bool isEditable;
  final TextStyle? countryTextStyle;
  final TextStyle? numberTextStyle;
  final Decoration? boxDecoration;
  final ImageProvider? backgroundImage;
  final void Function(CountryModel)? onCountryChanged;
  final double? width;
  final double? height;
  final double? dropdownHeight;
  final double? dropdownWidth;
  final BorderRadius? borderRadius;
  final Border? border;
  final bool? readOnly;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Color? fillColor;
  final Color? borderColor;

  const CustomMobileNumberField({
    super.key,
    required this.countries,
    required this.controller,
    this.isEditable = true,
    this.countryTextStyle,
    this.numberTextStyle,
    this.boxDecoration,
    this.backgroundImage,
    this.onCountryChanged,
    this.width,
    this.height,
    this.dropdownHeight = 200,
    this.dropdownWidth = 200,
    this.borderRadius,
    this.border,
    this.readOnly,
    this.hintText,
    this.hintTextStyle,
    this.fillColor,
    this.borderColor,
  });

  @override
  State<CustomMobileNumberField> createState() =>
      _CustomMobileNumberFieldState();
}

class _CustomMobileNumberFieldState extends State<CustomMobileNumberField> {
  late CountryModel _selectedCountry;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _countryKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _selectedCountry = widget.countries.first;
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox =
        _countryKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 4 * Responsive.getResponsive(context),
        width: widget.dropdownWidth ?? 200 * Responsive.getWidth(context) / 360,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(
              8 * Responsive.getResponsive(context),
            ),
            child: SizedBox(
              height:
                  widget.dropdownHeight ??
                  200 * Responsive.getHeight(context) / 800,
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: 1 * Responsive.getResponsive(context),
                ),
                children: widget.countries
                    .map(
                      (country) => ListTile(
                        dense: true,
                        title: Text("${country.name} (${country.dialCode})"),
                        onTap: () {
                          setState(() {
                            _selectedCountry = country;
                          });
                          widget.onCountryChanged?.call(country);
                          _overlayEntry?.remove();
                          _overlayEntry = null;
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    width: widget.width ?? double.infinity,
    height: widget.height ?? 40 * Responsive.getHeight(context) / 800,
    child: CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        decoration:
            widget.boxDecoration ??
            BoxDecoration(
              color: widget.fillColor ?? Colors.white,
              borderRadius:
                  widget.borderRadius ??
                  BorderRadius.circular(
                    7.0 * Responsive.getResponsive(context),
                  ),
              border:
                  widget.border ??
                  Border.all(
                    color:
                        widget.borderColor ??
                        AppTheme.getColor(context).outline,
                  ),
              image: widget.backgroundImage != null
                  ? DecorationImage(
                      image: widget.backgroundImage!,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
        padding: EdgeInsets.symmetric(
          horizontal: 14 * Responsive.getResponsive(context),
          vertical: 12 * Responsive.getResponsive(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: widget.readOnly ?? false ? null : _toggleDropdown,
              child: Container(
                key: _countryKey,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedCountry.name,
                      style:
                          widget.countryTextStyle ??
                          const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(width: 6 * Responsive.getResponsive(context)),
                    SvgPicture.asset(
                      AppAssets.arrowDown,
                      height: .020 * Responsive.getHeight(context),
                      // width: .020 * Responsive.getWidth(context),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10 * Responsive.getResponsive(context)),
            Text(
              _selectedCountry.dialCode,
              style:
                  widget.numberTextStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
            ),
            SizedBox(width: 6 * Responsive.getResponsive(context)),
            Expanded(
              child: TextField(
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                readOnly: widget.readOnly ?? false || !widget.isEditable,
                style: widget.numberTextStyle,
                decoration: InputDecoration.collapsed(
                  hintText: widget.hintText ?? "Enter phone number",
                  hintStyle:
                      widget.hintTextStyle ??
                      TextStyle(color: AppTheme.getColor(context).outline),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
