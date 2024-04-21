/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/png/avatar.png');

  /// File path: assets/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/png/logo.png');

  /// File path: assets/png/product_watch.png
  AssetGenImage get productWatch =>
      const AssetGenImage('assets/png/product_watch.png');

  /// File path: assets/png/product_watch2.png
  AssetGenImage get productWatch2 =>
      const AssetGenImage('assets/png/product_watch2.png');

  /// File path: assets/png/watch.jpg
  AssetGenImage get watch => const AssetGenImage('assets/png/watch.jpg');

  /// File path: assets/png/watch1.png
  AssetGenImage get watch1 => const AssetGenImage('assets/png/watch1.png');

  /// File path: assets/png/watch2.jpg
  AssetGenImage get watch2 => const AssetGenImage('assets/png/watch2.jpg');

  /// File path: assets/png/watch3.jpg
  AssetGenImage get watch3 => const AssetGenImage('assets/png/watch3.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        avatar,
        logo,
        productWatch,
        productWatch2,
        watch,
        watch1,
        watch2,
        watch3
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bascket.svg
  String get bascket => 'assets/svg/bascket.svg';

  /// File path: assets/svg/blueBasket.svg
  String get blueBasket => 'assets/svg/blueBasket.svg';

  /// File path: assets/svg/card.svg
  String get card => 'assets/svg/card.svg';

  /// File path: assets/svg/classic.svg
  String get classic => 'assets/svg/classic.svg';

  /// File path: assets/svg/close.svg
  String get close => 'assets/svg/close.svg';

  /// File path: assets/svg/delete.svg
  String get delete => 'assets/svg/delete.svg';

  /// File path: assets/svg/desktop.svg
  String get desktop => 'assets/svg/desktop.svg';

  /// File path: assets/svg/digital.svg
  String get digital => 'assets/svg/digital.svg';

  /// File path: assets/svg/direct-left.svg
  String get directLeft => 'assets/svg/direct-left.svg';

  /// File path: assets/svg/filter.svg
  String get filter => 'assets/svg/filter.svg';

  /// File path: assets/svg/forward-flash.svg
  String get forwardFlash => 'assets/svg/forward-flash.svg';

  /// File path: assets/svg/greenDelivered.svg
  String get greenDelivered => 'assets/svg/greenDelivered.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/location-add.svg
  String get locationAdd => 'assets/svg/location-add.svg';

  /// File path: assets/svg/minus.svg
  String get minus => 'assets/svg/minus.svg';

  /// File path: assets/svg/phone.svg
  String get phone => 'assets/svg/phone.svg';

  /// File path: assets/svg/plus.svg
  String get plus => 'assets/svg/plus.svg';

  /// File path: assets/svg/redCancled.svg
  String get redCancled => 'assets/svg/redCancled.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';

  /// File path: assets/svg/smallUser.svg
  String get smallUser => 'assets/svg/smallUser.svg';

  /// File path: assets/svg/smart.svg
  String get smart => 'assets/svg/smart.svg';

  /// File path: assets/svg/user.svg
  String get user => 'assets/svg/user.svg';

  /// List of all assets
  List<String> get values => [
        bascket,
        blueBasket,
        card,
        classic,
        close,
        delete,
        desktop,
        digital,
        directLeft,
        filter,
        forwardFlash,
        greenDelivered,
        home,
        locationAdd,
        minus,
        phone,
        plus,
        redCancled,
        search,
        smallUser,
        smart,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
