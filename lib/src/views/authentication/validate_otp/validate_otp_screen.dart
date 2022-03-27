import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/local_storage/repositories/app_user_repository.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/src/bloc/authentication/validate_otp/validate_otp_cubit.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/validate_otp/validate_otp_repository.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class ValidateOTPScreen extends StatelessWidget {
   ValidateOTPScreen({Key? key}) : super(key: key);
  final  _formKey = GlobalKey<FormBuilderState>();
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ValidateOtpCubit(repo:context.read<ValidateOTPRepository>(), appUserRepository: context.read<AppUserRepository>()),
  child: NavigatedAppScaffold(
      title: S.of(context).activation_code,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<ValidateOtpCubit, ValidateOtpState>(
          listener: (context, state) async {
            if(state is ValidateOtpFailed){
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if(state is ValidateOtpSuccess){
              Navigator.of(context).pushReplacementNamed(RouteNames.studentHomeLayout);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FancyElevatedButton(
                            title: S.of(context).activate,
                            onPressed: () async {
                              if (_otpController.text.isNotEmpty) {
                                context
                                    .read<ValidateOtpCubit>()
                                    .validateAsync(_otpController.text);
                              }
                            },
                            backGroundColor:
                            CommonColors.fancyElevatedButtonBackGroundColor,
                            shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                            titleColor: CommonColors.fancyElevatedTitleColor,
                            width: 150,
                          ),
                          FancyElevatedButton(
                            title: S.of(context).resend,
                            onPressed: () async {
                              context
                                  .read<ValidateOtpCubit>()
                                  .resendActivationCodeAsync();
                            },
                            backGroundColor:
                            CommonColors.fancyElevatedButtonBackGroundColor,
                            shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                            titleColor: CommonColors.fancyElevatedTitleColor,
                            width: 150,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
);
  }
}
