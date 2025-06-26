import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

void showCustomEmailVerificationSheet({
  required BuildContext context,
  required String emailAddress,
  required void Function(String otp) onSubmit,
  required VoidCallback onResend,
  required VoidCallback onVerifyButtonPressed,
  final String? imageUrl,
  final double? imageHeight,
  final double? imageWidth,
  final bool? isShadowTopLeft,
  final bool? isShadowTopRight,
  final bool? isShadowBottomRight,
  final bool? isShadowBottomLeft,
  String? title,
  String? description,
  bool isDialog = false,
  int length = 6,
}) {
  isDialog
      ? showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.all(0 * getResponsive(context)),
            backgroundColor: AppColors.white,
            content: _EmailVerificationContent(
              emailAddress: emailAddress,
              length: length,
              onSubmit: onSubmit,
              onResend: onResend,
              onVerifyButtonPressed: onVerifyButtonPressed,
              description: description,
              title: title,
              imageUrl: imageUrl, // Fixed typo here
              imageHeight: imageHeight,
              imageWidth: imageWidth,
              isShadowTopLeft: isShadowTopLeft,
              isShadowTopRight: isShadowTopRight,
              isShadowBottomRight: isShadowBottomRight,
              isShadowBottomLeft: isShadowBottomLeft,
            ),
          ),
        )
      : showModalBottomSheet(
          backgroundColor: AppColors.white,
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24 * getResponsive(context)),
            ),
          ),
          builder: (context) => _EmailVerificationContent(
            emailAddress: emailAddress,
            length: length,
            onSubmit: onSubmit,
            onResend: onResend,
            onVerifyButtonPressed: onVerifyButtonPressed,
            description: description,
            title: title,
            imageUrl: imageUrl, // Fixed typo here
            imageHeight: imageHeight,
            imageWidth: imageWidth,
            isShadowTopLeft: isShadowTopLeft,
            isShadowTopRight: isShadowTopRight,
            isShadowBottomRight: isShadowBottomRight,
            isShadowBottomLeft: isShadowBottomLeft,
          ),
        );
}

class _EmailVerificationContent extends StatefulWidget {
  final String emailAddress;
  final void Function(String otp) onSubmit;
  final VoidCallback onResend;
  final VoidCallback onVerifyButtonPressed;
  final int length;
  final String? title;
  final String? description;
  final String? imageUrl;
  final double? imageHeight;
  final double? imageWidth;
  final bool? isShadowTopLeft;
  final bool? isShadowTopRight;
  final bool? isShadowBottomRight;
  final bool? isShadowBottomLeft;

  const _EmailVerificationContent({
    required this.emailAddress,
    required this.onSubmit,
    required this.onResend,
    required this.onVerifyButtonPressed,
    required this.length,
    this.title,
    this.description,
    this.imageUrl,
    this.imageHeight,
    this.imageWidth,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
    this.isShadowBottomRight = false,
    this.isShadowBottomLeft = false,
  });

  @override
  State<_EmailVerificationContent> createState() =>
      _EmailVerificationContentState();
}

