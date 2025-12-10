import 'package:get/get.dart';

import '../modules/bmi/bindings/bmi_binding.dart';
import '../modules/bmi/views/bmi_view.dart';
import '../modules/bmi/views/bmi_result_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.bmi;

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.bmi,
      page: () => const BmiView(),
      binding: BmiBinding(),
    ),
    GetPage(
      name: AppRoutes.bmiResult,
      page: () => const BmiResultView(),
      binding: BmiBinding(), // same controller reuse
    ),
  ];
}
