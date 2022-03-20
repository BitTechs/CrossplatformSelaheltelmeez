import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/reset_password_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/reset_password_cubit.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String identityUserId;

  const ResetPasswordScreen({Key? key, required this.identityUserId})
      : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final inputWidth = (MediaQuery.of(context).size.width) - 24.0;
    return NavigatedAppScaffold(
      title: S.of(context).update_password,
      child: SingleChildScrollView(
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) async {
            if (state is ResetPasswordFailed) {
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ResetPasswordSuccess) {
              Navigator.of(context).pushNamed("/login");
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
                          S.of(context).update_information,
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
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FancyPasswordFormField(
                        placeholderText: S.of(context).password,
                        name: 'password',
                        width: inputWidth,
                        validators: [
                          IsValidRequiredRule(S.of(context).field_required),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      FancyPasswordFormField(
                        placeholderText: S.of(context).confirm_password,
                        name: 'confirmPassword',
                        width: inputWidth,
                        validators: [
                          IsValidRequiredRule(S.of(context).field_required),
                          IsValidConfirmPasswordRule(
                              S.of(context).password_not_matched,
                              password: _formKey.currentState?.value['password'] ?? "")
                        ],
                      ),
                    ],
                  ),
                ),
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
                              .read<ResetPasswordCubit>()
                              .resetAsync(ResetPasswordRequest(
                                identityUserId: widget.identityUserId,
                                newPassword: _formKey.currentState?.value['password'],
                              ));
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
}
