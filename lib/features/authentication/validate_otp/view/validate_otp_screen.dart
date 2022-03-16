import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/local_storage/AppUserProvider.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/view_model/validate_otp_cubit.dart';
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
    final appUserProvider = context.watch<AppUserProvider>();
    appUserProvider.loadFromSharedPreference();
    return NavigatedAppScaffold(
      title: "رمز التفعيل",
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

              appUserProvider.getAppUser.isVerified = true;
              context.read<AppUserProvider>().updateAppUserProvider(appUserProvider.getAppUser);
              Navigator.of(context).pushNamed('/StudentHome');
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FancyElevatedButton(
                  title: "تفعيل",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final appUser = context.read<AppUserProvider>();
                      bool isMobile =
                          appUser.getAppUser.mobileNumber.isNotEmpty;
                      context
                          .read<ValidateOtpCubit>()
                          .validateAsync(_otpController.text, isMobile);
                    }
                  },
                  backGroundColor:
                      CommonColors.fancyElevatedButtonBackGroundColor,
                  shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                  titleColor: CommonColors.fancyElevatedTitleColor,
                  width: 150,
                ),
                FancyElevatedButton(
                  title: "إعادة الإرسال",
                  onPressed: () {
                    final appUser = context.read<AppUserProvider>();
                    bool isMobile = appUser.getAppUser.mobileNumber.isNotEmpty;
                    context
                        .read<ValidateOtpCubit>()
                        .resendActivationCodeAsync(isMobile);
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
      );
}
