import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controllers/contact_contorller.dart';
import '../../../controllers/stepper_controller.dart';

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class AddToContactPage extends StatelessWidget {
  const AddToContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text(
          'Add Contact',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            _buildTextField(
              hintText: "Name",
              icon: Icons.person_outline,
              controller: nameController,
            ),
            SizedBox(
              height: 20.h,
            ),
            _buildTextField(
              hintText: "Phone Number",
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              controller: phoneController,
              maxLength: 10,
            ),
            SizedBox(
              height: 20.h,
            ),
            _buildTextField(
              hintText: "Email",
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String email = emailController.text;
                  String phone = phoneController.text;

                  context.read<ContactsController>().addContactData(
                        name: name,
                        email: email,
                        phone: phone,
                      );

                  log("Contact Data : ${context.read<ContactsController>().contactsModel.contactList}");
                  Navigator.pop(context);

                  nameController.clear();
                  emailController.clear();
                  phoneController.clear();

                  context.read<ContactsController>().contactsModel.image = null;
                  context.read<StepperController>().stepperModel.stepperIndex =
                      0;
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required TextEditingController controller,
    int? maxLength,
  }) {
    return TextField(
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black12,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.grey[00],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 18.h,
          horizontal: 16.w,
        ),
      ),
      style: const TextStyle(
        color: Colors.black87,
      ),
    );
  }
}
