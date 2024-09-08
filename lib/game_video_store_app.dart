import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/theming/theme_date_var.dart';

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
          locale: const Locale('en'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors
                  .white, // Set the color of the selected time and OK button (main color)
            ),
            buttonTheme: const ButtonThemeData(
              colorScheme: ColorScheme.light(
                primary: AppColors.primaryColor, // OK button background color
              ),
            ),
            timePickerTheme: AppThemeData.mytimePickerThemeData,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.primaryColor,
            ),
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: AppColors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homeScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
