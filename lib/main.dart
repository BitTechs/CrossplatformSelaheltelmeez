import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:selaheltelmeez/core/router/route_generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:selaheltelmeez/core/theme/app_theme.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_provider/login_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/login/model/repository/login_repository.dart';
import 'package:selaheltelmeez/features/authentication/login/view_model/login_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/remote_data_provider/register_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/repository/register_repository.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/grade_menu_cubit.dart';
import 'package:selaheltelmeez/features/authentication/register/view_model/register_cubit.dart';
import 'package:selaheltelmeez/features/student/home/business_logic_layer/subject_status_cubit.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoginDataProvider>(create: (context)=> LoginDataProvider()),
        RepositoryProvider<LoginRepository>(create: (context) => LoginRepository(dataProvider: context.read<LoginDataProvider>())),
        RepositoryProvider<RegisterDataProvider>(create: (context)=> RegisterDataProvider()),
        RepositoryProvider<RegisterRepository>(create: (context) => RegisterRepository(dataProvider: context.read<RegisterDataProvider>())),

      ],
      child: MultiProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LoginCubit(context.read<LoginRepository>())),
          BlocProvider(create: (BuildContext context) => RegisterCubit(context.read<RegisterRepository>())),
          BlocProvider(create: (BuildContext context) => GradeMenuCubit(context.read<RegisterRepository>())),
          BlocProvider(create: (BuildContext context) => SubjectStatusCubit())
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
    return MaterialApp(
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
}
