import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_transfer_object/change_email_or_mobile_request.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/view_model/change_email_or_mobile_cubit.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/forget_password_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/reset_password_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/forget_password_cubit.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/reset_password_cubit.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
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
      title: 'تحديث كلمة المرور',
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
                          'تحديث بيانات',
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
                        placeholderText: 'كلمة المرور',
                        name: 'password',
                        width: inputWidth,
                        validators: [
                          IsValidRequiredRule('هذا الحقل مطلوب'),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      FancyPasswordFormField(
                        placeholderText: 'تأكيد كلمة المرور',
                        name: 'confirmPassword',
                        width: inputWidth,
                        validators: [
                          IsValidRequiredRule('هذا الحقل مطلوب'),
                          IsValidConfirmPasswordRule(
                              'كلمة المرور وتأكيد كلمة المرور غير متطابقين',
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
                      title: 'إرسال',
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
