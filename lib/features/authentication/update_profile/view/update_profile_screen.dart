import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/core/validation_rules/validatable.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/governorate_response.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/view_model/update_profile_cubit.dart';
import 'package:selaheltelmeez/widgets/buttons/scaled_button_image.dart';
import 'package:selaheltelmeez/widgets/widget_imports.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    UpdateProfileCubit.get(context).loadAvatars();
  }

  @override
  Widget build(BuildContext context) {
    final inputWidth = (MediaQuery.of(context).size.width) - 24.0;
    final cubit = UpdateProfileCubit.get(context);
    return NavigatedAppScaffold(
      title: 'استكمال بيانات تسجيل',
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
              Navigator.of(context).pushNamed("/validate_otp");
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
                          'استكمال بيانات',
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
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FancyDropDownFormField<String>(
                          hintTitle: 'سنة الميلاد',
                          width: inputWidth,
                          items: const ['1990', '1999', '2000'],
                          itemBuilder: (context, item) => Text(item),
                          onChanged: (value) =>
                              cubit.changeBirthOfYear(value!)),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          height: 65.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CheckboxListTile(
                                    activeColor: Colors.blue,
                                    checkColor: Colors.white,
                                    value: cubit.liveInEgypt,
                                    onChanged: (bool? value) =>
                                        cubit.changeCountry(),
                                    title: const Text('بلدي مصر'),
                                    controlAffinity:
                                        ListTileControlAffinity.leading),
                              ),
                              Expanded(
                                flex: 1,
                                child: Visibility(
                                  visible: cubit.liveInEgypt,
                                  child: FancyDropDownFormField<
                                          GovernorateResponse>(
                                      hintTitle: 'محافظتي',
                                      width: inputWidth,
                                      items: cubit.governorates,
                                      itemBuilder: (context, item) =>
                                          Text(item.name),
                                      onChanged: (value) =>
                                          cubit.selectGovernorate(value)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('اختر النوع'),
                          ScaledButtonAssetImage(
                            scale: cubit.gender == "female" ? 1.5 : 1.0,
                            onTap: () => cubit.changeGender('female'),
                            imageUrl: AssetsImage.female,
                          ),
                          ScaledButtonAssetImage(
                            scale: cubit.gender == "female" ? 1.5 : 1.0,
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
                        title: 'استكمال',
                        backGroundColor:
                            CommonColors.fancyElevatedButtonBackGroundColor,
                        titleColor: CommonColors.fancyElevatedTitleColor,
                        shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await context
                                .read<UpdateProfileCubit>()
                                .updateProfileAsync();
                          }
                        }),
                    FancyElevatedButton(
                        width: 140.0,
                        title: 'لاحقاً',
                        backGroundColor:
                            CommonColors.fancyElevatedButtonBackGroundColor,
                        titleColor: CommonColors.fancyElevatedTitleColor,
                        shadowColor: CommonColors.fancyElevatedShadowTitleColor,
                        onPressed: () => Navigator.of(context).pushNamed("/validate_otp")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
