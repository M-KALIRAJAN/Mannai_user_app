import 'package:flutter/material.dart';
import 'package:mannai_user_app/controllers/signup_controller.dart';
import 'package:mannai_user_app/core/constants/app_consts.dart';
import 'package:mannai_user_app/views/auth/individual/Address.dart';
import 'package:mannai_user_app/widgets/buttons/primary_button.dart';
import 'package:mannai_user_app/widgets/inputs/app_dropdown.dart';
import 'package:mannai_user_app/widgets/inputs/app_text_field.dart';

class Addmember extends StatefulWidget {
  final String accountType;
  final VoidCallback onNext;
  final GlobalKey<FormState> formKey;

  const Addmember({
    super.key,
    required this.accountType,
    required this.onNext,
    required this.formKey,
  });

  @override
  State<Addmember> createState() => _AddmemberState();
}

class _AddmemberState extends State<Addmember> {
   bool _isAddress = false;
  final controller = SignupController();
   
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Add ${widget.accountType} Member",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  
                  ),
                ),
                const SizedBox(height: 15),
                AppTextField(
                  controller: controller.name,
                  label: "Enter Family Count*",
                  validator: (value) => controller.validateName(value),
                ),
                const SizedBox(height: 15),

                AppTextField(
                  controller: controller.name,
                  label: "Member Full Name*",
                  validator: (value) => controller.validateName(value),
                ),

                const SizedBox(height: 15),
                AppDropdown(
                  label: "Relationship*",
                  items: ["Father", "Mother", "Son", "Daughter", "Spouse"],
                  value: controller.gender,
                  onChanged: (val) {
                    // setState(() => controller.relationship = val);
                  },
                  validator: (val) =>
                      val == null ? "Please select relationship" : null,
                ),

                const SizedBox(height: 15),

                AppTextField(
                  controller: controller.name,
                  label: "Mobile Number*",
                  validator: (value) => controller.validateName(value),
                ),

                const SizedBox(height: 15),

                AppTextField(
                  controller: controller.name,
                  label: "Email Adress*",
                  validator: (value) => controller.validateName(value),
                ),
                const SizedBox(height: 20),
                AppDropdown(
                  label: "Gender*",
                  items: ["Male", "Female", "Oter"],
                  value: controller.gender,
                  onChanged: (val) {
                    // setState(() => controller.relationship = val);
                  },
                  validator: (val) =>
                      val == null ? "Please select relationship" : null,
                ),

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 47,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                       _isAddress = !_isAddress; 
                      });
                    },
                       child: Text(
                      _isAddress ? "Hide Address" : "Add Address",
                      style: TextStyle(color: AppColors.btn_primery),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                  if (_isAddress)
                  Address(accountType: "Family" ,family: true),
                    const SizedBox(height: 20),
                AppButton(
                  text: "Add Member",
                  onPressed: () {},
                  color: AppColors.button_secondary,
                  width: double.infinity,
                  height: 47,
                ),
                   
              ],
            ),
          ),
          const SizedBox(height: 20),
          AppButton(
            text: "Sign Up",
            onPressed: () {},
            color: AppColors.btn_primery,
            width: double.infinity,
            height: 47,
          ),
        ],
      ),
    );
  }
}