class _EmailVerificationContentState extends State<_EmailVerificationContent> {
  String currentOtp = '';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 48 * getResponsive(context),
            left: 20 * getResponsive(context),
            right: 20 * getResponsive(context),
            bottom: mediaQuery.viewInsets.bottom + 16 * getResponsive(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: .016 * getHeight(context)),
              Text(
                widget.title ?? 'Email Verification Sent!',
                style: TextStyle(
                  fontSize: AppTheme.getTextStyle(context).titleLarge!.fontSize,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: .008 * getHeight(context)),
              Text(
                widget.description ??
                    'A verification code will be sent to the email${widget.emailAddress} for your account verification process.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: AppTheme.getTextStyle(context).bodyMedium!.fontSize,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: .024 * getHeight(context)),
              OTPInputField(
                length: widget.length,
                onCompleted: (_) {},
                onChanged: (code) {
                  setState(() {
                    currentOtp = code;
                  });
                },
              ),
              SizedBox(height: .012 * getHeight(context)),
              // timer
              Text(
                '00:25',
                style: TextStyle(
                  fontSize: 18 * getResponsiveText(context),
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: .008 * getHeight(context)),
              Padding(
                padding: EdgeInsets.only(left: 8.0 * getResponsive(context)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18 * getResponsiveText(context),
                      ),
                      children: [
                        const TextSpan(
                          text: "Haven't received the sign in code? ",
                        ),
                        TextSpan(
                          text: 'Resend it.',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 18 * getResponsiveText(context),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // handle resend
                              print('resend on tap');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: .02 * getHeight(context)),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18 * getResponsiveText(context),
                    color: AppColors.textPrimary,
                  ),
                  children: [
                    TextSpan(
                      text: 'Email for OTP',
                      style: const TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: AppColors.primary,
                        decorationThickness: 2,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // handle email OTP
                          print('Jemi in email');
                        },
                    ),
                    const TextSpan(
                      text: ' Or ',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Call for OTP',
                      style: const TextStyle(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: AppColors.primary,
                        decorationThickness: 2,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // handle call OTP
                          print('Jemi in Otp');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: .02 * getHeight(context)),
              MyCoButton(
                height: 40,
                // width: 150,
                onTap: currentOtp.length == widget.length
                    ? () {
                        widget.onVerifyButtonPressed();
                        widget.onSubmit(currentOtp);
                        Navigator.pop(context);
                      }
                    : null,
                title: 'Submit',
                boarderRadius: 50,
              ),
              SizedBox(height: .012 * getHeight(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'signin with different method? ',
                    style: TextStyle(
                      fontSize:
                          AppTheme.getTextStyle(context).bodyMedium!.fontSize,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onResend,
                    child: Text(
                      'Here',
                      style: TextStyle(
                        fontSize:
                            AppTheme.getTextStyle(context).bodyMedium!.fontSize,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: .008 * getHeight(context)),
            ],
          ),
        ),
        Positioned(
          top: -45 * getResponsive(context),
          left: 0 * getResponsive(context),
          right: 0 * getResponsive(context),
          child: Center(
            child: MyCoButton(
              onTap: () {},
              title: '',
              height: 0.088 * getHeight(context),
              width: 0.21 * getWidth(context),
              isShadowBottomLeft: true,
              image: widget.imageUrl != null
                  ? Image.asset(
                      widget.imageUrl!,
                      height: widget.imageHeight,
                      width: widget.imageWidth,
                    )
                  : Image.asset(
                      'assets/images/chpl_logo.png',
                      height: widget.imageHeight,
                      width: widget.imageWidth,
                    ),
            ),
            // child: Container(
            //   height: widget.imageHeight,
            //   width: widget.imageWidth,
            //   padding: EdgeInsets.all(12 * getResponsive(context)),
            //   decoration: BoxDecoration(
            //     color: AppColors.primary,
            //     borderRadius: BorderRadius.circular(
            //       16 * getResponsive(context),
            //     ),
            //     boxShadow: const [
            //       BoxShadow(
            //         color: Colors.black12,
            //         blurRadius: 8,
            //         offset: Offset(0, 2),
            //       ),
            //     ],
            //   ),
            //   child:
            // ),
          ),
        ),
      ],
    );
  }
}

class OTPInputField extends StatefulWidget {
  final int length;
  final FocusNode? focusNode;
  final TextAlign? textAlignment;
  final List<TextInputFormatter>? inputFormaters;
  final TextInputType? textInputType;
  final InputDecoration? decoration;
  final int? maxLenghts;

  final void Function(String code) onCompleted;
  final void Function(String code)? onChanged;

  const OTPInputField({
    super.key,
    required this.length,
    required this.onCompleted,
    this.onChanged,
    this.focusNode,
    this.textAlignment,
    this.inputFormaters,
    this.textInputType,
    this.decoration,
    this.maxLenghts,
  });

  @override
  State<OTPInputField> createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);
  }

  // ignore: deprecated_member_use
  void _onKeyPress(int index, RawKeyEvent event) {
    // ignore: deprecated_member_use
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
      widget.onChanged?.call(_controllers.map((c) => c.text).join());
    }
  }

  @override
  Widget build(BuildContext context) => Row(
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    spacing: 5,
    children: List.generate(
      widget.length,
      (index) => Expanded(
        child: RawKeyboardListener(
          focusNode: FocusNode(),
          onKey: (event) => _onKeyPress(index, event),
          child: TextField(
            controller: _controllers[index],
            focusNode: widget.focusNode ?? _focusNodes[index],
            maxLength: widget.maxLenghts ?? 1,
            textAlign: widget.textAlignment ?? TextAlign.center,
            keyboardType: widget.textInputType ?? TextInputType.number,
            inputFormatters:
                widget.inputFormaters ??
                [FilteringTextInputFormatter.digitsOnly],
            decoration:
                widget.decoration ??
                InputDecoration(
                  hintText: '0',

                  hintStyle: TextStyle(
                    color: AppColors.textGrey200,
                    fontSize: 30 * getResponsiveText(context),
                  ),
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8 * getResponsive(context),
                    ),
                    borderSide: const BorderSide(
                      color: AppColors.textBorder300,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8 * getResponsive(context),
                    ),
                    borderSide: const BorderSide(
                      color: AppColors.textBorder300,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8 * getResponsive(context),
                    ),
                    borderSide: const BorderSide(
                      color: AppColors.textBorder300,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10 * getResponsive(context),
                  ),
                ),
            onChanged: (val) => _onChanged(index, val),
          ),
        ),
      ),
    ),
  );
}
