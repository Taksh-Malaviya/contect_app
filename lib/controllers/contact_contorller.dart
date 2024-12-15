import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/contact_model.dart';

class ContactsController extends ChangeNotifier {
  ContactsModel contactsModel = ContactsModel(
    image: null,
    name: "",
    email: "",
    phoneNumber: "",
    contactList: [],
  );

  void pickImageGallery() async {
    ImagePicker imagePicker = ImagePicker();

    XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      contactsModel.image = File(xFile.path);
    }
    notifyListeners();
  }

  void addContactData({
    required String name,
    required String email,
    required String phone,
  }) {
    ContactsModel c1 = ContactsModel(
      image: contactsModel.image,
      name: name,
      email: email,
      phoneNumber: phone,
    );

    contactsModel.contactList?.add(c1);

    notifyListeners();
  }

  void removeContactData({required ContactsModel contact}) {
    contactsModel.contactList?.remove(contact);

    notifyListeners();
  }
}
