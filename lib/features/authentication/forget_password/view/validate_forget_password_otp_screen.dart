import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/validate_forget_password_otp_cubit.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class ValidateForgetPasswordOTPScreen extends StatelessWidget {
  ValidateForgetPasswordOTPScreen({Key? key}) : super(key: key);

  final  _formKey = GlobalKey<FormBuilderState>();

  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NavigatedAppScaffold(
      title: S.of(context).activation_code,
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
                          S.of(context).activate_account,
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
                Text(S.of(context).enter_activation_code),
                const SizedBox(height: 16.0),
                FormBuilder(
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
                          title: S.of(context).activate,
                          onPressed: () async {
                            if (_formKey.currentState!.saveAndValidate()) {
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
