import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_ewaste_listings.dart';
import '../widget/top_container.dart';
import '../../../introduction/pages/views/choose_language.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';
import '../../../../common/widgets/custom_text.dart';

class ProfilePage extends StatelessWidget {
  final dynamic user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          iconSize: 24.sp,
          icon: Icon(Iconsax.arrow_left_2),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
              vertical: size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.03),
                TopContainer(userDetail: user),
                SizedBox(height: size.height * 0.02),
                BuildText(
                  text: 'User Settings',
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleBold,
                  alignment: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: Container(
                    height: 1.5,
                    color: Palette.kBorderPrimaryColor,
                  ),
                ),
                ProfileTile(
                  size: size,
                  icon: Iconsax.location,
                  name: 'Address',
                  onpress: () {},
                ),
                ProfileTile(
                  size: size,
                  icon: Icons.shopping_cart_outlined,
                  name: 'Your Listings',
                  onpress: () {
                    Get.to(
                      () => MyEwasteListings(),
                      transition: Transition.rightToLeft,
                    );
                  },
                ),

                ProfileTile(
                  size: size,
                  icon: Iconsax.truck_fast3,
                  name: 'Pick Up Requests',
                  onpress: () {},
                ),
                ProfileTile(
                  size: size,
                  icon: Iconsax.gift,
                  name: 'Your Rewards',
                  onpress: () {},
                ),
                ProfileTile(
                  size: size,
                  icon: Icons.history,
                  name: 'Transactions',
                  onpress: () {},
                ),
                ProfileTile(
                  size: size,
                  icon: Iconsax.translate,
                  name: 'Choose Language',
                  onpress: () {
                    Get.to(() => SelectLanguage(isLoggedIn: true));
                  },
                ),
                SizedBox(height: size.height * 0.02),
                BuildText(
                  text: 'App Related Details',
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleBold,
                  alignment: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: Container(
                    height: 1.5,
                    color: Palette.kBorderPrimaryColor,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                ProfileTile(
                  size: size,
                  icon: Iconsax.profile_tick,
                  name: 'About Us',
                  onpress: () {},
                ),
                ProfileTile(
                  size: size,
                  icon: Iconsax.call,
                  name: 'Contact Us',
                  onpress: () {},
                ),
                ProfileTile(
                  size: size,
                  icon: Iconsax.shield_tick,
                  name: 'Privacy Policy',
                  onpress: () {},
                ),
                ProfileTile(
                  size: size,
                  icon: Iconsax.note,
                  name: 'Terms and Conditions',
                  onpress: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: Container(
                    height: 1.5,
                    color: Palette.kBorderPrimaryColor,
                  ),
                ),
                ProfileTile(
                  size: size,
                  icon: Iconsax.logout,
                  name: 'Log Out',
                  onpress: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function onpress;

  const ProfileTile({
    super.key,
    required this.size,
    required this.icon,
    required this.name,
    required this.onpress,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
        horizontal: size.width * 0.02,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onpress(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, size: 24),
                  SizedBox(width: size.width * 0.03),
                  BuildText(
                    text: name,
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleMedium,
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                      color:
                          name == 'Log Out'
                              ? Colors.red.withAlpha(100)
                              : Palette.kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      size: 20,
                      Iconsax.arrow_right_3,
                      color: Palette.kPrimaryDarkColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
