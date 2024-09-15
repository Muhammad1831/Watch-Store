import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/screens/authentication/cubit/authentication_cubit.dart';
import 'package:watch_store/screens/authentication/cubit/count_down_cubit.dart';
import 'package:watch_store/screens/authentication/enter_active_code_screen.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';
import 'package:watch_store/widgets/app_textfield.dart';

// ignore: must_be_immutable
class EnterPhoneScreen extends StatelessWidget {
  EnterPhoneScreen({super.key});

  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                height: size.height / 7,
                width: size.width / 1.4,
              ),
              (AppDimens.veryLarge * 1.5).height,
              // custom textField
              AppTextField(
                label: AppString.enterYourNumber,
                labelStyle: AppTextStyle.titleSmallBol,
                hint: AppString.numberHintText,
                hintStyle: AppTextStyle.hintMediumReg,
                inputType: TextInputType.number,
                textEditingController: phoneNumberController,
              ),
              AppDimens.medium.height,
              // custom elevated button
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is SentState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => CountDownCubit(),
                          child: EnterActiveCodeScreen(
                            number: state.mobile,
                          ),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is LodingState) {
                    return const AppProgressIndicator();
                  }
                  return AppElevatedButton(
                      height: size.height / 18,
                      width: size.width / 1.5,
                      buttonColor: AppColor.buttonBackGround,
                      buttonName: AppString.sendActivityCode,
                      onPressed: () {
                        BlocProvider.of<AuthenticationCubit>(context)
                            .sendSms(phoneNumberController.text);
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
