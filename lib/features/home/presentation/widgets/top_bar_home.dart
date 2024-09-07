import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

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
                value: "كل الأجهزة",
                child: Text("كل الأجهزة"),
              ),
              const PopupMenuItem(
                value: "لابتوب",
                child: Text("لابتوب"),
              ),
              const PopupMenuItem(
                value: "حاسب",
                child: Text("حاسب"),
              ),
              const PopupMenuItem(
                value: "بلايستيشن",
                child: Text("بلايستيشن"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
