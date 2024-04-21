import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_string.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/route/screen_names.dart';
import 'package:watch_store/widgets/app_avatar.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';
import 'package:watch_store/widgets/app_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController homePhoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.secondaryBackGround,
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height / 12.8),
        child: Container(
          height: size.height / 12.8,
          decoration: const BoxDecoration(color: AppColor.appBarBackGround),
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppDimens.verySmall, right: AppDimens.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      Assets.svg.directLeft,
                      height: AppDimens.medium,
                    )),
                Text(
                  AppString.register,
                  style: AppTextStyle.titleMediumMed,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (AppDimens.large * 1.5).height,
              // app avatar
              const AppAvatar(
                avatarTitle: AppString.chooseProfileImage,
              ),
              (AppDimens.large * 1.5).height,
              // firstNamelastName textField
              AppTextField(
                  label: AppString.firstNamelastName,
                  labelStyle: AppTextStyle.titleSmallReg,
                  hint: AppString.firstNamelastNameHint,
                  hintStyle: AppTextStyle.hintMediumReg,
                  textEditingController: nameController),
              AppDimens.small.height,
              // homePhone textField
              AppTextField(
                  label: AppString.homePhone,
                  labelStyle: AppTextStyle.titleSmallReg,
                  hint: AppString.homePhoneHint,
                  hintStyle: AppTextStyle.hintMediumReg,
                  textEditingController: homePhoneController),
              AppDimens.small.height,
              // address textField
              AppTextField(
                  label: AppString.address,
                  labelStyle: AppTextStyle.titleSmallReg,
                  hint: AppString.addressHint,
                  hintStyle: AppTextStyle.hintMediumReg,
                  textEditingController: addressController),
              AppDimens.small.height,
              // postalCode textField
              AppTextField(
                  label: AppString.postalCode,
                  labelStyle: AppTextStyle.titleSmallReg,
                  hint: AppString.postalCodeHint,
                  hintStyle: AppTextStyle.hintMediumReg,
                  textEditingController: postalCodeController),
              AppDimens.small.height,
              // location textField
              AppTextField(
                  label: AppString.location,
                  labelStyle: AppTextStyle.titleSmallReg,
                  hint: AppString.locationHint,
                  hintStyle: AppTextStyle.hintMediumReg,
                  icon: Padding(
                    padding: const EdgeInsets.all(AppDimens.small),
                    child: SvgPicture.asset(
                      Assets.svg.locationAdd,
                    ),
                  ),
                  textEditingController: locationController),
              AppDimens.large.height,
              // custom elevated button
              AppElevatedButton(
                  height: size.height / 18,
                  width: size.width / 1.5,
                  buttonColor: AppColor.buttonBackGround,
                  buttonName: AppString.register,
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenNames.mainScreen);
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
