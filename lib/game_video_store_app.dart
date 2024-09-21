import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/theming/theme_date_var.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'features/home/presentation/cubits/language/language_cubit.dart';
import 'generated/l10n.dart';

class GameStoreApp extends StatelessWidget {
  final AppRouter appRouter;
  const GameStoreApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              locale: locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: AppThemeData.lightTheme(),
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.homeScreen,
              onGenerateRoute: appRouter.generateRoute,
            ),
          );
        },
      ),
    );
  }
}
