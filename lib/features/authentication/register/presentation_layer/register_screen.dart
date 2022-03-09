import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/login/business_logic_layer/login_request_state.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_user.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

final futureLoginProvider = StateNotifierProvider((ref) {
  return LoginRequestState();
});

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final gradeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputWidth = (MediaQuery.of(context).size.width) - 24.0;
    return NavigatedAppScaffold(
      title: 'تسجيل مستخدم جديد',
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
                      'تسجيل مستخدم جديد',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                    )),
              ]),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(onTap: ()=>{}, child:const ImageWithBottomHeader(
                  width: 100.0,
                  image: AssetsImage.studentUser,
                  header: 'طالب',
                  headerBackgroundColor: Colors.red,
                )),
                InkWell(onTap: ()=>{}, child:  const ImageWithBottomHeader(
                  width: 100.0,
                  image: AssetsImage.parentUser,
                  header: 'ولي أمر',
                  headerBackgroundColor: Colors.green,
                )),
                InkWell(onTap: ()=>{}, child: const ImageWithBottomHeader(
                  width: 100.0,
                  image: AssetsImage.teacherUser,
                  header: 'مدرس',
                  headerBackgroundColor: Colors.blue,
                )),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Form(
              key: _formKey,
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
                  FancyTextFormField(
                    hintTitle: 'الاسم بالكامل',
                    controller: emailController,
                    width: inputWidth,
                    validators: [IsValidRequiredRule('هذا الحقل مطلوب')],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  FancyDropDownFormField<String>(
                    width: inputWidth,
                    hintTitle: 'اختر الصف الدراسي',
                    validators: [IsValidRequiredRule('هذا الحقل مطلوب')],
                    items: const ['الصف الدراسي الاول', 'الصف الدراسي الثاني', 'الصف الدراسي الثالث'],
                    itemBuilder: (context, item) => Text(item, style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 14),),
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
                  const SizedBox(
                    height: 8.0,
                  ),
                  FancyPasswordFormField(
                    hintTitle: 'تأكيد كلمة المرور',
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
            Center(
              child: FancyElevatedButton(
                width: 140.0,
                title: 'تسجيل',
                backGroundColor:
                    CommonColors.fancyElevatedButtonBackGroundColor,
                titleColor: CommonColors.fancyElevatedTitleColor,
                shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                onPressed: () async {

                  Navigator.of(context).pushNamed('/StudentHome');


                  if (_formKey.currentState!.validate()) {
                    final commitResult = await ref
                        .read(futureLoginProvider.notifier)
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
            Center(
              child: Text('أو يمكنك الدخول باستخدام',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                      Image(
                          image: AssetImage(AssetsImage.googleAuth),
                          width: 65.0),
                      Image(
                          image: AssetImage(AssetsImage.microsoftAuth),
                          width: 65.0)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
