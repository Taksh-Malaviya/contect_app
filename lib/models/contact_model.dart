import 'dart:io';

class ContactsModel {
  File? image;
  String name;
  String email;
  String phoneNumber;
  List<ContactsModel>? contactList;

  ContactsModel({
    required this.image,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.contactList,
  });
}
