import 'package:flutter/material.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              height: 30.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  FancyTextFormField(
                    hintTitle: 'البريد الإلكتروني / رقم الموبايل',
                    width: inputWidth,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  FancyTextFormField(
                    hintTitle: 'كلمة المرور',
                    width: inputWidth,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.transparent,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: Text(
                'هل نسيت كلمة المرور؟',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.red),
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
                  shadowColor: CommonColors.fancyElevatedShadowTitleColor),
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
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.transparent,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: Text(
                'تسجيل حساب جديد',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.blue),
              ),
            ),
            Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
