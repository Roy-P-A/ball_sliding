import 'package:flutter/services.dart';

import '../mixins/snackbar_mixin.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class BallSlidingController extends GetxController with SnackbarMixin {
  

  final _sliderValue = 0.0.obs;
  double get sliderValue => _sliderValue.value;

  final _maximumRange = 1000.0.obs;
  double get maximumRange => _maximumRange.value;

  final _expectedValue = 900.0.obs;
  double get expectedValue => _expectedValue.value;

  bool isSuccess = false;

   @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
   
  }

  sliderValueChange(value){
     _sliderValue.value = value;
  }

  onTappedDoneButton() {
    if (sliderValue == 0) {
      showErrorSnackbar(title: 'Warning', message: 'Answer is Incomplete!');
      return;
    }
    isSuccess = sliderValue == expectedValue;
    if (isSuccess) {
      showSuccessSnackbar(title: 'Success', message: 'Success');
    }else{
      showErrorSnackbar(title: 'Warning', message: 'Wrong Answer!');
    }

    print(sliderValue);
  }
}
