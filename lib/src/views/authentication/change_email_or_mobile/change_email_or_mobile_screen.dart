import 'package:enterprise_validator/enterprise_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/helpers/utilities.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/authentication/change_email_or_mobile/change_email_or_mobile_cubit.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/change_email_or_mobile/change_email_or_mobile_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/change_email_or_mobile/change_email_or_mobile_repository.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

import '../../../../generated/l10n.dart';

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
    return BlocProvider(
  create: (context) => ChangeEmailOrMobileCubit(context.read<ChangeEmailOrMobileRepository>()),
  child: NavigatedAppScaffold(
      title: S.of(context).update_email_or_mobile,
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
              Navigator.of(context).pushReplacementNamed("/StudentHome");
            }
          },
          builder: (context, state) => OpacityLoading(
            opacity: state is ChangeEmailOrMobileSubmit ? 0.5 : 1.0,
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
                        child: Text(S.of(context).update_information,
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
                    child: Text(S.of(context).send_activation_message,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                ),
                _changeEmailOrMobileForm(),
                const SizedBox(
                  height: 8.0,
                ),
                Center(
                  child: FancyElevatedButton(
                      width: 140.0,
                      title: S.of(context).update,
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
    ),
);
  }

  Widget _changeEmailOrMobileForm() => FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FancyTextFormField(
              placeholderText: S.of(context).email_or_mobile,
              name: 'emailOrMobile',
              validator: MultiValidationRules([
                IsRequiredRule(validationError:S.of(context).field_required),
                IsEmailOrEgyptianMobileRule(validationError: S.of(context).incorrect_email_or_mobile),
              ])
            ),
            const SizedBox(
              height: 8.0,
            ),
            FancyPasswordFormField(
              placeholderText: S.of(context).password,
              name: 'password',
              validator: IsRequiredRule(validationError: S.of(context).field_required),
            ),
          ],
        ),
      );
}
