import 'package:get/get.dart';

import '../../../data/models/bmi_result_model.dart';

class BmiController extends GetxController {
  var isMale = true.obs;
  var height = 170.0.obs; // cm
  var weight = 60.obs;    // kg
  var age = 20.obs;

  double get bmi {
    final h = height.value / 100;
    return weight.value / (h * h);
  }

  String get bmiCategory {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  String get bmiAdviceBangla {
    final val = bmi;
    if (val < 18.5) {
      return 'আপনার ওজন কম। পুষ্টিকর খাবার খান এবং প্রয়োজনে ডাক্তারের পরামর্শ নিন।';
    } else if (val < 25) {
      return 'চমৎকার! আপনার ওজন স্বাভাবিক সীমার মধ্যে আছে। স্বাস্থ্যকর ডায়েট আর হালকা ব্যায়াম চালিয়ে যান।';
    } else if (val < 30) {
      return 'আপনি একটু বেশি ওজনের। ডায়েট কন্ট্রোল আর নিয়মিত হাঁটা/ব্যায়াম করলে অনেক উপকার হবে।';
    } else {
      return 'BMI অনেক বেশি। ডাক্তারের পরামর্শ অনুযায়ী ডায়েট এবং ব্যায়াম প্ল্যান নিন।';
    }
  }

  BmiResultModel get result => BmiResultModel(
    bmi: bmi,
    category: bmiCategory,
    advice: bmiAdviceBangla,
  );

  // setters
  void setGender(bool male) => isMale.value = male;
  void setHeight(double value) => height.value = value;

  void increaseWeight() => weight.value++;
  void decreaseWeight() {
    if (weight.value > 30) weight.value--;
  }

  void increaseAge() => age.value++;
  void decreaseAge() {
    if (age.value > 5) age.value--;
  }
}
