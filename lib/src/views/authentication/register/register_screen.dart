import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/src/bloc/authentication/register/grade_menu_cubit.dart';
import 'package:selaheltelmeez/src/bloc/authentication/register/identity_role_cubit.dart';
import 'package:selaheltelmeez/src/bloc/authentication/register/register_cubit.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/grade_menu_item.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/register_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/register/register_repository.dart';
import 'package:selaheltelmeez/widgets/buttons/scaled_button_image.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';
import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          RegisterCubit(context.read<RegisterRepository>()),
      child: NavigatedAppScaffold(
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
                Navigator.of(context).pushReplacementNamed(RouteNames.updateProfile);
              }
            },
            builder: (context, state) => OpacityLoading(
              opacity: state is RegisterSubmit ? 0.5 : 1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 29.h,
                    child: Stack(children: [
                      const Center(
                          child: Image(
                        image: AssetImage(AssetsImage.loginPersonPointsDown),
                      )),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 1.5.w),
                            child: Text(
                              S.of(context).sign_up,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.white,
                                  fontSize: 10.sp),
                            ),
                          )),
                    ]),
                  ),
                   SizedBox(
                    height: 8.w,
                  ),
                  BlocBuilder<IdentityRoleCubit, IdentityRoleState>(
                    builder: (context, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ScaledWidget(
                            scale:
                                (state is IdentityRoleStudentState) ? 1.2 : 1.0,
                            opacity:
                                (state is IdentityRoleStudentState) ? 1.0 : 0.6,
                            onTap: () {
                              context.read<RegisterCubit>().showInputForm();
                              context
                                  .read<IdentityRoleCubit>()
                                  .selectIdentityRole(1);

                              context
                                  .read<GradeMenuCubit>()
                                  .confirmSelectionToStudentRole(true);
                            },
                            child: ImageWithBottomHeader(
                              width: 25.w,
                              image: AssetsImage.studentUser,
                              header: 'طالب',
                              headerBackgroundColor:
                                  CommonColors.studentIdentityRoleColor,
                            ),
                          ),
                          ScaledWidget(
                            scale:
                                (state is IdentityRoleParentState) ? 1.2 : 1.0,
                            opacity:
                                (state is IdentityRoleParentState) ? 1.0 : 0.6,
                            onTap: () {
                              context.read<RegisterCubit>().showInputForm();
                              context
                                  .read<IdentityRoleCubit>()
                                  .selectIdentityRole(2);
                              context
                                  .read<GradeMenuCubit>()
                                  .confirmSelectionToStudentRole(false);
                            },
                            child: ImageWithBottomHeader(
                              width: 25.w,
                              image: AssetsImage.parentUser,
                              header: 'ولي أمر',
                              headerBackgroundColor:
                                  CommonColors.parentIdentityRoleColor,
                            ),
                          ),
                          ScaledWidget(
                            scale:
                                (state is IdentityRoleTeacherState) ? 1.2 : 1.0,
                            opacity:
                                (state is IdentityRoleTeacherState) ? 1.0 : 0.6,
                            onTap: () {
                              context.read<RegisterCubit>().showInputForm();
                              context
                                  .read<IdentityRoleCubit>()
                                  .selectIdentityRole(3);
                              context
                                  .read<GradeMenuCubit>()
                                  .confirmSelectionToStudentRole(false);
                            },
                            child: ImageWithBottomHeader(
                              width: 25.w,
                              image: AssetsImage.teacherUser,
                              header: 'مدرس',
                              headerBackgroundColor:
                                  CommonColors.teacherIdentityRoleColor,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                   SizedBox(
                    height: 8.w,
                  ),
                  Visibility(
                    visible: (state is ShowInputForm) ? true : false,
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsetsDirectional.only(
                            start: 4.w,
                            end: 4.w,
                          ),
                          child: FormBuilder(
                            key: _formKey,
                            child: Column(
                              children: [
                                FancyTextFormField(
                                  placeholderText: S.of(context).email_or_mobile,
                                  name: 'emailOrMobile',
                                    validator : MultiValidationRules([
                                      IsRequiredRule(validationError: S.of(context).field_required),
                                      IsEmailOrEgyptianMobileRule(
                                          validationError: S.of(context).incorrect_email_or_mobile),
                                    ])
                                ),
                                 SizedBox(
                                  height: 2.w,
                                ),
                                FancyTextFormField(
                                  placeholderText: S.of(context).full_name,
                                  name: 'fullName',
                                  validator: IsRequiredRule(validationError: S.of(context).field_required),
                                ),
                                 SizedBox(
                                  height: 2.0,
                                ),
                                BlocConsumer<GradeMenuCubit, GradeMenuState>(
                                  listener: (context, state) async {
                                    if (state is GradeMenuError) {
                                      final snackBar = SnackBar(
                                        content:
                                            Text(state.errorMessage ?? "Error"),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is GradeMenuLoading) {
                                      const Center(child: DoubleBounce());
                                    }
                                    if (state is GradeMenuLoaded) {
                                      return FancyDropDownFormField<
                                          GradeMenuItem>(
                                        name: 'gradeMenu',
                                        hintTitle: S.of(context).choose_year,
                                        validator: IsRequiredRule(validationError: S.of(context).field_required),
                                        items: state.items ?? [],
                                        itemBuilder: (context, item) => Text(
                                          item.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(fontSize: 14),
                                        ),
                                        onChanged: (value) => context
                                            .read<GradeMenuCubit>()
                                            .selectGradeMenuItem(value!.id),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                ),
                                 SizedBox(
                                  height: 2.w,
                                ),
                                FancyPasswordFormField(
                                  placeholderText: S.of(context).password,
                                  name: 'password',
                                  controller: _controller,
                                  validator: IsRequiredRule(validationError: S.of(context).field_required),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                FancyConfirmPasswordFormField(
                                  placeholderText: S.of(context).confirm_password,
                                  name: 'confirmPassword',
                                  passwordController: _controller,
                                  validator: IsRequiredRule(validationError: S.of(context).field_required),
                                ),
                              ],
                            ),
                          ),
                        ),
                         SizedBox(
                          height: 8.w,
                        ),
                        Center(
                          child: FancyElevatedButton(
                            width: 30.w,
                            title: S.of(context).register,
                            backGroundColor:
                                CommonColors.fancyElevatedButtonBackGroundColor,
                            titleColor: CommonColors.fancyElevatedTitleColor,
                            shadowColor:
                                CommonColors.fancyElevatedShadowTitleColor,
                            onPressed: () async {
                              _formKey.currentState?.save();
                              if (_formKey.currentState?.validate() ?? false) {
                                await context
                                    .read<RegisterCubit>()
                                    .registerAsync(RegisterRequest(
                                        fullName: _formKey
                                            .currentState?.value['fullName'],
                                        gradeId: context
                                            .read<GradeMenuCubit>()
                                            .getGradeId,
                                        identityRoleId: context
                                            .read<IdentityRoleCubit>()
                                            .getIdentityRoleId,
                                        email: Utilities.isEmail(_formKey
                                            .currentState
                                            ?.value['emailOrMobile']),
                                        mobileNumber: Utilities.isMobile(
                                            _formKey.currentState
                                                ?.value['emailOrMobile']),
                                        passwordHash: _formKey
                                            .currentState?.value['password'],
                                        facebookId: "",
                                        googleId: "",
                                        officeId: ""));
                              }
                            },
                          ),
                        ),
                         SizedBox(
                          height: 4.w,
                        ),
                        Center(
                          child: Text(S.of(context).login_with_social,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 11.sp,
                              )),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children:  [
                                  Image(
                                    image: AssetImage(
                                      AssetsImage.facebookAuth,
                                    ),
                                    width: 15.w,
                                  ),
                                  Image(
                                      image: AssetImage(AssetsImage.googleAuth),
                                      width: 15.w),
                                  Image(
                                      image:
                                          AssetImage(AssetsImage.microsoftAuth),
                                      width: 15.w)
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
