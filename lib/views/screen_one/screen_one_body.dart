import 'dart:io';

import 'package:cultino_agritech/controllers/screen_one_controller.dart';
import 'package:cultino_agritech/views/screen_one/widgets/gender_chip_button.dart';
import 'package:cultino_agritech/views/screen_two/screen_two_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:octo_image/octo_image.dart';

extension EmailValidator on String {
  bool checkIfEmailValid() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class ScreenOneBody extends StatefulWidget {
  const ScreenOneBody({Key? key}) : super(key: key);

  @override
  _ScreenOneBodyState createState() => _ScreenOneBodyState();
}

class _ScreenOneBodyState extends State<ScreenOneBody> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen one"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
          Get.to(() => ScreenTwoBody());
        },
        child: Text("Next"),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ScreenOneController>(
          init: ScreenOneController()..init(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: TextField(
                    controller: _nameController..text = controller.name ?? "",
                    onChanged: (val) => controller.addName = val,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    controller: _emailController
                      ..text = controller.emaild ?? "",
                    autovalidateMode: AutovalidateMode.always,
                    validator: (val) =>
                        val!.checkIfEmailValid() ? null : "Check your email",
                    onChanged: (val) {
                      if (val.checkIfEmailValid()) controller.addEmailId = val;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GenderChipButton(),
                IconButton(
                  onPressed: () async => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        InkWell(
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery);
                            controller.addImagePath = image?.path;
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text("From Gallery"),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.camera);
                            controller.addImagePath = image?.path;
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text("From Camera"),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  icon: Icon(
                    Icons.add_a_photo,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 12),
                if (controller.imagePath != null)
                  OctoImage(
                    image: FileImage(
                      File(controller.imagePath!),
                    ),
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    controller.saveThisDetails();
                  },
                  child: Text("Submit"),
                ),
                Text(controller.toShowBelowSubmit!)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
