import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class ValidateOTPScreen extends StatefulWidget {
  const ValidateOTPScreen({Key? key}) : super(key: key);

  @override
  State<ValidateOTPScreen> createState() => _ValidateOTPScreenState();
}

class _ValidateOTPScreenState extends State<ValidateOTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return NavigatedAppScaffold(
      title: "رمز التفعيل",
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('إدخل رمز التفعيل المرسل إليك'),
              const SizedBox(height: 16.0),
              FancyOTPFormField(
                length: 4,
                controller: _otpController,
                inputColor: CommonColors.otpInputColor,
              ),
              const SizedBox(height: 100.0),
              Center(
                child: FancyElevatedButton(
                  title: "تأكيد",
                  onPressed: () => {},
                  backGroundColor:
                      CommonColors.fancyElevatedButtonBackGroundColor,
                  shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                  titleColor: CommonColors.fancyElevatedTitleColor,
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
