import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_transfer_object/change_email_or_mobile_request.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/view_model/change_email_or_mobile_cubit.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/forget_password_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/forget_password_cubit.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailOrMobileController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final inputWidth = (MediaQuery.of(context).size.width) - 24.0;
    return NavigatedAppScaffold(
      title: 'نسيت كلمة المرور',
      child: SingleChildScrollView(
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) async {
            if (state is ForgetPasswordFailed) {
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ForgetPasswordSuccess) {
              // Navigate to OTP Verification.
              Navigator.of(context).pushNamed("/validate_forget_password_otp");
            }
          },
          builder: (context, state) => OpacityLoading(
            opacity: state is LoginSubmit ? 0.5 : 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          'إسترجاع بيانات',
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
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'سوف يتم إرسال رسالة تأكيد على البريد الإلكتروني أو الموبايل المسجل',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1?.copyWith(
                        fontSize: 12.0
                      )
                          ,
                    ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                _forgetPasswordForm(inputWidth),
                const SizedBox(
                  height: 8.0,
                ),
                Center(
                  child: FancyElevatedButton(
                      width: 140.0,
                      title: 'إرسال',
                      backGroundColor:
                          CommonColors.fancyElevatedButtonBackGroundColor,
                      titleColor: CommonColors.fancyElevatedTitleColor,
                      shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await context.read<ForgetPasswordCubit>().sendForgetPasswordAsync(
                              ForgetPasswordRequest(
                                  email: Utilities.isEmail(emailOrMobileController.text),
                                  mobileNumber: Utilities.isMobile(emailOrMobileController.text)));
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgetPasswordForm(double inputWidth) => Form(
        key: _formKey,
        child: Column(
          children: [
            FancyTextFormField(
              hintTitle: 'البريد الإلكتروني / رقم الموبايل',
              controller: emailOrMobileController,
              width: inputWidth,
              validators: [
                IsValidRequiredRule('هذا الحقل مطلوب'),
                IsValidEmailOrMobileRule('البريد الإلكتروني مكتوب بشكل غير صحيح')
              ],
            ),
          ],
        ),
      );
}
