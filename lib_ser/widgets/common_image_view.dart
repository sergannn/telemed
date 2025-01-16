import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:doctorq/utils/utility.dart';

class CommonImageView extends StatelessWidget {
  final String? url;
  final String? imagePath;
  final String? svgPath;
  final Color? color;
  final double? opacity;
  final File? file;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String placeHolder;

  const CommonImageView({
    Key? key,
    this.url,
    this.imagePath,
    this.svgPath,
    this.color,
    this.opacity = 1,
    this.file,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.placeHolder = 'assets/images/empty.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return opacity! < 1
        ? Opacity(opacity: opacity!, child: _buildImageView())
        : _buildImageView();
  }

  Widget _buildImageView() {
    printLog("building image ${url}");
    if (svgPath != null && svgPath!.isNotEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          color: color,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      printLog("its file (image)");
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (url != null && url!.isNotEmpty) {
      printLog("its a network image");

      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        errorWidget: (context, url, error) {
          printLog("error in network ${url}");
          return Image.asset(
            placeHolder,
            height: height,
            width: width,
            fit: fit,
          );
        },
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      printLog("its asset image ${imagePath}");
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit,
      );
    }
    printLog("sizedBox");
    return const SizedBox(child: Text("no image"));
  }
}
