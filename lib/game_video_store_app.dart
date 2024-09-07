import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/app_strings.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors.dart';
import 'generated/l10n.dart';

class GameStoreApp extends StatelessWidget {
  final AppRouter appRouter;
  const GameStoreApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          locale: Locale('ar'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.primaryColor,
            ),
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: AppStrings.appFont,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homeScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
