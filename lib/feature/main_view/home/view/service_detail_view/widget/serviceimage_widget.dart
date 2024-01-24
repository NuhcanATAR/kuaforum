import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ServiceImageWidget extends StatelessWidget {
  const ServiceImageWidget(
      {required this.data,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      height: dynamicHeight(0.3),
      child: CachedNetworkImage(
        imageUrl: data['COVERIMG'].toString(),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          color: Colors.grey.withOpacity(0.2),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}
