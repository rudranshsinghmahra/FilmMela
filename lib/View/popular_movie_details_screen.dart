import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularMovieDetailsScreen extends StatefulWidget {
  const PopularMovieDetailsScreen(
      {super.key,
      required this.imageUrl,
      required this.releaseYear,
      required this.aggregateRating,
      required this.ratingBody,
      required this.moviePlot});

  final String imageUrl;
  final String releaseYear;
  final String aggregateRating;
  final String ratingBody;
  final String moviePlot;

  @override
  State<PopularMovieDetailsScreen> createState() =>
      _PopularMovieDetailsScreenState();
}

class _PopularMovieDetailsScreenState extends State<PopularMovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Positioned(
                  bottom: 5,
                  left: 5,
                  right: 0,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xff272b2c),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, bottom: 6, top: 6),
                              child: Text(
                                widget.aggregateRating,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white30,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.releaseYear,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.ratingBody,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                top: 30,
                left: 0,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 35,
                          )),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.add_circle_outline,
                              size: 35,
                            ),
                          ),
                          Icon(
                            Icons.share_outlined,
                            size: 35,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15, bottom: 10, top: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    visualDensity: const VisualDensity(vertical: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Text(
                        "Start Watching",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
            child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                    visualDensity: const VisualDensity(vertical: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_downward),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0),
                      child: Text(
                        "Download",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.moviePlot,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    ));
  }
}
