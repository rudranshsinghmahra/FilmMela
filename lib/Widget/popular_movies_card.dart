import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget popularMoviesCard({required String imageUrl}) {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        height: 220,
        width: 190,
        color: Colors.transparent,
      ),
      imageBuilder: (context, imageProvider) {
        return Container(
          height: 220,
          width: 190,
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              )),
        );
      },
    ),
  );
}

Widget popularMoviesShimmerCard() {
  return Padding(
    padding: const EdgeInsets.only(right: 15.0),
    child: Container(
      height: 220,
      width: 190,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: const Color(0xffc0c0c0),
        period: const Duration(seconds: 2), // Adjust shimmer speed
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
          ),
        ),
      ),
    ),
  );
}
