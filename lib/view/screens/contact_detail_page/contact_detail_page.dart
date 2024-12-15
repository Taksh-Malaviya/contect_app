import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/contact_contorller.dart';
import '../../../models/contact_model.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ContactsModel contact =
        ModalRoute.of(context)?.settings.arguments as ContactsModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ContactsController>(context, listen: false)
                  .removeContactData(contact: contact);

              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.w,
                child: Text(
                  contact.name[0],
                  style: TextStyle(
                    fontSize: 100.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Name : ${contact.name}",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton.filled(
                    onPressed: () async {
                      Uri url = Uri.parse("tel:+91-${contact.phoneNumber}");
                      await launchUrl(url);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xff5d3f41),
                      ),
                    ),
                    icon: const Icon(
                      Icons.call_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () async {
                      Uri url = Uri.parse("sms:${contact.phoneNumber}");
                      await launchUrl(url);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xff5d3f41),
                      ),
                    ),
                    icon: const Icon(
                      color: Colors.white,
                      Icons.sms_failed_outlined,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color(0xff5d3f41),
                      ),
                    ),
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Phone Number : ${contact.phoneNumber}",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Email : ${contact.email}",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
