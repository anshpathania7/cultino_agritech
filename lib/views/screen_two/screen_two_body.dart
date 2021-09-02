import 'package:cultino_agritech/controllers/screen_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class ScreenTwoBody extends StatelessWidget {
  const ScreenTwoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenTwoController>(
      init: ScreenTwoController()..init(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("Screen two"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.getNewData(),
          child: Text("Fetch"),
        ),
        body: controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.data.otherMandi?.length,
                itemBuilder: (context, i) => Container(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OctoImage(
                            image: NetworkImage(
                              "${controller.data.otherMandi?[i]?.image}",
                            ),
                            height: 125,
                            width: 125,
                            fit: BoxFit.contain,
                          ),
                          Text("""
                            District : ${controller.data.otherMandi?[i]?.district}
                            Hindi Name : ${controller.data.otherMandi?[i]?.hindiName}
                            Kilometer : ${controller.data.otherMandi?[i]?.km}
                            Ladt date : ${controller.data.otherMandi?[i]?.lastDate}
                            Market : ${controller.data.otherMandi?[i]?.market}
                            """),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
