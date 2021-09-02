import 'package:cultino_agritech/controllers/screen_one_controller.dart';
import 'package:cultino_agritech/models/profile_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderChipButton extends StatefulWidget {
  const GenderChipButton({Key? key}) : super(key: key);

  @override
  _GenderChipButtonState createState() => _GenderChipButtonState();
}

class _GenderChipButtonState extends State<GenderChipButton> {
  late int _selectedIndex;
  late ScreenOneController controller;
  final List<String> _genders = ["Male", "Female"];
  @override
  void initState() {
    super.initState();
    controller = Get.find<ScreenOneController>();
    if (controller.gender == null) {
      _selectedIndex = -1;
    } else {
      _selectedIndex = controller.gender == Gender.MALE ? 0 : 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < 2; i++) ...[
            InkWell(
              onTap: () {
                _selectedIndex = i;
                controller.addGender =
                    _selectedIndex == 0 ? Gender.MALE : Gender.FEMALE;
                setState(() {});
                print("clicekd");
              },
              child: Container(
                height: 60,
                width: 80,
                decoration: BoxDecoration(
                    color: i == _selectedIndex ? Colors.blue : Colors.white),
                child: Text(
                  _genders[i],
                  style: TextStyle(
                    color: i == _selectedIndex ? Colors.white : Colors.black,
                  ),
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}
