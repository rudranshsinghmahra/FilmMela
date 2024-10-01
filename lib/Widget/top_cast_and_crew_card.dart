import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget topCastAndCrewCard(
    {required String imageUrl, required String castName}) {
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
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 12,right: 12),
                      child: Text(
                        castName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget topCastAndCrewShimmerCard() {
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
