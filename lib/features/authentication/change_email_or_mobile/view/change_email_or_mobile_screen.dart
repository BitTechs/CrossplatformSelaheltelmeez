import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_transfer_object/change_email_or_mobile_request.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/view_model/change_email_or_mobile_cubit.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class ChangeEmailOrMobileScreen extends StatefulWidget {
  const ChangeEmailOrMobileScreen({Key? key}) : super(key: key);

  @override
  _ChangeEmailOrMobileState createState() => _ChangeEmailOrMobileState();
}

class _ChangeEmailOrMobileState extends State<ChangeEmailOrMobileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final inputWidth = (MediaQuery.of(context).size.width) - 24.0;
    return NavigatedAppScaffold(
      title: 'تحديث البريد الإلكتروني أو الموبايل',
      child: SingleChildScrollView(
        child: BlocConsumer<ChangeEmailOrMobileCubit, ChangeEmailOrMobileState>(
          listener: (context, state) async {
            if (state is ChangeEmailOrMobileFailed) {
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ChangeEmailOrMobileSuccess) {
              // Navigate to OTP Verification.
              Navigator.of(context).pushNamed("/StudentHome");
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
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'سوف يتم إرسال رسالة تفعيل جديدة في حالة تحديث البيانات',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                ),
                _changeEmailOrMobileForm(inputWidth),
                const SizedBox(
                  height: 8.0,
                ),
                Center(
                  child: FancyElevatedButton(
                      width: 140.0,
                      title: 'تحديث',
                      backGroundColor:
                          CommonColors.fancyElevatedButtonBackGroundColor,
                      titleColor: CommonColors.fancyElevatedTitleColor,
                      shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await context.read<ChangeEmailOrMobileCubit>().updateAsync(
                              ChangeEmailOrMobileRequest(
                                  newEmail: Utilities.isEmail(_formKey.currentState?.value['emailOrMobile']),
                                  password: _formKey.currentState?.value['password'],
                                  newMobileNumber: Utilities.isMobile(_formKey.currentState?.value['emailOrMobile'])));
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

  Widget _changeEmailOrMobileForm(double inputWidth) => FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FancyTextFormField(
              placeholderText: 'البريد الإلكتروني / رقم الموبايل',
              name: 'emailOrMobile',
              width: inputWidth,
              validators: [
                IsValidRequiredRule('هذا الحقل مطلوب'),
                IsValidEmailOrMobileRule('البريد الإلكتروني مكتوب بشكل غير صحيح')
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            FancyPasswordFormField(
              placeholderText: 'كلمة المرور',
              name: 'password',
              width: inputWidth,
              validators: [
                IsValidRequiredRule('هذا الحقل مطلوب'),
              ],
            ),
          ],
        ),
      );
}
