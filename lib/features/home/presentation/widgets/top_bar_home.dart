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
              PopupMenuItem(
                value: S.of(context).all_devices,
                child: Text(S.of(context).all_devices),
              ),
              PopupMenuItem(
                value: S.of(context).laptop,
                child: Text(S.of(context).laptop),
              ),
              PopupMenuItem(
                value: S.of(context).computer,
                child: Text(S.of(context).computer),
              ),
              PopupMenuItem(
                value: S.of(context).playstation,
                child: Text(S.of(context).playstation),
              ),
            ],
          ),
          BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return Switch(
                value: locale.languageCode == 'ar',
                onChanged: (_) =>
                    context.read<LanguageCubit>().toggleLanguage(),
                activeColor: Colors.blue,
              );
            },
          ),
        ],
      ),
    );
  }
}
