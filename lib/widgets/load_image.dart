import 'package:flutter/material.dart';
import 'package:flutter_study/custom/load_image.dart';
import 'package:flutter_study/utils/image_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';

class LoadImage extends StatelessWidget {
  const LoadImage(
      {Key key,
      this.image,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.format = ImageFormat.png,
      this.holderImg = 'none'})
      : super(key: key);

  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageFormat format;
  final String holderImg;

  @override
  Widget build(BuildContext context) {
    if (TextUtil.isEmpty(image) || image == 'null') {
      return LoadAssetImage(holderImg,
          height: height, width: width, fit: fit, format: format);
    } else {
      if (image.startsWith('http')) {
        return CachedNetworkImage(
          imageUrl: image,
          placeholder: (_, __) =>
              LoadAssetImage(holderImg, height: height, width: width, fit: fit),
          errorWidget: (_, __, dynamic error) =>
              LoadAssetImage(holderImg, height: height, width: width, fit: fit),
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        return LoadAssetImage(
          image,
          height: height,
          width: width,
          fit: fit,
          format: format,
        );
      }
    }
  }
}
