import 'package:flutter/material.dart';
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
            borderRadius: BorderRadius.circular(8 * Responsive.getResponsive(context)),
            child: SizedBox(
              height: widget.dropdownHeight ?? 200 * Responsive.getHeight(context) / 800,
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: 4 * Responsive.getResponsive(context),
                ),
                children: widget.countries.map((country) => ListTile(
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
                  )).toList(),
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
          decoration: widget.boxDecoration ??
              BoxDecoration(
                color: widget.fillColor ?? AppTheme.getColor(context).onPrimary,
                borderRadius: widget.borderRadius ??
                    BorderRadius.circular(7.0 * Responsive.getResponsive(context)),
                border: widget.border ??
                    Border.all(
                      color: widget.borderColor ??
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
            horizontal: 12 * Responsive.getResponsive(context),
            vertical: 0, // Remove vertical padding to keep it inline
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Country selector: name + icon + dial code
              GestureDetector(
                onTap: widget.readOnly ?? false ? null : _toggleDropdown,
                child: Container(
                  key: _countryKey,
                  padding: EdgeInsets.symmetric(
                      vertical: 8 * Responsive.getResponsive(context),
                      horizontal: 4 * Responsive.getResponsive(context)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _selectedCountry.name,
                        style: widget.countryTextStyle ??
                            TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16 * Responsive.getResponsiveText(context),
                            ),
                      ),
                      SizedBox(width: 1 * Responsive.getResponsive(context)),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppTheme.getColor(context).primary,
                        size: 22 * Responsive.getResponsive(context),
                      ),
                      SizedBox(width: 4 * Responsive.getResponsive(context)),
                      Text(
                        _selectedCountry.dialCode,
                        style: widget.numberTextStyle ??
                            TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16 * Responsive.getResponsiveText(context),
                            ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Spacer between country selector and textfield
              SizedBox(width: 10 * Responsive.getResponsive(context)),

              /// Phone number input
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  keyboardType: TextInputType.phone,
                  readOnly: widget.readOnly ?? false || !widget.isEditable,
                  style: widget.numberTextStyle ??
                      TextStyle(
                        fontSize: 16 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w400,
                      ),
                  decoration: InputDecoration.collapsed(
                    hintText: widget.hintText ?? "Enter phone number",
                    hintStyle: widget.hintTextStyle ??
                        TextStyle(
                          fontSize: 16 * Responsive.getResponsiveText(context),
                          color: AppTheme.getColor(context).outline,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}

// CustomMobileNumberField(

//                   readOnly: false,
//                   // width: 200,
//                   // height: 44,
//                   dropdownHeight: 200,
//                   countries: countryList,
//                   controller: phoneController,
//                   onCountryChanged: (selected) {},
//                 ),