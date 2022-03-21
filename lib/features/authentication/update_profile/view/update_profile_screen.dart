import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/router/route_names.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/governorate_response.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/repository/update_profile_repository.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/view_model/update_profile_cubit.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'package:selaheltelmeez/widgets/buttons/scaled_button_image.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({Key? key}) : super(key: key);

  final  _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final cubit = UpdateProfileCubit(context.read<UpdateProfileRepository>())..loadAvatars();
    return BlocProvider(
      create: (context) => cubit,
      child: NavigatedAppScaffold(
      title: S.of(context).continue_signup_information,
      child: SingleChildScrollView(
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) async {
            if (state is UpdateProfileFailed) {
              final snackBar = SnackBar(
                content: Text(state.errorMessage),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is UpdateProfileSuccess) {
              Navigator.of(context).pushReplacementNamed(RouteNames.validateOTP);
            }
          },
          builder: (context, state) => OpacityLoading(
            opacity: state is UpdateProfileLoadAvatarsSubmit ? 0.5 : 1.0,
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
                          S.of(context).continue_information,
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  height: 120.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          ScaledButtonNetworkImage(
                              scale: (cubit.avatars[index].isSelected ?? false)
                                  ? 1.5
                                  : 1.0,
                            onTap: () => cubit.changeAvatar(index),
                            imageUrl: cubit.avatars[index].imageUrl,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20.0,
                      ),
                      itemCount: cubit.avatars.length,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyDropDownFormField<String>(
                          name: 'birthDate',
                          hintTitle: S.of(context).birth_year,
                          items: const ['1990', '1999', '2000'],
                          itemBuilder: (context, item) => Text(item),
                          onChanged: (value) =>
                              cubit.changeBirthOfYear(value!)),
                      const SizedBox(
                        height: 8.0,
                      ),
                      FormBuilderCheckbox(
                          name: 'liveInEgypt',
                          activeColor: Colors.blue,
                          checkColor: Colors.white,
                          initialValue: cubit.liveInEgypt,
                          onChanged: (bool? value) => cubit.changeCountry(),
                          title: Text(S.of(context).my_country, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),),
                          controlAffinity:
                          ListTileControlAffinity.leading),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FancyDropDownFormField<GovernorateResponse>(
                          name: 'governorate',
                          isEnabled : cubit.liveInEgypt,
                          hintTitle: S.of(context).governorate,
                          items: cubit.governorates,
                          itemBuilder: (context, item) =>
                              Text(item.name),
                          onChanged: (value) =>
                              cubit.selectGovernorate(value)),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(S.of(context).gender),
                          ScaledButtonAssetImage(
                            scale: cubit.gender == "female" ? 1.5 : 1.0,
                            opacity: cubit.gender == "female" ? 1.0 : 0.6,
                            onTap: () => cubit.changeGender('female'),
                            imageUrl: AssetsImage.female,
                          ),
                          ScaledButtonAssetImage(
                            scale: cubit.gender == "male" ? 1.5 : 1.0,
                            opacity: cubit.gender == "male" ? 1.0 : 0.6,
                            onTap: () => cubit.changeGender('male'),
                            imageUrl: AssetsImage.male,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FancyElevatedButton(
                        width: 140.0,
                        title: S.of(context).get_continue,
                        backGroundColor:
                            CommonColors.fancyElevatedButtonBackGroundColor,
                        titleColor: CommonColors.fancyElevatedTitleColor,
                        shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                        onPressed: () async {
                          if (_formKey.currentState!.saveAndValidate()) {
                            await context
                                .read<UpdateProfileCubit>()
                                .updateProfileAsync();
                          }
                        }),
                    FancyElevatedButton(
                        width: 140.0,
                        title: S.of(context).later,
                        backGroundColor:
                            CommonColors.fancyElevatedButtonBackGroundColor,
                        titleColor: CommonColors.fancyElevatedTitleColor,
                        shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                        onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.validateOTP,  (Route<dynamic> route) => false)
                    ),
                  ],
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
