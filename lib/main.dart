import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/core/language_change_provider.dart';
import 'package:selaheltelmeez/core/local_storage/object_box_db.dart';
import 'package:selaheltelmeez/core/local_storage/repositories/app_user_repository.dart';
import 'package:selaheltelmeez/src/bloc/authentication/change_email_or_mobile/change_email_or_mobile_cubit.dart';
import 'package:selaheltelmeez/src/bloc/authentication/register/grade_menu_cubit.dart';
import 'package:selaheltelmeez/src/bloc/authentication/register/identity_role_cubit.dart';
import 'package:selaheltelmeez/src/bloc/parent/student_navigation_bar/navigation_bar_cubit.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/change_email_or_mobile/remote_change_email_or_mobile_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/forget_password/remote_forget_password_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/login/remote_login_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/register/register_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/update_profile/remote_update_profile_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/validate_otp/remote_validate_otp_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/change_email_or_mobile/change_email_or_mobile_repository.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/forget_password/forget_password_repository.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/login/login_repository.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/register/register_repository.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/update_profile/update_profile_repository.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/validate_otp/validate_otp_repository.dart';
import 'package:selaheltelmeez/src/data/student/data_provider/game_object_activity/game_object_activity_data_provider.dart';
import 'package:selaheltelmeez/src/data/student/data_provider/invitations/invitation_data_provider.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';
import 'package:selaheltelmeez/src/data/student/repositories/game_object_activity/game_object_activity_repository.dart';
import 'package:selaheltelmeez/src/data/student/repositories/invitations/invitation_respository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:selaheltelmeez/core/router/route_generator.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/src/bloc/student/student_navigation_bar/navigation_bar_cubit.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'core/router/route_names.dart';
import 'src/bloc/student/classes/class_search_cubit.dart';
import 'src/data/student/data_provider/curriculum/curriculum_data_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingletonAsync<ObjectBox>(() async => await ObjectBox.create());
  GetIt.I.registerSingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  await GetIt.I.allReady();
  // Trying to loading App User Entity Values

  runApp(
    const SelaheltelmeezLauncher(),
  );
}

class SelaheltelmeezLauncher extends StatelessWidget {
  const SelaheltelmeezLauncher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // AppUser Repository
        RepositoryProvider<AppUserRepository>(
            create: (context) => AppUserRepository(
                objectBox: GetIt.I.get<ObjectBox>(),
                sharedPreferenceInstance: GetIt.I.get<SharedPreferences>())),

        // Dio Clients
        RepositoryProvider<AnonymousDioClient>(
            create: (context) => AnonymousDioClient()),
        RepositoryProvider<AuthorizedDioClient>(
            create: (context) => AuthorizedDioClient(appUserRepository: context.read<AppUserRepository>())),



        // Login
        RepositoryProvider<RemoteLoginDataProvider>(
            create: (context) => RemoteLoginDataProvider(
                dioClient: context.read<AnonymousDioClient>())),

        RepositoryProvider<LoginRepository>(
            create: (context) => LoginRepository(dataProvider: context.read<RemoteLoginDataProvider>())),

        // Register
        RepositoryProvider<RemoteRegisterDataProvider>(
            create: (context) => RemoteRegisterDataProvider(
                dioClient: context.read<AnonymousDioClient>())),
        RepositoryProvider<RegisterRepository>(
            create: (context) => RegisterRepository(
                dataProvider: context.read<RemoteRegisterDataProvider>())),
        // Update Profile
        RepositoryProvider<RemoteUpdateProfileDataProvider>(create: (context) => RemoteUpdateProfileDataProvider(dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<UpdateProfileRepository>(create: (context) => UpdateProfileRepository(dataProvider: context.read<RemoteUpdateProfileDataProvider>())),
        //Change Email Or Mobile
        RepositoryProvider<RemoteChangeEmailOrMobileDataProvider>(create: (context) => RemoteChangeEmailOrMobileDataProvider(dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<ChangeEmailOrMobileRepository>(create: (context) => ChangeEmailOrMobileRepository(dataProvider: context.read<RemoteChangeEmailOrMobileDataProvider>())),

        // Forget Password
        RepositoryProvider<RemoteForgetPasswordDataProvider>(create: (context) => RemoteForgetPasswordDataProvider(dioClient: context.read<AnonymousDioClient>())),
        RepositoryProvider<ForgetPasswordRepository>(create: (context) => ForgetPasswordRepository(dataProvider: context.read<RemoteForgetPasswordDataProvider>())),

        //Validate OTP
        RepositoryProvider<RemoteValidateOTPDataProvider>(
            create: (context) => RemoteValidateOTPDataProvider(
                dioClient: context.read<AuthorizedDioClient>())),

        RepositoryProvider<ValidateOTPRepository>(create: (context) => ValidateOTPRepository( dataProvider: context.read<RemoteValidateOTPDataProvider>())),

        RepositoryProvider<CurriculumDataProvider>(create: (context) => CurriculumDataProvider(dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<CurriculumRepository>(create: (context) => CurriculumRepository(dataProvider: context.read<CurriculumDataProvider>())),

        RepositoryProvider<GameObjectActivityDataProvider>(create: (context) => GameObjectActivityDataProvider(dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<GameObjectActivityRepository>(create: (context) => GameObjectActivityRepository(dataProvider: context.read<GameObjectActivityDataProvider>())),

        RepositoryProvider<InvitationDataProvider>(create: (context) => InvitationDataProvider(dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<InvitationRepository>(create: (context) => InvitationRepository(dataProvider: context.read<InvitationDataProvider>()))

      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => ChangeEmailOrMobileCubit(context.read<ChangeEmailOrMobileRepository>())),
          BlocProvider(create: (BuildContext context) => GradeMenuCubit(context.read<RegisterRepository>())),
          BlocProvider(create: (BuildContext context) => StudentNavBarCubit()),
          BlocProvider(create: (BuildContext context) => ParentNavBarCubit()),
          BlocProvider(create: (BuildContext context) => ClassSearchCubit()),
          BlocProvider(create: (BuildContext context) => IdentityRoleCubit()),
        ],
        child: _materialApp(context),
      ),
    );
  }

  Widget _materialApp(BuildContext context) => ChangeNotifierProvider<LanguageChangeProvider>(
    create: (context)=> LanguageChangeProvider(),
    child: Builder(
      builder: (context) {
        final appUser = context.read<AppUserRepository>().getAppUser();
        return Sizer(
            builder: (context, orientation, deviceType)=>
                MaterialApp(
                onGenerateTitle: (context) => S.of(context).appTitle,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                initialRoute: appUser == null ? RouteNames.index : RouteNames.studentHomeLayout ,
               // initialRoute: RouteNames.parentHome ,
                locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocal,
                onGenerateRoute: RouteGenerator.generateRoute,
              ),
        );
      }
    ),
  );
}
