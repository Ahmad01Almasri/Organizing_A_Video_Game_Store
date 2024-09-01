import 'package:flutter/material.dart';

import '../widgets/add_item_floating_action_button.dart';
import '../widgets/list_view_device_item.dart';
import '../widgets/top_bar_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBarHome(),
              ListViewDevices(),
            ],
          ),
        ),
        floatingActionButton: AddItemButton(),
      ),
    );
  }
}
