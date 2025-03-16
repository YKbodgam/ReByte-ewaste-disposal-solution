import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../../../common/custom_text.dart';
import '../../../../common/regular_button.dart';
import '../../../../common/custom_text_field.dart';

import '../widgets/language_container.dart';
import '../../models/language_data.dart';

import '../../controllers/language_controller.dart';
import 'onboarding_screen.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final LanguageChangeController languageChangeController =
        Get.put<LanguageChangeController>(LanguageChangeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.01,
              horizontal: size.width * 0.04,
            ),
            child: Form(
              key: languageChangeController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: BuildText(
                      text: "chooseLanguage".tr,
                      fontSize: FontSizes.veryLargeTextSize(context),
                      textStyle: LoraTextStyle.appTextStyleBold,
                      color: Palette.kPrimaryDarkColor,
                    ),
                  ),
                  CustomTextField(
                    borderRadius: 15,
                    controller: languageChangeController.searchController,
                    onChanged: (value) {},
                    backgroundColor: Colors.white,
                    prefixIcon: Icon(Iconsax.search_normal),
                    focusedBorderColor: Palette.kBorderPrimaryColor,
                    hintText: "searchLanguage".tr,
                    labelText: '',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }

                      return null;
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: appLanguages.length,
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    itemBuilder: (context, index) {
                      final language = appLanguages[index];
                      final isSelected =
                          languageChangeController.selectedIndex.value == index;

                      return GestureDetector(
                        onTap: () {
                          languageChangeController.selectedIndex.value = index;

                          final selectedLocale =
                              appLanguages[index]['language_code']!;

                          languageChangeController.changeLanguage(
                            selectedLocale,
                          );
                        },
                        child: LanguageContainer(
                          isSelected: isSelected,
                          language: language,
                        ),
                      );
                    },
                  ),

                  SizedBox(height: size.height * 0.01),

                  RoundedButton(
                    text: "continueButton".tr,
                    onPressed:
                        () => Get.offAll(
                          () => OnBoardScreen(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 100),
                        ),
                    suffixIcon: Iconsax.arrow_right_2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
