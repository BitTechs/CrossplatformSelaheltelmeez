import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/src/bloc/authentication/forget_password/forget_password_cubit.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/forget_password_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/forget_password/forget_password_repository.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ForgetPasswordCubit(context.read<ForgetPasswordRepository>()),
      child: NavigatedAppScaffold(
        title: S.of(context).forget_my_password,
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
                Navigator.of(context)
                    .pushReplacementNamed(RouteNames.validateForgetPassword);
              }
            },
            builder: (context, state) => OpacityLoading(
              opacity: state is ForgetPasswordSubmit ? 0.5 : 1.0,
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
                            S.of(context).restore_information,
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
                      S.of(context).send_confirmation_message,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 12.0),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  _forgetPasswordForm(),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Center(
                    child: FancyElevatedButton(
                        width: 140.0,
                        title: S.of(context).send,
                        backGroundColor:
                            CommonColors.fancyElevatedButtonBackGroundColor,
                        titleColor: CommonColors.fancyElevatedTitleColor,
                        shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                        onPressed: () async {
                          if (_formKey.currentState!.saveAndValidate()) {
                            await context
                                .read<ForgetPasswordCubit>()
                                .sendForgetPasswordAsync(ForgetPasswordRequest(
                                    email: Utilities.isEmail(_formKey
                                        .currentState?.value['emailOrMobile']),
                                    mobileNumber: Utilities.isMobile(_formKey
                                        .currentState
                                        ?.value['emailOrMobile'])));
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgetPasswordForm() => FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FancyTextFormField(
                placeholderText: S.of(context).email_or_mobile,
                name: 'emailOrMobile',
                validator: MultiValidationRules([
                  IsRequiredRule(validationError: S.of(context).field_required),
                  IsEmailOrEgyptianMobileRule(
                      validationError: S.of(context).incorrect_email_or_mobile),
                ])),
          ],
        ),
      );
}
