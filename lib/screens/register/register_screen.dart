// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/models/user_register_model.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/route/screen_names.dart';
import 'package:watch_store/screens/register/cubit/picke_image_cubit.dart';
import 'package:watch_store/screens/register/cubit/register_cubit.dart';
import 'package:watch_store/screens/register/cubit/register_state.dart';
import 'package:watch_store/utils/app_image_picker.dart';
import 'package:watch_store/widgets/app_avatar.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';
import 'package:watch_store/widgets/app_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController homePhoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController postalCodeController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  late double lat;
  late double lng;

  final AppImagePicker appImagePicker = AppImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: MultiBlocProvider(
      providers: [
        BlocProvider<PickeImageCubit>(
          create: (context) => PickeImageCubit(),
        ),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
      ],
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
                        Navigator.pushNamed(
                            context, ScreenNames.enterPhoneScreen);
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
                BlocBuilder<PickeImageCubit, PickeImageState>(
                  builder: (context, state) {
                    if (state is PickeImageLoding) {
                      return const AppProgressIndicator();
                    }
                    return AppAvatar(
                        avatarTitle: AppString.chooseProfileImage,
                        ontap: () {
                          BlocProvider.of<PickeImageCubit>(context)
                              .pickeImage(appImagePicker: appImagePicker);
                        },
                        imageFile: appImagePicker.image);
                  },
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
                    icon: BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterStateLocationPicked) {
                          if (state.location != null) {
                            lat = state.location!.latitude;
                            lng = state.location!.longitude;
                            locationController.text =
                                '${state.location!.latitude}-${state.location!.latitude}';
                          }
                        }
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () async {
                            await BlocProvider.of<RegisterCubit>(context)
                                .pickeTheLocation(context: context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.small),
                            child: SvgPicture.asset(
                              Assets.svg.locationAdd,
                            ),
                          ),
                        );
                      },
                    ),
                    textEditingController: locationController),
                AppDimens.large.height,
                // custom elevated button
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterStateCompeleted) {
                      Navigator.of(context).pushNamed(ScreenNames.mainScreen);
                    } else if (state is RegisterStateError) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 800),
                        content: Text('خطایی رخ داده است'),
                        backgroundColor: AppColor.errorSnackBarBackGround,
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterStateLoding) {
                      const AppProgressIndicator();
                    }
                    return AppElevatedButton(
                        height: size.height / 18,
                        width: size.width / 1.5,
                        buttonColor: AppColor.buttonBackGround,
                        buttonName: AppString.register,
                        onPressed: () async {
                          UserRegister user = UserRegister(
                              image: await MultipartFile.fromFile(
                                  appImagePicker.image!.path),
                              phone: homePhoneController.text,
                              name: nameController.text,
                              address: addressController.text,
                              postalCode: postalCodeController.text,
                              lat: lat,
                              lng: lng);
                          BlocProvider.of<RegisterCubit>(context)
                              .register(user: user);
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
