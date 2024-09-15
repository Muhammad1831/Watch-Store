import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/data/repository/user_info_repository.dart';
import 'package:watch_store/screens/profile_screen/bloc/user_info_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/screens/profile_screen/widget/profile_item_information.dart';
import 'package:watch_store/widgets/app_avatar.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';
import 'package:watch_store/widgets/custom_appbar.dart';
import 'package:watch_store/widgets/surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) {
        UserInfoBloc userInfoBloc = UserInfoBloc(userInfoRepository);
        userInfoBloc.add(UserInfoInitialEvent());
        return userInfoBloc;
      },
      child: SafeArea(
          child: Scaffold(
        appBar: CustomAppBar(
            size: size,
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: AppDimens.large),
                  child: Text(
                    AppString.userProfile,
                    style: AppTextStyle.titleSmallBol,
                  ),
                ))),
        body: BlocConsumer<UserInfoBloc, UserInfoState>(
          listener: (context, state) {
            if (state is UserInfoErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 500),
                content: Text('خطای سرور'),
                backgroundColor: AppColor.errorSnackBarBackGround,
              ));
            }
          },
          builder: (context, state) {
            if (state is UserInfoLodingState) {
              return const AppProgressIndicator();
            } else if (state is UserInfoLoaddedState) {
              return Center(
                child: Column(
                  children: [
                    AppDimens.large.height,
                    // avatar
                    AppAvatar(
                        avatarTitle:
                            state.userProfileModel.userInfo.name ?? 'Muhammad',
                        ontap: () {},
                        imageFile: null),
                    AppDimens.large.height,
                    // user information (address, phone number, card number, name)
                    Padding(
                      padding: EdgeInsets.only(
                          right: size.width / 10, left: size.width / 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppString.activeAddress,
                            style: AppTextStyle.titleSmallBol,
                          ),
                          AppDimens.verySmall.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: size.height / 20,
                                width: size.height / 20,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      Assets.svg.forwardFlash,
                                    )),
                              ),
                              SizedBox(
                                width: size.width / 1.5,
                                child: Text(
                                  state.userProfileModel.userInfo.address ==
                                          null
                                      ? 'شهرک پردیسان, خیابان ایمان'
                                      : state.userProfileModel.userInfo.address!
                                          .address,
                                  style: AppTextStyle.titleSmallBol,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                ),
                              )
                            ],
                          ),
                          AppDimens.medium.height,
                          ProfileItemInformation(
                            content:
                                state.userProfileModel.userInfo.address == null
                                    ? '2894297'
                                    : state.userProfileModel.userInfo.address!
                                        .postalCode,
                            icon: Assets.svg.card,
                          ),
                          AppDimens.small.height,
                          ProfileItemInformation(
                            content: state.userProfileModel.userInfo.phone ??
                                '09016981979',
                            icon: Assets.svg.smallUser,
                          ),
                        ],
                      ),
                    ),
                    AppDimens.large.height,
                    SurfaceContainer(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: AppDimens.large,
                              top: AppDimens.large,
                              bottom: AppDimens.large),
                          child: Text(
                            AppString.termsConditions,
                            style: AppTextStyle.titleSmallBol,
                          ),
                        ),
                      ],
                    )),
                    AppDimens.small.height,
                    SurfaceContainer(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(Assets.svg.greenDelivered),
                              AppDimens.medium.height,
                              Text(
                                AppString.delivered,
                                style: AppTextStyle.titleSmallBol,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(Assets.svg.redCancled),
                              AppDimens.medium.height,
                              Text(
                                AppString.cancled,
                                style: AppTextStyle.titleSmallBol,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SvgPicture.asset(Assets.svg.blueBasket),
                              AppDimens.medium.height,
                              Text(
                                AppString.processing,
                                style: AppTextStyle.titleSmallBol,
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              );
            } else {
              return const AppProgressIndicator();
            }
          },
        ),
      )),
    );
  }
}
