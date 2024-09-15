import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/screens/search_screen/bloc/search_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';
import 'package:watch_store/widgets/product_gridview.dart';

List<String> fillHintList = ['ورساچه', 'کاسیو', 'سیتیزن', 'اوماکس', 'سیکو'];

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchKey = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context)
        .add(const SearchEventLoaded(searchKey: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        BlocProvider.of<SearchBloc>(context).products.clear();
      },
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: AppDimens.large * 1.5,
                  right: AppDimens.large * 1.5,
                  top: AppDimens.large * 1.5),
              child: Container(
                height: size.height / 16,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.searchBarBackGround,
                    boxShadow: const [
                      BoxShadow(
                          color: AppColor.appBarShadow,
                          offset: Offset(2, 4),
                          blurRadius: 4,
                          blurStyle: BlurStyle.normal)
                    ]),
                child: TextField(
                  onChanged: (value) {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchEventLoaded(searchKey: value));
                  },
                  onTapOutside: (event) {
                    _focusNode.unfocus();
                  },
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  focusNode: _focusNode,
                  controller: searchKey,
                  autofocus: true,
                  autofillHints: fillHintList,
                  enableSuggestions: false,
                  textInputAction: TextInputAction.search,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      hintText: AppString.searchProduct,
                      hintStyle: AppTextStyle.titleMediumReg,
                      contentPadding: const EdgeInsets.all(AppDimens.small),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(AppDimens.small),
                        child: SvgPicture.asset(
                          Assets.svg.search,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ),
            AppDimens.veryLarge.height,
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchStateLoading) {
                  return const AppProgressIndicator();
                } else if (state is SearchStateLoaded) {
                  if (state.products.isNotEmpty) {
                    return Expanded(
                        child: SingleChildScrollView(
                            child: ProductGridViewList(
                                productList: state.products)));
                  } else {
                    return Text(
                      AppString.dontFindResults,
                      style: AppTextStyle.titleMediumMed,
                    );
                  }
                } else if (state is SearchStateEmpty) {
                  return const SizedBox.shrink();
                } else {
                  return Text(
                    AppString.dontFindResults,
                    style: AppTextStyle.titleMediumMed,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
