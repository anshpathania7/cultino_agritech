import 'package:cultino_agritech/models/cultino_data_model.dart';
import 'package:cultino_agritech/repositories/cultino_repository.dart';
import 'package:get/get.dart';

class ScreenTwoController extends GetxController {
  late CultinoDataModel data;
  late CultinoRepository repository;
  late RxBool isLoading;
  ScreenTwoController()
      : repository = CultinoRepository(),
        isLoading = true.obs;
  void getNewData() async {
    isLoading.value = true;
    data = await repository.getOtherMandiApi(callFromNetwork: true);
    isLoading.value = false;
    update();
  }

  void init() async {
    isLoading.value = true;
    data = await repository.getOtherMandiApi();
    isLoading.value = false;
    update();
  }
}
