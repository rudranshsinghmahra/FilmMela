class PopularMoviesModel {
  PopularMoviesModel({
    required this.data,
  });

  final Data? data;

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.movies,
    required this.tv,
  });

  final Movies? movies;
  final Movies? tv;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      movies: json["movies"] == null ? null : Movies.fromJson(json["movies"]),
      tv: json["tv"] == null ? null : Movies.fromJson(json["tv"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "movies": movies?.toJson(),
        "tv": tv?.toJson(),
      };
}

class Movies {
  Movies({
    required this.typename,
    required this.edges,
    required this.pageInfo,
  });

  final String? typename;
  final List<Edge> edges;
  final PageInfo? pageInfo;

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      typename: json["__typename"],
      edges: json["edges"] == null
          ? []
          : List<Edge>.from(json["edges"]!.map((x) => Edge.fromJson(x))),
      pageInfo:
          json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "edges": edges.map((x) => x?.toJson()).toList(),
        "pageInfo": pageInfo?.toJson(),
      };
}

class Edge {
  Edge({
    required this.node,
  });

  final Node? node;

  factory Edge.fromJson(Map<String, dynamic> json) {
    return Edge(
      node: json["node"] == null ? null : Node.fromJson(json["node"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class Node {
  Node({
    required this.typename,
    required this.id,
    required this.titleText,
    required this.originalTitleText,
    required this.releaseYear,
    required this.releaseDate,
    required this.titleType,
    required this.primaryImage,
    required this.metacritic,
    required this.principalCredits,
    required this.certificate,
    required this.plot,
    required this.titleGenres,
    required this.ratingsSummary,
    required this.canRate,
  });

  final String? typename;
  final String? id;
  final TitleText? titleText;
  final TitleText? originalTitleText;
  final ReleaseYear? releaseYear;
  final ReleaseDate? releaseDate;
  final TitleType? titleType;
  final PrimaryImage? primaryImage;
  final Metacritic? metacritic;
  final List<PrincipalCredit> principalCredits;
  final Certificate? certificate;
  final Plot? plot;
  final TitleGenres? titleGenres;
  final RatingsSummary? ratingsSummary;
  final CanRate? canRate;

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      typename: json["__typename"],
      id: json["id"],
      titleText: json["titleText"] == null
          ? null
          : TitleText.fromJson(json["titleText"]),
      originalTitleText: json["originalTitleText"] == null
          ? null
          : TitleText.fromJson(json["originalTitleText"]),
      releaseYear: json["releaseYear"] == null
          ? null
          : ReleaseYear.fromJson(json["releaseYear"]),
      releaseDate: json["releaseDate"] == null
          ? null
          : ReleaseDate.fromJson(json["releaseDate"]),
      titleType: json["titleType"] == null
          ? null
          : TitleType.fromJson(json["titleType"]),
      primaryImage: json["primaryImage"] == null
          ? null
          : PrimaryImage.fromJson(json["primaryImage"]),
      metacritic: json["metacritic"] == null
          ? null
          : Metacritic.fromJson(json["metacritic"]),
      principalCredits: json["principalCredits"] == null
          ? []
          : List<PrincipalCredit>.from(json["principalCredits"]!
              .map((x) => PrincipalCredit.fromJson(x))),
      certificate: json["certificate"] == null
          ? null
          : Certificate.fromJson(json["certificate"]),
      plot: json["plot"] == null ? null : Plot.fromJson(json["plot"]),
      titleGenres: json["titleGenres"] == null
          ? null
          : TitleGenres.fromJson(json["titleGenres"]),
      ratingsSummary: json["ratingsSummary"] == null
          ? null
          : RatingsSummary.fromJson(json["ratingsSummary"]),
      canRate:
          json["canRate"] == null ? null : CanRate.fromJson(json["canRate"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "titleText": titleText?.toJson(),
        "originalTitleText": originalTitleText?.toJson(),
        "releaseYear": releaseYear?.toJson(),
        "releaseDate": releaseDate?.toJson(),
        "titleType": titleType?.toJson(),
        "primaryImage": primaryImage?.toJson(),
        "metacritic": metacritic?.toJson(),
        "principalCredits": principalCredits.map((x) => x?.toJson()).toList(),
        "certificate": certificate?.toJson(),
        "plot": plot?.toJson(),
        "titleGenres": titleGenres?.toJson(),
        "ratingsSummary": ratingsSummary?.toJson(),
        "canRate": canRate?.toJson(),
      };
}

class CanRate {
  CanRate({
    required this.isRatable,
  });

  final bool? isRatable;

  factory CanRate.fromJson(Map<String, dynamic> json) {
    return CanRate(
      isRatable: json["isRatable"],
    );
  }

  Map<String, dynamic> toJson() => {
        "isRatable": isRatable,
      };
}

class Certificate {
  Certificate({
    required this.id,
    required this.ratingsBody,
    required this.ratingReason,
    required this.rating,
  });

  final String? id;
  final RatingsBody? ratingsBody;
  final String? ratingReason;
  final String? rating;

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      id: json["id"],
      ratingsBody: json["ratingsBody"] == null
          ? null
          : RatingsBody.fromJson(json["ratingsBody"]),
      ratingReason: json["ratingReason"],
      rating: json["rating"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "ratingsBody": ratingsBody?.toJson(),
        "ratingReason": ratingReason,
        "rating": rating,
      };
}

class RatingsBody {
  RatingsBody({
    required this.id,
    required this.text,
  });

  final String? id;
  final String? text;

  factory RatingsBody.fromJson(Map<String, dynamic> json) {
    return RatingsBody(
      id: json["id"],
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}

class Metacritic {
  Metacritic({
    required this.metascore,
  });

  final Metascore? metascore;

  factory Metacritic.fromJson(Map<String, dynamic> json) {
    return Metacritic(
      metascore: json["metascore"] == null
          ? null
          : Metascore.fromJson(json["metascore"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "metascore": metascore?.toJson(),
      };
}

class Metascore {
  Metascore({
    required this.score,
  });

  final num? score;

  factory Metascore.fromJson(Map<String, dynamic> json) {
    return Metascore(
      score: json["score"],
    );
  }

  Map<String, dynamic> toJson() => {
        "score": score,
      };
}

class TitleText {
  TitleText({
    required this.text,
    required this.isOriginalTitle,
  });

  final String? text;
  final bool? isOriginalTitle;

  factory TitleText.fromJson(Map<String, dynamic> json) {
    return TitleText(
      text: json["text"],
      isOriginalTitle: json["isOriginalTitle"],
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
        "isOriginalTitle": isOriginalTitle,
      };
}

class Plot {
  Plot({
    required this.id,
    required this.plotText,
  });

  final String? id;
  final PlotText? plotText;

  factory Plot.fromJson(Map<String, dynamic> json) {
    return Plot(
      id: json["id"],
      plotText:
          json["plotText"] == null ? null : PlotText.fromJson(json["plotText"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "plotText": plotText?.toJson(),
      };
}

class PlotText {
  PlotText({
    required this.plainText,
  });

  final String? plainText;

  factory PlotText.fromJson(Map<String, dynamic> json) {
    return PlotText(
      plainText: json["plainText"],
    );
  }

  Map<String, dynamic> toJson() => {
        "plainText": plainText,
      };
}

class PrimaryImage {
  PrimaryImage({
    required this.typename,
    required this.id,
    required this.url,
    required this.height,
    required this.width,
  });

  final String? typename;
  final String? id;
  final String? url;
  final num? height;
  final int? width;

  factory PrimaryImage.fromJson(Map<String, dynamic> json) {
    return PrimaryImage(
      typename: json["__typename"],
      id: json["id"],
      url: json["url"],
      height: json["height"],
      width: json["width"],
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "url": url,
        "height": height,
        "width": width,
      };
}

class PrincipalCredit {
  PrincipalCredit({
    required this.credits,
  });

  final List<Credit> credits;

  factory PrincipalCredit.fromJson(Map<String, dynamic> json) {
    return PrincipalCredit(
      credits: json["credits"] == null
          ? []
          : List<Credit>.from(json["credits"]!.map((x) => Credit.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "credits": credits.map((x) => x?.toJson()).toList(),
      };
}

class Credit {
  Credit({
    required this.name,
  });

  final Name? name;

  factory Credit.fromJson(Map<String, dynamic> json) {
    return Credit(
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
      };
}

class Name {
  Name({
    required this.typename,
    required this.id,
    required this.nameText,
    required this.primaryImage,
  });

  final String? typename;
  final String? id;
  final NameText? nameText;
  final PrimaryImage? primaryImage;

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      typename: json["__typename"],
      id: json["id"],
      nameText:
          json["nameText"] == null ? null : NameText.fromJson(json["nameText"]),
      primaryImage: json["primaryImage"] == null
          ? null
          : PrimaryImage.fromJson(json["primaryImage"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "nameText": nameText?.toJson(),
        "primaryImage": primaryImage?.toJson(),
      };
}

class NameText {
  NameText({
    required this.text,
  });

  final String? text;

  factory NameText.fromJson(Map<String, dynamic> json) {
    return NameText(
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class RatingsSummary {
  RatingsSummary({
    required this.aggregateRating,
  });

  final num? aggregateRating;

  factory RatingsSummary.fromJson(Map<String, dynamic> json) {
    return RatingsSummary(
      aggregateRating: json["aggregateRating"],
    );
  }

  Map<String, dynamic> toJson() => {
        "aggregateRating": aggregateRating,
      };
}

class ReleaseDate {
  ReleaseDate({
    required this.typename,
    required this.month,
    required this.day,
    required this.year,
    required this.country,
    required this.restriction,
    required this.attributes,
    required this.displayableProperty,
  });

  final String? typename;
  final num? month;
  final num? day;
  final num? year;
  final Country? country;
  final dynamic restriction;
  final List<RatingsBody> attributes;
  final ReleaseDateDisplayableProperty? displayableProperty;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) {
    return ReleaseDate(
      typename: json["__typename"],
      month: json["month"],
      day: json["day"],
      year: json["year"],
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      restriction: json["restriction"],
      attributes: json["attributes"] == null
          ? []
          : List<RatingsBody>.from(
              json["attributes"]!.map((x) => RatingsBody.fromJson(x))),
      displayableProperty: json["displayableProperty"] == null
          ? null
          : ReleaseDateDisplayableProperty.fromJson(
              json["displayableProperty"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "month": month,
        "day": day,
        "year": year,
        "country": country?.toJson(),
        "restriction": restriction,
        "attributes": attributes.map((x) => x?.toJson()).toList(),
        "displayableProperty": displayableProperty?.toJson(),
      };
}

class Country {
  Country({
    required this.id,
  });

  final String? id;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class ReleaseDateDisplayableProperty {
  ReleaseDateDisplayableProperty({
    required this.qualifiersInMarkdownList,
  });

  final dynamic qualifiersInMarkdownList;

  factory ReleaseDateDisplayableProperty.fromJson(Map<String, dynamic> json) {
    return ReleaseDateDisplayableProperty(
      qualifiersInMarkdownList: json["qualifiersInMarkdownList"],
    );
  }

  Map<String, dynamic> toJson() => {
        "qualifiersInMarkdownList": qualifiersInMarkdownList,
      };
}

class ReleaseYear {
  ReleaseYear({
    required this.typename,
    required this.year,
    required this.endYear,
  });

  final String? typename;
  final num? year;
  final num? endYear;

  factory ReleaseYear.fromJson(Map<String, dynamic> json) {
    return ReleaseYear(
      typename: json["__typename"],
      year: json["year"],
      endYear: json["endYear"],
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "year": year,
        "endYear": endYear,
      };
}

class TitleGenres {
  TitleGenres({
    required this.typename,
    required this.genres,
  });

  final String? typename;
  final List<GenreElement> genres;

  factory TitleGenres.fromJson(Map<String, dynamic> json) {
    return TitleGenres(
      typename: json["__typename"],
      genres: json["genres"] == null
          ? []
          : List<GenreElement>.from(
              json["genres"]!.map((x) => GenreElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "genres": genres.map((x) => x?.toJson()).toList(),
      };
}

class GenreElement {
  GenreElement({
    required this.genre,
  });

  final GenreGenre? genre;

  factory GenreElement.fromJson(Map<String, dynamic> json) {
    return GenreElement(
      genre: json["genre"] == null ? null : GenreGenre.fromJson(json["genre"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "genre": genre?.toJson(),
      };
}

class GenreGenre {
  GenreGenre({
    required this.genreId,
    required this.text,
  });

  final String? genreId;
  final String? text;

  factory GenreGenre.fromJson(Map<String, dynamic> json) {
    return GenreGenre(
      genreId: json["genreId"],
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() => {
        "genreId": genreId,
        "text": text,
      };
}

class TitleType {
  TitleType({
    required this.typename,
    required this.id,
    required this.text,
    required this.categories,
    required this.canHaveEpisodes,
    required this.isEpisode,
    required this.isSeries,
    required this.displayableProperty,
  });

  final String? typename;
  final String? id;
  final String? text;
  final List<Category> categories;
  final bool? canHaveEpisodes;
  final bool? isEpisode;
  final bool? isSeries;
  final TitleTypeDisplayableProperty? displayableProperty;

  factory TitleType.fromJson(Map<String, dynamic> json) {
    return TitleType(
      typename: json["__typename"],
      id: json["id"],
      text: json["text"],
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x))),
      canHaveEpisodes: json["canHaveEpisodes"],
      isEpisode: json["isEpisode"],
      isSeries: json["isSeries"],
      displayableProperty: json["displayableProperty"] == null
          ? null
          : TitleTypeDisplayableProperty.fromJson(json["displayableProperty"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "text": text,
        "categories": categories.map((x) => x?.toJson()).toList(),
        "canHaveEpisodes": canHaveEpisodes,
        "isEpisode": isEpisode,
        "isSeries": isSeries,
        "displayableProperty": displayableProperty?.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.text,
    required this.value,
  });

  final String? id;
  final String? text;
  final String? value;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      text: json["text"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "value": value,
      };
}

class TitleTypeDisplayableProperty {
  TitleTypeDisplayableProperty({
    required this.value,
  });

  final PlotText? value;

  factory TitleTypeDisplayableProperty.fromJson(Map<String, dynamic> json) {
    return TitleTypeDisplayableProperty(
      value: json["value"] == null ? null : PlotText.fromJson(json["value"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "value": value?.toJson(),
      };
}

class PageInfo {
  PageInfo({
    required this.typename,
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.startCursor,
    required this.endCursor,
  });

  final String? typename;
  final bool? hasNextPage;
  final bool? hasPreviousPage;
  final String? startCursor;
  final String? endCursor;

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      typename: json["__typename"],
      hasNextPage: json["hasNextPage"],
      hasPreviousPage: json["hasPreviousPage"],
      startCursor: json["startCursor"],
      endCursor: json["endCursor"],
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "hasNextPage": hasNextPage,
        "hasPreviousPage": hasPreviousPage,
        "startCursor": startCursor,
        "endCursor": endCursor,
      };
}
