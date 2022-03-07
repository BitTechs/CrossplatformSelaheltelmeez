import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/login/business_logic_layer/login_provider_container.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_user.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputWidth = (MediaQuery.of(context).size.width) - 24.0;
    return NavigatedAppScaffold(
      title: 'تسجيل الدخول',
      child: SingleChildScrollView(
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
                      'تسجيل الدخول',
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
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  FancyTextFormField(
                    hintTitle: 'البريد الإلكتروني / رقم الموبايل',
                    controller: emailController,
                    width: inputWidth,
                    validators: [IsValidRequiredRule('هذا الحقل مطلوب'), IsValidEmailAddressRule('البريد الإلكتروني مكتوب بشكل غير صحيح')],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  FancyPasswordFormField(
                    hintTitle: 'كلمة المرور',
                    controller: passwordController,
                    width: inputWidth,
                    validators: [IsValidRequiredRule('هذا الحقل مطلوب'),],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: CustomTextButton(
                text: 'هل نسيت كلمة المرور؟',
                color:  CommonColors.errorTextColor,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Center(
              child: FancyElevatedButton(
                width: 140.0,
                title: 'دخول',
                backGroundColor:
                    CommonColors.fancyElevatedButtonBackGroundColor,
                titleColor: CommonColors.fancyElevatedTitleColor,
                shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final commitResult = await ref
                        .read(LoginProviderContainer.futureLoginProvider.notifier)
                        .loginAsync(LoginUser()
                        ..email = emailController.text
                        ..passwordHash = passwordController.text
                    );
                    if (commitResult.isSuccess ?? false) {
                      ///TODO: Add Navigation.
                    } else {
                      final snackBar = SnackBar(
                        content: Text(commitResult.errorMessage ?? "Error"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('استمرار باستخدام',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Image(
                          image: AssetImage(
                            AssetsImage.facebookAuth,
                          ),
                          width: 65.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Image(
                            image: AssetImage(AssetsImage.googleAuth),
                            width: 65.0),
                        SizedBox(
                          width: 12.0,
                        ),
                        Image(
                            image: AssetImage(AssetsImage.microsoftAuth),
                            width: 65.0)
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Center(
              child: CustomTextButton(
                text: 'تسجيل حساب جديد',
                color:  Colors.blue,
              ),
            ),
           /* Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ImageWithBottomHeader(
                  width: 100.0,
                  height: 180.0,
                  image: AssetsImage.studentUser,
                  header: 'طالب',
                  headerBackgroundColor: Colors.red,
                ),
                ImageWithBottomHeader(
                  width: 100.0,
                  height: 180.0,
                  image: AssetsImage.parentUser,
                  header: 'ولي أمر',
                  headerBackgroundColor: Colors.green,
                ),
                ImageWithBottomHeader(
                  width: 100.0,
                  height: 180.0,
                  image: AssetsImage.teacherUser,
                  header: 'مدرس',
                  headerBackgroundColor: Colors.blue,
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
