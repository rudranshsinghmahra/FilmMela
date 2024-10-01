class TopCastAndCrewModel {
  TopCastAndCrewModel({
    required this.data,
  });

  final Data? data;

  factory TopCastAndCrewModel.fromJson(Map<String, dynamic> json) {
    return TopCastAndCrewModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.title,
  });

  final Title? title;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json["title"] == null ? null : Title.fromJson(json["title"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title?.toJson(),
      };
}

class Title {
  Title({
    required this.id,
    required this.titleType,
    required this.principalCredits,
    required this.credits,
  });

  final String? id;
  final TitleType? titleType;
  final List<PrincipalCredit> principalCredits;
  final Credits? credits;

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      id: json["id"],
      titleType: json["titleType"] == null
          ? null
          : TitleType.fromJson(json["titleType"]),
      principalCredits: json["principalCredits"] == null
          ? []
          : List<PrincipalCredit>.from(json["principalCredits"]!
              .map((x) => PrincipalCredit.fromJson(x))),
      credits:
          json["credits"] == null ? null : Credits.fromJson(json["credits"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "titleType": titleType?.toJson(),
        "principalCredits": principalCredits.map((x) => x?.toJson()).toList(),
        "credits": credits?.toJson(),
      };
}

class Credits {
  Credits({
    required this.typename,
    required this.edges,
    required this.total,
  });

  final String? typename;
  final List<Edge> edges;
  final num? total;

  factory Credits.fromJson(Map<String, dynamic> json) {
    return Credits(
      typename: json["__typename"],
      edges: json["edges"] == null
          ? []
          : List<Edge>.from(json["edges"]!.map((x) => Edge.fromJson(x))),
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "edges": edges.map((x) => x?.toJson()).toList(),
        "total": total,
      };
}

class Edge {
  Edge({
    required this.node,
  });

  final Credit? node;

  factory Edge.fromJson(Map<String, dynamic> json) {
    return Edge(
      node: json["node"] == null ? null : Credit.fromJson(json["node"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class Credit {
  Credit({
    required this.typename,
    required this.characters,
    required this.name,
  });

  final String? typename;
  final List<Character> characters;
  final Name? name;

  factory Credit.fromJson(Map<String, dynamic> json) {
    return Credit(
      typename: json["__typename"],
      characters: json["characters"] == null
          ? []
          : List<Character>.from(
              json["characters"]!.map((x) => Character.fromJson(x))),
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "characters": characters.map((x) => x?.toJson()).toList(),
        "name": name?.toJson(),
      };
}

class Character {
  Character({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
  final DisplayableProperty? displayableProperty;

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
          : DisplayableProperty.fromJson(json["displayableProperty"]),
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

class DisplayableProperty {
  DisplayableProperty({
    required this.value,
  });

  final Value? value;

  factory DisplayableProperty.fromJson(Map<String, dynamic> json) {
    return DisplayableProperty(
      value: json["value"] == null ? null : Value.fromJson(json["value"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "value": value?.toJson(),
      };
}

class Value {
  Value({
    required this.plainText,
  });

  final String? plainText;

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      plainText: json["plainText"],
    );
  }

  Map<String, dynamic> toJson() => {
        "plainText": plainText,
      };
}
