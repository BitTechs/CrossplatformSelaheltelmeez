import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/grade_menu_item.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/grade_menu_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/register_cubit.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailOrMobileController = TextEditingController();
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
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailed) {
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is RegisterSuccess) {
              Navigator.of(context).pushNamed("/update_profile");
            }
          },
          builder: (context, state) => OpacityLoading(
            opacity: state is RegisterSubmit ? 0.5 : 1.0,
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
                    InkWell(
                        onTap: () async {
                          context.read<RegisterCubit>().setIdentityRoleId(1);
                          await context
                              .read<GradeMenuCubit>()
                              .getGradeMenuItemsAsync();
                        },
                        child: const ImageWithBottomHeader(
                          width: 100.0,
                          image: AssetsImage.studentUser,
                          header: 'طالب',
                          headerBackgroundColor: Colors.red,
                        )),
                    InkWell(
                        onTap: () =>
                            context.read<RegisterCubit>().setIdentityRoleId(2),
                        child: const ImageWithBottomHeader(
                          width: 100.0,
                          image: AssetsImage.parentUser,
                          header: 'ولي أمر',
                          headerBackgroundColor: Colors.green,
                        )),
                    InkWell(
                        onTap: () =>
                            context.read<RegisterCubit>().setIdentityRoleId(3),
                        child: const ImageWithBottomHeader(
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
                _registerForm(inputWidth),
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
                      if (_formKey.currentState!.validate()) {
                        await context.read<RegisterCubit>().registerAsync(
                            RegisterRequest(
                                fullName: fullNameController.text,
                                grade: context.read<RegisterCubit>().getGradeId,
                                identityRoleId: context.read<RegisterCubit>().getIdentityRoleId,
                                email: Utilities.isEmail(emailOrMobileController.text),
                                mobileNumber: Utilities.isMobile(emailOrMobileController.text),
                                passwordHash: passwordController.text,
                                facebookId: "",
                                googleId: "",
                                officeId: ""));
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
        ),
      ),
    );
  }

  Widget _registerForm(double inputWidth) => Form(
        key: _formKey,
        child: Column(
          children: [
            FancyTextFormField(
              hintTitle: 'البريد الإلكتروني / رقم الموبايل',
              controller: emailOrMobileController,
              width: inputWidth,
              validators: [
                IsValidRequiredRule('هذا الحقل مطلوب'),
                IsValidEmailOrMobileRule(
                    'البريد الإلكتروني او الموبايل مكتوب بشكل غير صحيح')
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            FancyTextFormField(
              hintTitle: 'الاسم بالكامل',
              controller: fullNameController,
              width: inputWidth,
              validators: [IsValidRequiredRule('هذا الحقل مطلوب')],
            ),
            const SizedBox(
              height: 8.0,
            ),
            BlocConsumer<GradeMenuCubit, GradeMenuState>(
              listener: (context, state) async {
                if (state is GradeMenuInitial) {}
                if (state is GradeMenuError) {
                  final snackBar = SnackBar(
                    content: Text(state.errorMessage ?? "Error"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                if (state is GradeMenuLoading) {
                  const Center(child: DoubleBounce());
                }
                if (state is GradeMenuLoaded) {
                  return FancyDropDownFormField<GradeMenuItem>(
                    width: inputWidth,
                    hintTitle: 'اختر الصف الدراسي',
                    validators: (value)=> [IsValidRequiredRule('هذا الحقل مطلوب')].getValidationErrorMessage(value?.name),
                    items: state.items ?? [],
                    itemBuilder: (context, item) => Text(
                      item.name,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontSize: 14),
                    ),
                    onChanged: (value) =>
                        context.read<RegisterCubit>().setGradeId(value!.id),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            FancyPasswordFormField(
              hintTitle: 'كلمة المرور',
              controller: passwordController,
              width: inputWidth,
              validators: [
                IsValidRequiredRule('هذا الحقل مطلوب'),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            FancyPasswordFormField(
              hintTitle: 'تأكيد كلمة المرور',
              controller: confirmPasswordController,
              width: inputWidth,
              validators: [
                IsValidRequiredRule('هذا الحقل مطلوب'),
                IsValidConfirmPasswordRule(
                    'كلمة المرور وتأكيد كلمة المرور غير متطابقين',
                    password: passwordController.text)
              ],
            ),
          ],
        ),
      );
}
