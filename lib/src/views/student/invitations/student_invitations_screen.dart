import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:selaheltelmeez/assets/assets_image.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';
import 'package:selaheltelmeez/src/bloc/student/invitation/invitation_cubit.dart';
import 'package:selaheltelmeez/src/data/student/repositories/invitations/invitation_respository.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';
import 'package:selaheltelmeez/widgets/loading/double_bounce.dart';
import 'package:selaheltelmeez/widgets/scaffold/flat_app_scaffold.dart';
import 'package:sizer/sizer.dart';

class StudentInvitationsScreen extends StatelessWidget {
  const StudentInvitationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatAppScaffold(
      child: BlocProvider(
        create: (context) =>
            InvitationCubit(context.read<InvitationRepository>())
              ..loadInvitationAsync(),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      color: CommonColors.studentHomeTopBar,
                      width: double.infinity,
                      height: 64.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32.0,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        height: 64.0,
                        width: 64.0,
                        child: Icon(
                          Icons.people,
                          color: CommonColors.studentHomeTopBar,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            BlocConsumer<InvitationCubit, InvitationState>(
                builder: (context, state) {
              if (state is InvitationEmpty) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: CommonColors.fancyElevatedButtonBackGroundColor,
                          shape: BoxShape.circle,
                        ),
                        height: 120.0,
                        width: 120.0,
                        child: const Icon(
                          Icons.announcement_outlined,
                          size: 32.0,

                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        ''
                        'ليس لديك دعوات جديدة',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                );
              } else if (state is InvitationLoading) {
                return const DoubleBounce();
              } else if (state is InvitationSuccess) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 6.w),
                          child: Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              SizedBox(
                                height: 10.h,
                                width: MediaQuery.of(context).size.width,
                                child: SvgPicture.asset(
                                  AssetsImage.inputBackground,
                                  color: CommonColors.inputBackgroundColor,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    width: 10.h,
                                    height: 10.h,
                                    //fit: BoxFit.fill,
                                    image: NetworkImage(
                                        state.response[index].avatarUrl),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(state.response[index].description),
                                        Text(DateFormat("yMMMEd").format(DateTime.parse(state.response[index].createdOn))),
                                       ],
                                    ),
                                  ),
                                ],
                              ),
                              if(!state.response[index].isSeen)...[
                                Padding(
                                  padding: EdgeInsets.only(top: 1.w),
                                  child: CircleAvatar(
                                    backgroundColor:
                                    CommonColors.studentHomeTopBar,
                                    radius: 2.w,
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FancyElevatedButton(
                              title: 'موافق',
                              backGroundColor: CommonColors
                                  .fancyElevatedButtonBackGroundColor,
                              titleColor: CommonColors.fancyElevatedTitleColor,
                              shadowColor:
                                  CommonColors.fancyElevatedShadowTitleColor,
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            FancyElevatedButton(
                              title: 'رفض',
                              backGroundColor: CommonColors
                                  .fancyElevatedButtonBackGroundColor,
                              titleColor: CommonColors.fancyElevatedTitleColor,
                              shadowColor:
                                  CommonColors.fancyElevatedShadowTitleColor,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  itemCount: state.response.length,
                );
              } else {
                return const SizedBox();
              }
            }, listener: (context, state) async {
              if (state is InvitationFailed) {
                final snackBar = SnackBar(
                  content: Text(state.errorMessage),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }),
          ],
        ),
      ),
    );
  }
}
