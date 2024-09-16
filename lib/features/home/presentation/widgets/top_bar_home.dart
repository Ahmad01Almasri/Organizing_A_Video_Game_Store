import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../lan/cubit.dart';

class TopBarHome extends StatelessWidget {
  final Function(String) onFilterSelected;

  const TopBarHome({
    super.key,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            S.of(context).title,
            style: AppTextStyles.font20BlackBold.copyWith(fontSize: 30),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              onFilterSelected(value);
            },
            icon: const Icon(
              Icons.filter_list,
              size: 30,
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "All devices",
                child: Text("All devices"),
              ),
              const PopupMenuItem(
                value: "laptop",
                child: Text("laptop"),
              ),
              const PopupMenuItem(
                value: "computer",
                child: Text("computer"),
              ),
              const PopupMenuItem(
                value: "playstation",
                child: Text("playstation"),
              ),
            ],
          ),
          BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return DropdownButton<Locale>(
                icon: const Icon(Icons.language), // أيقونة لتغيير اللغة
                underline: Container(), // إزالة الخط السفلي
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    context.read<LanguageCubit>().toggleLanguage();
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Row(
                      children: [
                        Icon(Icons
                            .flag), // رمز للعلم أو يمكن استخدام صور الأعلام
                        SizedBox(width: 8),
                        Text('English'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Row(
                      children: [
                        Icon(Icons
                            .flag), // رمز للعلم أو يمكن استخدام صور الأعلام
                        SizedBox(width: 8),
                        Text('العربية'),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
