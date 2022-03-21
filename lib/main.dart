import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/core/language_change_provider.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_entity.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/identity_role_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:selaheltelmeez/core/router/route_generator.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/data_provider/remote_change_email_or_mobile_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/model/repository/change_email_or_mobile_repository.dart';
import 'package:selaheltelmeez/features/authentication/change_email_or_mobile/view_model/change_email_or_mobile_cubit.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_provider/remote_forget_password_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/repository/forget_password_repository.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/forget_password_cubit.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/reset_password_cubit.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/view_model/validate_forget_password_otp_cubit.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_provider/remote_login_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/login/model/repository/login_repository.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/register_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/repository/register_repository.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/grade_menu_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/register_cubit.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/repository/update_profile_repository.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/view_model/update_profile_cubit.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_provider/validate_otp_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/repository/validate_otp_repository.dart';
import 'package:selaheltelmeez/features/student/classes/class_search/view_model/class_search_cubit.dart';
import 'package:selaheltelmeez/features/student/dashboard/dashboard/model/data_provider/curriculum_data_provider.dart';
import 'package:selaheltelmeez/features/student/dashboard/dashboard/model/repository/curriculum_repository.dart';
import 'package:selaheltelmeez/features/student/dashboard/dashboard/view_model/curriculum_cubit.dart';
import 'package:selaheltelmeez/features/student/student_navigation_bar/view_model/navigation_bar_cubit.dart';
import 'package:selaheltelmeez/generated/l10n.dart';
import 'core/local_storage/app_user_local_storage_provider.dart';
import 'core/router/route_names.dart';
import 'features/authentication/update_profile/model/data_provider/remote_update_profile_provider.dart';
import 'features/authentication/validate_otp/view_model/validate_otp_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Trying to loading App User Entity Values
  await AppUserLocalStorageProvider.tryToLoadAppUserEntity();

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
        // Dio Clients
        RepositoryProvider<AnonymousDioClient>(
            create: (context) => AnonymousDioClient()),
        RepositoryProvider<AuthorizedDioClient>(
            create: (context) => AuthorizedDioClient()),

        // Login
        RepositoryProvider<RemoteLoginDataProvider>(
            create: (context) => RemoteLoginDataProvider(
                dioClient: context.read<AnonymousDioClient>())),
        RepositoryProvider<LoginRepository>(
            create: (context) => LoginRepository(
                dataProvider: context.read<RemoteLoginDataProvider>())),

        // Register
        RepositoryProvider<RemoteRegisterDataProvider>(
            create: (context) => RemoteRegisterDataProvider(
                dioClient: context.read<AnonymousDioClient>())),
        RepositoryProvider<RegisterRepository>(
            create: (context) => RegisterRepository(
                dataProvider: context.read<RemoteRegisterDataProvider>())),
        // Update Profile
        RepositoryProvider<RemoteUpdateProfileProvider>(create: (context) => RemoteUpdateProfileProvider(dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<UpdateProfileRepository>(create: (context) => UpdateProfileRepository(dataProvider: context.read<RemoteUpdateProfileProvider>())),
        //Change Email Or Mobile
        RepositoryProvider<RemoteChangeEmailOrMobileDataProvider>(create: (context) => RemoteChangeEmailOrMobileDataProvider(dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<ChangeEmailOrMobileRepository>(create: (context) => ChangeEmailOrMobileRepository(dataProvider: context.read<RemoteChangeEmailOrMobileDataProvider>())),

        // Forget Password
        RepositoryProvider<RemoteForgetPasswordDataProvider>(create: (context) => RemoteForgetPasswordDataProvider(dioClient: context.read<AnonymousDioClient>())),
        RepositoryProvider<ForgetPasswordRepository>(create: (context) => ForgetPasswordRepository(dataProvider: context.read<RemoteForgetPasswordDataProvider>())),

        //Validate OTP
        RepositoryProvider<ValidateOTPDataProvider>(
            create: (context) => ValidateOTPDataProvider(
                dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<ValidateOTPRepository>(
            create: (context) => ValidateOTPRepository(
                dataProvider: context.read<ValidateOTPDataProvider>())),

        RepositoryProvider<CurriculumDataProvider>(
            create: (context) => CurriculumDataProvider(
                dioClient: context.read<AuthorizedDioClient>())),
        RepositoryProvider<CurriculumRepository>(
            create: (context) => CurriculumRepository(
                dataProvider: context.read<CurriculumDataProvider>())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => ChangeEmailOrMobileCubit(context.read<ChangeEmailOrMobileRepository>())),
          BlocProvider(create: (BuildContext context) => GradeMenuCubit(context.read<RegisterRepository>())),
          BlocProvider(create: (BuildContext context) => CurriculumCubit(context.read<CurriculumRepository>())),
          BlocProvider(create: (BuildContext context) => StudentNavBarCubit()),
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
                //initialRoute: '/',
                 initialRoute: AppUserLocalStorageProvider.sharedAppUserEntity == null ? RouteNames.index : RouteNames.studentHomeLayout,
                locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocal,
                onGenerateRoute: RouteGenerator.generateRoute,
              ),
        );
      }
    ),
  );
}
