import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/route/screen_names.dart';
import 'package:watch_store/screens/authentication/cubit/authentication_cubit.dart';
import 'package:watch_store/screens/authentication/cubit/count_down_cubit.dart';
import 'package:watch_store/screens/authentication/cubit/count_down_state.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';
import 'package:watch_store/widgets/app_textfield.dart';

// ignore: must_be_immutable
class EnterActiveCodeScreen extends StatefulWidget {
  EnterActiveCodeScreen({super.key, this.number = ''});
  String number;
  @override
  State<EnterActiveCodeScreen> createState() => _EnterActiveCodeScreenState();
}

class _EnterActiveCodeScreenState extends State<EnterActiveCodeScreen> {
  TextEditingController confirmCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CountDownCubit>(context).countDownStart(totalSecond: 120);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        BlocProvider.of<CountDownCubit>(context).countDownCancel();
        Navigator.of(context).pop();
      },
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
                AppString.sendedActivityCodeFor
                    .replaceAll(AppString.userPhoneNumber, widget.number),
                style: AppTextStyle.titleSmallBol,
              ),
              AppDimens.small.height,
              // text button for edit number
              TextButton(
                  onPressed: () {
                    BlocProvider.of<CountDownCubit>(context).countDownCancel();
                    Navigator.of(context).pop();
                  },
                  child: Text(AppString.numberIsWrongEditing,
                      style: AppTextStyle.numberIsWrongEditing)),
              AppDimens.veryLarge.height,
              // custom textField
              BlocConsumer<CountDownCubit, CountDownState>(
                listener: (context, state) {
                  if (state is CountDownEnded) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is CountDownDecrease) {
                    return AppTextField(
                        label: AppString.enterActivityCode,
                        labelStyle: AppTextStyle.titleSmallBol,
                        prefixLabel: state.remainSeconds.formatTimer(),
                        hint: AppString.hintActivityCode,
                        hintStyle: AppTextStyle.hintLargeReg,
                        inputType: TextInputType.number,
                        textEditingController: confirmCodeController);
                  }
                  return const SizedBox.shrink();
                },
              ),

              AppDimens.medium.height,
              // custom elevated button
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is VerifyedIsRegisteredState) {
                    BlocProvider.of<CountDownCubit>(context).countDownCancel();
                    Navigator.pushNamed(context, ScreenNames.mainScreen);
                  } else if (state is VerifyedNotRegisteredState) {
                    BlocProvider.of<CountDownCubit>(context).countDownCancel();
                    Navigator.pushNamed(context, ScreenNames.registerScreen);
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 800),
                      content: Text(AppString.codeIsNotEnterCorrect),
                      backgroundColor: AppColor.errorSnackBarBackGround,
                    ));
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
                      buttonName: AppString.next,
                      onPressed: () {
                        BlocProvider.of<AuthenticationCubit>(context)
                            .verifyCode(
                                widget.number, confirmCodeController.text);
                      });
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
