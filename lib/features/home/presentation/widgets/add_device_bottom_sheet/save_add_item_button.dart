import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/routing/routes.dart';
import 'package:game_store/injection_container.dart' as di;

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/device_model.dart';
import '../../cubit/device_cubit.dart';

class SaveAddItemButton extends StatefulWidget {
  final TextEditingController nameDeviceController;
  final TextEditingController typeDeviceController;
  final TextEditingController priceHourDeviceController;
  final GlobalKey<FormState> formstate;

  const SaveAddItemButton({
    super.key,
    required this.nameDeviceController,
    required this.typeDeviceController,
    required this.priceHourDeviceController,
    required this.formstate,
  });

  @override
  State<SaveAddItemButton> createState() => _SaveAddItemButtonState();
}

class _SaveAddItemButtonState extends State<SaveAddItemButton> {
  late final DeviceCubit _cubit;

  @override
  void initState() {
    _cubit = di.sl<DeviceCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: MaterialButton(
        height: 50,
        minWidth: double.infinity,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        onPressed: () {
          if (widget.formstate.currentState!.validate()) {
            final device = DeviceModel.create(
              name: widget.nameDeviceController.text,
              type: widget.typeDeviceController.text,
              price: widget.priceHourDeviceController.text,
              isAvailable: true,
            );
            _cubit.addDevice(device);
            context.pushReplacementNamed(Routes.homeScreen);
          }
        },
        color: AppColors.primaryColor,
        child: Text(
          "حفظ",
          style: AppTextStyles.font17WhiteMedium,
        ),
      ),
    );
  }
}
