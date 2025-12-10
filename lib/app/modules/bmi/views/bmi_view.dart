import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bmi_controller.dart';
import '../widgets/gender_card.dart';
import '../widgets/glass_card.dart';
import '../../../core/widgets/round_icon_button.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/app_routes.dart';

class BmiView extends GetView<BmiController> {
  const BmiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundStart,
              AppColors.backgroundEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    const Text(
                      'BMI Calculator',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        size: 18,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                        () => Column(
                      children: [
                        // Gender selector
                        Row(
                          children: [
                            Expanded(
                              child: GenderCard(
                                label: 'Male',
                                icon: Icons.male,
                                isSelected: controller.isMale.value,
                                onTap: () => controller.setGender(true),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: GenderCard(
                                label: 'Female',
                                icon: Icons.female,
                                isSelected: !controller.isMale.value,
                                onTap: () => controller.setGender(false),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Height card
                        Expanded(
                          child: GlassCard(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Height',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.75),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller.height.value
                                            .toStringAsFixed(0),
                                        style: const TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: ' cm',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Slider(
                                  min: 100,
                                  max: 220,
                                  value: controller.height.value,
                                  onChanged: controller.setHeight,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Weight & Age
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: GlassCard(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Weight',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                          Colors.white.withOpacity(0.75),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${controller.weight.value}',
                                        style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          RoundIconButton(
                                            icon: Icons.remove,
                                            onPressed:
                                            controller.decreaseWeight,
                                          ),
                                          const SizedBox(width: 12),
                                          RoundIconButton(
                                            icon: Icons.add,
                                            onPressed:
                                            controller.increaseWeight,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: GlassCard(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Age',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                          Colors.white.withOpacity(0.75),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${controller.age.value}',
                                        style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          RoundIconButton(
                                            icon: Icons.remove,
                                            onPressed: controller.decreaseAge,
                                          ),
                                          const SizedBox(width: 12),
                                          RoundIconButton(
                                            icon: Icons.add,
                                            onPressed: controller.increaseAge,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Calculate button
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.bmiResult);
                            },
                            child: const Text('CALCULATE BMI'),
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
