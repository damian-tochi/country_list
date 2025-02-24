import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../Theme/colors.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final ImageWidgetBuilder? imageBuilder;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.radius,
    this.placeholder,
    this.errorWidget,
    this.imageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _buildErrorWidget('No image available');
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? width!),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        imageBuilder: imageBuilder ??
            (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: fit ?? BoxFit.cover,
                    ),
                  ),
                ),
        placeholder: (context, url) =>
            placeholder?.call(context, url) ??
            Container(
              width: width ?? double.infinity,
              height: height ?? 100,
              decoration: BoxDecoration(
                color: CustomTheme.orangeAccent.shade200,
                image: DecorationImage(
                  image: MemoryImage(kTransparentImage),
                  fit: fit ?? BoxFit.cover,
                ),
              ),
            ),
        errorWidget: (context, url, error) =>
            errorWidget?.call(context, url, error) ??
            Container(
              color: CustomTheme.orangeAccent.shade200,
              child: Icon(
                Icons.error_outline,
                color: CustomTheme.orangeAccent.shade200,
              ),
            ),
      ),
    );
  }
}

Widget _buildErrorWidget(String message) {
  return Container(
    color: CustomTheme.orangeAccent.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.broken_image_outlined,
          color: CustomTheme.orangeAccent.shade200,
        ),
      ],
    ),
  );
}
