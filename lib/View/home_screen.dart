import 'package:chips_choice/chips_choice.dart';
import 'package:film_mela/Helper/api_base_helper.dart';
import 'package:film_mela/Model/PopularMoviesModel.dart';
import 'package:film_mela/Model/TopCastAndCrewModel.dart';
import 'package:film_mela/View/popular_movie_details_screen.dart';
import 'package:film_mela/WIdget/popular_movies_card.dart';
import 'package:film_mela/Widget/top_cast_and_crew_card.dart';
import 'package:flutter/material.dart';

import '../Helper/uri.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  int tag = 0;
  List<String> options = [
    'All',
    'TV Series',
    'Bollywood',
    'Hindi Dubbed',
    'Comedy',
    'Drama',
    'Action',
  ];

  Future<PopularMoviesModel?> getPopularMovies() async {
    final getData = await apiBaseHelper.getApiCall(popularMoviesUri, null);
    if (getData != null) {
      return PopularMoviesModel.fromJson(getData);
    }
    return null;
  }

  Future<TopCastAndCrewModel?> getTopCastAndCrew() async {
    final getData = await apiBaseHelper.getApiCall(topCastAndCrewUri, null);
    if (getData != null) {
      return TopCastAndCrewModel.fromJson(getData);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    child: Image.asset(
                      "assets/allu_arjun.jpg",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ChipsChoice<int>.single(
                      value: tag,
                      onChanged: (val) => setState(() => tag = val),
                      choiceItems: C2Choice.listFrom<int, String>(
                        source: options,
                        value: (i, v) => i,
                        label: (i, v) => v,
                      ),
                      choiceBuilder: (item, i) {
                        final isSelected = i == tag;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: ChoiceChip(
                            label: Text(
                              options[i],
                              style: TextStyle(
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            selected: isSelected,
                            onSelected: (_) {},
                            selectedColor: Colors.white,
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            showCheckmark: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Colors.transparent)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  const Text(
                    "Popular Movies",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigate_next,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 230,
                width: double.infinity,
                child: FutureBuilder<PopularMoviesModel?>(
                  future: getPopularMovies(),
                  builder: (BuildContext context,
                      AsyncSnapshot<PopularMoviesModel?> snapshot) {
                    final snapshotData = snapshot.data?.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        cacheExtent: MediaQuery.of(context).size.width * 3,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: popularMoviesShimmerCard(),
                          ); // Pass movie data
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshotData!.movies?.edges.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PopularMovieDetailsScreen(
                                      imageUrl: snapshotData.movies!
                                          .edges[index].node!.primaryImage!.url
                                          .toString(),
                                      releaseYear: snapshotData.movies!
                                          .edges[index].node!.releaseYear!.year
                                          .toString(),
                                      aggregateRating: snapshotData
                                          .movies!
                                          .edges[index]
                                          .node!
                                          .ratingsSummary!
                                          .aggregateRating != null ? snapshotData
                                          .movies!
                                          .edges[index]
                                          .node!
                                          .ratingsSummary!
                                          .aggregateRating
                                          .toString() : "No Ratings",
                                      ratingBody: snapshotData
                                                  .movies!
                                                  .edges[index]
                                                  .node!
                                                  .certificate !=
                                              null
                                          ? snapshotData
                                              .movies!
                                              .edges[index]
                                              .node!
                                              .certificate!
                                              .ratingsBody!
                                              .text
                                              .toString()
                                          : "NA",
                                      moviePlot: snapshotData.movies!
                                                  .edges[index].node!.plot !=
                                              null
                                          ? snapshotData.movies!.edges[index]
                                              .node!.plot!.plotText!.plainText
                                              .toString()
                                          : "Movie plot not available",
                                    ),
                                  ),
                                );
                              },
                              child: popularMoviesCard(
                                imageUrl: snapshotData.movies!.edges[index]
                                    .node!.primaryImage!.url
                                    .toString(),
                              ),
                            ),
                          ); // Pass movie data
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "No Movies Found",
                        ), // Show this message when no data is found
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  const Text(
                    "Top Cast and Crew",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigate_next,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                height: 230,
                width: double.infinity,
                child: FutureBuilder<TopCastAndCrewModel?>(
                  future: getTopCastAndCrew(),
                  builder: (BuildContext context,
                      AsyncSnapshot<TopCastAndCrewModel?> snapshot) {
                    final snapshotData = snapshot.data?.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        cacheExtent: MediaQuery.of(context).size.width * 3,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: popularMoviesShimmerCard(),
                          ); // Pass movie data
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshotData!.title?.credits?.edges.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: topCastAndCrewCard(
                                  imageUrl: snapshotData
                                              .title!
                                              .credits!
                                              .edges[index]
                                              .node!
                                              .name!
                                              .primaryImage !=
                                          null
                                      ? snapshotData
                                          .title!
                                          .credits!
                                          .edges[index]
                                          .node!
                                          .name!
                                          .primaryImage!
                                          .url
                                          .toString()
                                      : "https://feji.us/d8tmnm",
                                  castName: snapshotData.title!.credits!
                                      .edges[index].node!.name!.nameText!.text
                                      .toString()),
                            ),
                          ); // Pass movie data
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "No Movies Found",
                        ), // Show this message when no data is found
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
