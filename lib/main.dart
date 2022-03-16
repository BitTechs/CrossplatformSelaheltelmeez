import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:selaheltelmeez/core/local_storage/AppUserProvider.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/core/router/route_generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_provider/login_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/login/model/repository/login_repository.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/register_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/repository/register_repository.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/grade_menu_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/register_cubit.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_provider/validate_otp_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/repository/validate_otp_repository.dart';
import 'package:selaheltelmeez/features/student/home/model/repository/curriculum_repository.dart';
import 'package:selaheltelmeez/features/student/home/view_model/curriculum_cubit.dart';
import 'package:selaheltelmeez/features/student/layout/view_model/student_layout_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentication/validate_otp/view_model/validate_otp_cubit.dart';
import 'features/student/home/model/data_provider/curriculum_data_provider.dart';

void main()  {

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoginDataProvider>(create: (context)=> LoginDataProvider()),
        RepositoryProvider<LoginRepository>(create: (context) => LoginRepository(dataProvider: context.read<LoginDataProvider>())),
        RepositoryProvider<RegisterDataProvider>(create: (context)=> RegisterDataProvider()),
        RepositoryProvider<RegisterRepository>(create: (context) => RegisterRepository(dataProvider: context.read<RegisterDataProvider>())),
        RepositoryProvider<ValidateOTPDataProvider>(create: (context)=> ValidateOTPDataProvider()),
        RepositoryProvider<ValidateOTPRepository>(create: (context) => ValidateOTPRepository(dataProvider: context.read<ValidateOTPDataProvider>())),
        RepositoryProvider<CurriculumDataProvider>(create: (context)=> CurriculumDataProvider()),
        RepositoryProvider<CurriculumRepository>(create: (context) => CurriculumRepository(dataProvider: context.read<CurriculumDataProvider>())),
      ],
      child: MultiProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LoginCubit(context.read<LoginRepository>())),
          BlocProvider(create: (BuildContext context) => RegisterCubit(context.read<RegisterRepository>())),
          BlocProvider(create: (BuildContext context) => GradeMenuCubit(context.read<RegisterRepository>())),
          BlocProvider(create: (BuildContext context) => CurriculumCubit(context.read<CurriculumRepository>())),
          BlocProvider(create: (BuildContext context) => ValidateOtpCubit(context.read<ValidateOTPRepository>())),
          BlocProvider(create: (BuildContext context) => StudentLayoutCubit()),
        ],
        child: const SelaheltelmeezLauncher(),
      ),
    ),
  );
}

class SelaheltelmeezLauncher extends StatelessWidget {
  const SelaheltelmeezLauncher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Provider(
        create: (_)=> AppUserProvider(),
        child: MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        //initialRoute: '/',
        initialRoute: '/login',
        locale: const Locale("ar"),
        onGenerateRoute: RouteGenerator.generateRoute,
        ),
      );
  }
}
