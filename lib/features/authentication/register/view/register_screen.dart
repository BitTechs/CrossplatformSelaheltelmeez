import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/grade_menu_item.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/grade_menu_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/register_cubit.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final  _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputWidth = (MediaQuery.of(context).size.width) - 24.0;
    return NavigatedAppScaffold(
      title: S.of(context).sign_up,
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
                        child: Text(S.of(context).sign_up,
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
                          RegisterCubit.get(context).changeRoleColor(1);
                          context.read<RegisterCubit>().setIdentityRoleId(1);
                          await context
                              .read<GradeMenuCubit>()
                              .getGradeMenuItemsAsync();
                        },
                        child: ImageWithBottomHeader(
                          width: 100.0,
                          image: AssetsImage.studentUser,
                          header: S.of(context).student,
                          headerBackgroundColor: RegisterCubit.get(context).selectedRole == 1 ? Colors.red : CommonColors.inputBackgroundColor,
                        )),
                    InkWell(
                        onTap: () {
                            RegisterCubit.get(context).changeRoleColor(2);
                            context.read<RegisterCubit>()..setIdentityRoleId(2);},
                        child: ImageWithBottomHeader(
                          width: 100.0,
                          image: AssetsImage.parentUser,
                          header: S.of(context).parent,
                          headerBackgroundColor: RegisterCubit.get(context).selectedRole == 2 ? Colors.green : CommonColors.inputBackgroundColor,
                        )),
                    InkWell(
                        onTap: () {
                          RegisterCubit.get(context).changeRoleColor(3);
                          context.read<RegisterCubit>()..setIdentityRoleId(3);},
                        child: ImageWithBottomHeader(
                          width: 100.0,
                          image: AssetsImage.teacherUser,
                          header: S.of(context).teacher,
                          headerBackgroundColor: RegisterCubit.get(context).selectedRole == 3 ? Colors.blue : CommonColors.inputBackgroundColor,
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
                    title: S.of(context).register,
                    backGroundColor:
                        CommonColors.fancyElevatedButtonBackGroundColor,
                    titleColor: CommonColors.fancyElevatedTitleColor,
                    shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await context.read<RegisterCubit>().registerAsync(
                            RegisterRequest(
                                fullName: _formKey.currentState?.value['fullName'],
                                grade: context.read<RegisterCubit>().getGradeId,
                                identityRoleId: context.read<RegisterCubit>().getIdentityRoleId,
                                email: Utilities.isEmail(_formKey.currentState?.value['emailOrMobile']),
                                mobileNumber: Utilities.isMobile(_formKey.currentState?.value['emailOrMobile']),
                                passwordHash: _formKey.currentState?.value['password'],
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
                  child: Text(S.of(context).login_with_social,
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

  Widget _registerForm(double inputWidth) => FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FancyTextFormField(
              placeholderText:S.of(context).email_or_mobile,
              name: 'emailOrMobile',
              width: inputWidth,
              validators: [
                IsValidRequiredRule(S.of(context).field_required),
                IsValidEmailOrMobileRule(S.of(context).incorrect_email_or_mobile
                    )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            FancyTextFormField(
              placeholderText: S.of(context).full_name,
              name: 'fullName',
              width: inputWidth,
              validators: [IsValidRequiredRule(S.of(context).field_required)],
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
                    hintTitle: S.of(context).choose_year,
                    validators: (value)=> [IsValidRequiredRule(S.of(context).field_required)].getValidationErrorMessage(value?.name),
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
              name: 'ConfirmPassword',
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
      );
}
