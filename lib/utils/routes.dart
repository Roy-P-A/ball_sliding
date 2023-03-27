import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../features/ball_sliding.dart';



// final MediaQueryData _data =
//     MediaQuery.of(Get.context!).copyWith(textScaleFactor: 1);

Widget _wrapWithMediaQuery({required Widget child}) {
  // return MediaQuery(
  //   child: child,
  //   data: _data,
  // );
  return child;
}

List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => const BallSidingScreen() ,
          transition: Transition.cupertino),
    ];
