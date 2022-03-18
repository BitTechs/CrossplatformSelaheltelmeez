import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/validate_forget_password_otp_cubit.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/view_model/validate_otp_cubit.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class ValidateForgetPasswordOTPScreen extends StatefulWidget {
  const ValidateForgetPasswordOTPScreen({Key? key}) : super(key: key);

  @override
  State<ValidateForgetPasswordOTPScreen> createState() => _ValidateOTPScreenState();
}

class _ValidateOTPScreenState extends State<ValidateForgetPasswordOTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NavigatedAppScaffold(
      title: "رمز التفعيل",
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<ValidateForgetPasswordOtpCubit, ValidateForgetPasswordOtpState>(
          listener: (context, state) async {
            if(state is ValidateForgetPasswordOtpFailed){
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if(state is ValidateForgetPasswordOtpSuccess){
              Navigator.of(context).pushNamed('/reset_password', arguments: state.identityUserId);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(children: [
                    const Center(
                        child: Image(
                      image: AssetImage(AssetsImage.loginPersonPointsDown),
                    )),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'تفعيل الحساب',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        )),
                  ]),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text('إدخل رمز التفعيل المرسل إليك'),
                const SizedBox(height: 16.0),
                _otpForm(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _otpForm() => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FancyOTPFormField(
              length: 4,
              controller: _otpController,
              inputColor: CommonColors.otpInputColor,
            ),
            const SizedBox(height: 64.0),
            Center(
              child: FancyElevatedButton(
                title: "تفعيل",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<ValidateForgetPasswordOtpCubit>()
                        .validateAsync(_otpController.text);
                  }
                },
                backGroundColor:
                    CommonColors.fancyElevatedButtonBackGroundColor,
                shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                titleColor: CommonColors.fancyElevatedTitleColor,
                width: 150,
              ),
            ),
          ],
        ),
      );
}
