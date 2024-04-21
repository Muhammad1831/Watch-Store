import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_string.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/route/screen_names.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';
import 'package:watch_store/widgets/app_textfield.dart';

// ignore: must_be_immutable
class EnterActiveCodeScreen extends StatelessWidget {
  EnterActiveCodeScreen({super.key});

  TextEditingController confirmCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // String phoneNumber = ModalRoute.of(context)!.settings.arguments as String;
    
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.secondaryBackGround,
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
            AppDimens.veryLarge.height,
            // sendedActivityCodeFor text
            Text(
              AppString.sendedActivityCodeFor,
              style: AppTextStyle.titleSmallBol,
            ),
            AppDimens.small.height,
            // text button for edit number
            TextButton(
                onPressed: () {},
                child: Text(AppString.numberIsWrongEditing,
                    style: AppTextStyle.numberIsWrongEditing)),
            AppDimens.veryLarge.height,
            // custom textField
            AppTextField(
                label: AppString.enterActivityCode,
                labelStyle: AppTextStyle.titleSmallBol,
                prefixLabel: '2:56',
                hint: AppString.hintActivityCode,
                hintStyle: AppTextStyle.hintLargeReg,
                inputType: TextInputType.number,
                textEditingController: confirmCodeController),
            AppDimens.medium.height,
            // custom elevated button
            AppElevatedButton(
                height: size.height / 18,
                width: size.width / 1.5,
                buttonColor: AppColor.buttonBackGround,
                buttonName: AppString.next,
                onPressed: () {
                  Navigator.pushNamed(context, ScreenNames.registerScreen);
                })
          ],
        ),
      ),
    ));
  }
}
