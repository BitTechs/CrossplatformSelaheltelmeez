import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/model/repository/login_repository.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final  _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => LoginCubit(context.read<LoginRepository>()),
    child: NavigatedAppScaffold(
      title: S.of(context).login,
      child: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginFailed) {
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is LoginVerifiedSuccess) {
              // Trying to loading App User Entity Values
              Navigator.of(context).pushReplacementNamed("/StudentHome");
            }
            if(state is LoginNotVerifiedSuccess){
              // Trying to loading App User Entity Values
              Navigator.of(context).pushNamed(RouteNames.validateOTP);
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
                          S.of(context).login,
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
                _loginForm(),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: CustomTextButton(
                    text: S.of(context).forget_my_password,
                    color: CommonColors.forgetPasswordColor,
                    onPressed: ()=> Navigator.of(context).pushNamed(RouteNames.forgetPassword),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: FancyElevatedButton(
                      width: 140.0,
                      title: S.of(context).login_btn,
                      backGroundColor:
                          CommonColors.fancyElevatedButtonBackGroundColor,
                      titleColor: CommonColors.fancyElevatedTitleColor,
                      shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                      onPressed: () async {
                        if (_formKey.currentState!.saveAndValidate()) {
                          await context.read<LoginCubit>().loginAsync(
                              LoginRequest(
                                  email: Utilities.isEmail(_formKey.currentState?.value['emailOrMobile']),
                                  passwordHash: _formKey.currentState?.value['password'],
                                  officeId: "",
                                  googleId: "",
                                  facebookId: "",
                                  mobileNumber:  Utilities.isMobile(_formKey.currentState?.value['emailOrMobile'])));
                        }
                      }),
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
                Center(
                  child: CustomTextButton(
                    text: S.of(context).create_new_account,
                    color: Colors.blue,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(RouteNames.register),
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

  Widget _loginForm() => FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FancyTextFormField(
              placeholderText:S.of(context).email_or_mobile,
              name: 'emailOrMobile',
              validators: [
                IsRequiredRule(S.of(context).field_required),
                IsEmailOrEgyptianMobileRule(S.of(context).incorrect_email_or_mobile)
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            FancyPasswordFormField(
              placeholderText: S.of(context).password,
              name: 'password',
              validators: [
                IsRequiredRule(S.of(context).field_required),
              ],
            ),
          ],
        ),
      );
}
