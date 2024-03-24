import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_string.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';
import 'package:watch_store/widgets/app_textfield.dart';

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    TextEditingController phoneNumberController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: LightAppColor.secondaryBackGround,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo image
              Image.asset(
                Assets.png.logo.path,
                height: size.height / 6.96,
                width: size.width / 1.37,
              ),
              (AppDimens.veryLarge * 1.5).height,
              // custom textField
              AppTextField(
                  label: AppString.enterYourNumber,
                  labelStyle: AppTextStyle.titleSmallBol,
                  hint: AppString.numberHintText,
                  hintStyle: AppTextStyle.hintMediumReg,
                  inputType: TextInputType.number,
                  textEditingController: phoneNumberController),
              AppDimens.medium.height,
              // custom elevated button
              AppElevatedButton(
                  buttonName: AppString.sendActivityCode, onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
