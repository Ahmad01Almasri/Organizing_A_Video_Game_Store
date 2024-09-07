import 'package:flutter/material.dart';

import '../widgets/device/add/add_device_floating_action_button.dart';
import '../widgets/cubit_builder_home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CubitBuilderHomePage(),
      ),
      floatingActionButton: AddDeviceButton(),
    );
  }
}
