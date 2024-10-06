import 'package:flutter/material.dart';
import 'package:game_store/core/theming/app_colors.dart';
import 'package:game_store/core/theming/app_text_styles.dart';
import '../../../../../../core/helpers/app_functions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widget/custom_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/customer_model.dart';
import '../add/select_time_dialogs.dart';
import 'details_session_bottom_sheet.dart';

class FormTextDetailsSession extends StatefulWidget {
  const FormTextDetailsSession({
    super.key,
    required this.priceController,
    required this.customerNameController,
    required this.customerTimeController,
    required this.isAvailable,
    required this.customer, // نمرر العميل الحالي
  });

  final bool isAvailable;
  final TextEditingController customerNameController;
  final TextEditingController customerTimeController;
  final TextEditingController priceController;
  final CustomerModel? customer; // العميل الحالي

  @override
  State<FormTextDetailsSession> createState() => _FormTextDetailsSessionState();
}

class _FormTextDetailsSessionState extends State<FormTextDetailsSession> {
  late FocusNode _nameFocusNode;
  int price = 0; // متغير لتخزين السعر الحالي

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_nameFocusNode);
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    widget.customerNameController.dispose();
    widget.customerTimeController.dispose();
    widget.priceController.dispose(); // التخلص من الحقل
    super.dispose();
  }

  // دالة لإضافة السعر للزبون الحالي
  void addPriceToCustomer() {
    // قراءة السعر المدخل
    final priceText = widget.priceController.text;
    final parsedPrice = int.tryParse(priceText);

    if (parsedPrice != null && parsedPrice > 0) {
      setState(() {
        price = parsedPrice; // تعيين السعر الحالي
        widget.priceController.clear(); // إعادة تعيين حقل الإدخال
      });

      // التحقق من وجود الزبون
      if (widget.customer != null) {
        // إذا كان الزبون موجودًا، أضف السعر لقائمة الأسعار
        widget.customer!.prices.add(price);
      } else {}

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تمت إضافة السعر: $price')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرجاء إدخال سعر صحيح')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextForm(
          labelText: S.of(context).customer_name,
          controller: widget.customerNameController,
          focusNode: _nameFocusNode,
          validator: (text) {
            return AppFunctions.validationNotEmpty(context, text);
          },
          readOnly: !widget.isAvailable,
        ),
        verticalSpace(10),
        widget.isAvailable
            ? TextButton(
                onPressed: () async {
                  selectedTime = await showTimeSelectionDialog(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.timer,
                      color: AppColors.primaryColor,
                    ),
                    horizontalSpace(10),
                    Text(
                      S.of(context).set_reminder,
                      style: AppTextStyles.font18DarkBlueSemiBold
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              )
            : CustomTextForm(
                labelText: S.of(context).time,
                controller: widget.customerTimeController,
                readOnly: true,
              ),
        verticalSpace(10),
        Row(
          children: [
            Expanded(
              child: CustomTextForm(
                labelText: 'طلبات إضافية',
                controller: widget.priceController, // إدخال السعر
                keyboardType: TextInputType.number,
              ),
            ),
            IconButton(
              onPressed: addPriceToCustomer, // استدعاء الدالة لإضافة السعر
              icon: Icon(Icons.add_circle_outline_rounded),
              color: AppColors.primaryColor,
            ),
          ],
        ),
        verticalSpace(10),
        // عرض السعر المضاف الحالي
        if (price > 0)
          Text('السعر الحالي: $price', style: AppTextStyles.font18graySemiBold),
      ],
    );
  }
}
