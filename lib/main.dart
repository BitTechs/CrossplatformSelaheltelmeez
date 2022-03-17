import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/router/route_generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_provider/remote_login_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/login/model/repository/login_repository.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/i_register_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/register_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/repository/register_repository.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/grade_menu_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/register_cubit.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_provider/validate_otp_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/repository/validate_otp_repository.dart';
import 'package:selaheltelmeez/features/student/dashboard/dashboard/model/data_provider/curriculum_data_provider.dart';
import 'package:selaheltelmeez/features/student/dashboard/dashboard/model/repository/curriculum_repository.dart';
import 'package:selaheltelmeez/features/student/dashboard/dashboard/view_model/curriculum_cubit.dart';
import 'package:selaheltelmeez/features/student/student_navigation_bar/view_model/navigation_bar_cubit.dart';
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
          BlocProvider(
              create: (BuildContext context) =>
                  LoginCubit(context.read<LoginRepository>())),
          BlocProvider(
              create: (BuildContext context) =>
                  RegisterCubit(context.read<RegisterRepository>())),
          BlocProvider(
              create: (BuildContext context) =>
                  GradeMenuCubit(context.read<RegisterRepository>())),
          BlocProvider(
              create: (BuildContext context) =>
                  CurriculumCubit(context.read<CurriculumRepository>())),
          BlocProvider(
              create: (BuildContext context) =>
                  ValidateOtpCubit(context.read<ValidateOTPRepository>())),
          BlocProvider(create: (BuildContext context) => StudentNavBarCubit()),
        ],
        child: _materialApp(),
      ),
    );
  }

  Widget _materialApp() => MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        locale: const Locale("ar"),
        onGenerateRoute: RouteGenerator.generateRoute,
      );
}
