import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_store/core/theming/app_colors.dart';
import 'package:game_store/features/home/presentation/pages/finished_customer.dart';
import '../../features/home/data/models/device_model.dart';
import '../../features/home/presentation/cubits/language/language_cubit.dart';
import '../helpers/spacing.dart';
import 'drawer_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final List<DeviceModel> devices;

  const MyDrawer({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                DrawerListTitel(
                  icon: Icons.home,
                  text: 'الصفحة الرئيسية',
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                verticalSpace(20),
                DrawerListTitel(
                  icon: Icons.emoji_events,
                  text: 'الدوري',
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                verticalSpace(20),
                DrawerListTitel(
                  icon: Icons.notifications,
                  text: 'الاشعارات',
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                verticalSpace(20),
                DrawerListTitel(
                  icon: Icons.logout,
                  text: 'الزبائن المنتهين',
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FinishedCustomersScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Language selection at the bottom
          Padding(
            padding: const EdgeInsets.only(
                bottom: 20.0), // Add padding to keep it spaced from the bottom
            child: BlocBuilder<LanguageCubit, Locale>(
              builder: (context, locale) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<Locale>(
                      icon: const Icon(Icons.language, color: Colors.white),
                      underline: Container(),
                      dropdownColor: AppColors.primaryColor,
                      onChanged: (Locale? newLocale) {
                        if (newLocale != null) {
                          context.read<LanguageCubit>().toggleLanguage();
                        }
                      },
                      items: [
                        DropdownMenuItem(
                          value: const Locale('en'),
                          child: Row(
                            children: [
                              const Icon(Icons.flag, color: Colors.white),
                              SizedBox(width: 5.w),
                              const Text('English',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: const Locale('ar'),
                          child: Row(
                            children: [
                              const Icon(Icons.flag, color: Colors.white),
                              SizedBox(width: 5.w),
                              const Text('العربية',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
