import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mannai_user_app/controllers/address_controller.dart';
import 'package:mannai_user_app/core/utils/logger.dart';

import 'package:mannai_user_app/core/constants/app_consts.dart';
import 'package:mannai_user_app/routing/app_router.dart';
import 'package:mannai_user_app/views/bottomnav.dart';
import 'package:mannai_user_app/widgets/buttons/primary_button.dart';
import 'package:mannai_user_app/widgets/inputs/app_dropdown.dart';
import 'package:mannai_user_app/widgets/inputs/app_text_field.dart';

class Address extends StatefulWidget {
  final String accountType;
  final VoidCallback? onNext;
  final bool family; 
  const Address({super.key, required this.accountType, this.onNext ,this.family = false});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final controller = AddressController();
  String selected = "Flat"; // default selected
  Widget buildType(String type, String icon) {
    final bool isSelected = selected == type;

    return GestureDetector(
      onTap: () => setState(() => selected = type),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.btn_primery : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? null
              : Border.all(color: Colors.grey.shade400, width: 1),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 24,
              width: 24,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            SizedBox(width: 6),
            Text(
              type,
              style: TextStyle(
                fontSize: 15,
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(controller: controller.building, label: "Pick Location"),
        SizedBox(height: 10),

        if (widget.accountType == "Family") ...[
          AppTextField(label: "Enter Number of kids*"),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: AppTextField(label: "No of boys*")),
              SizedBox(width: 10),
              Expanded(child: AppTextField(label: "No of girls*")),
            ],
          ),
          SizedBox(height: 17),
        ],
        SizedBox(height: 15),
        Image.asset("assets/images/map.png", height: 84),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildType("Flat", 'assets/icons/Flat.png'),
            buildType("Villa", 'assets/icons/villa.png'),
            buildType("Office", 'assets/icons/office.png'),
          ],
        ),
        SizedBox(height: 17),
        AppTextField(controller: controller.city, label: "Enter Your ity/Area"),
        SizedBox(height: 17),
        AppTextField(
          controller: controller.building,
          label: "Enter Your Building*",
        ),
        SizedBox(height: 17),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: controller.aptNo,
                label: "Enter Apt No*",
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: AppTextField(
                controller: controller.floor,
                label: "Enter Floor No*",
              ),
            ),
          ],
        ),
        SizedBox(height: 17),

        AppDropdown(
          label: "Select Your Road*",
          items: ["Male", "Female", "Oter"],
          value: "Male",
          onChanged: (val) {
            // setState(() => controller.relationship = val);
          },
          validator: (val) => val == null ? "Please select relationship" : null,
        ),
        SizedBox(height: 20),
        if (!widget.family) // If NOT coming from add member
        AppButton(
          text: widget.accountType == "Family" ? "Continue" : "Sign In",
          onPressed: () {
            if (widget.accountType == "Family") {
              widget.onNext?.call();
            } else { 
                final addressData = controller.getAddressData();
                AppLogger.debug(addressData.toJson().toString());   
                context.push(RouteNames.accountverfy);       
            }
          },
          color: AppColors.btn_primery,
          width: double.infinity,
        ),
      ],
    );
  }
}
