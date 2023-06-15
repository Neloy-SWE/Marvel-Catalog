import 'dart:convert';

class SeriesListModel {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final Data? data;

  SeriesListModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory SeriesListModel.fromJson(String str) =>
      SeriesListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeriesListModel.fromMap(Map<String, dynamic> json) => SeriesListModel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toMap(),
      };
}

class Data {
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<Result>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Result {
  final int? id;
  final String? title;
  final String? description;
  final String? resourceUri;
  final List<Url>? urls;
  final int? startYear;
  final int? endYear;
  final Rating? rating;
  final ResultType? type;
  final String? modified;
  final Thumbnail? thumbnail;
  final Creators? creators;
  final Characters? characters;
  final Stories? stories;
  final Characters? comics;
  final Characters? events;
  final Next? next;
  final dynamic previous;

  Result({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.startYear,
    this.endYear,
    this.rating,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.events,
    this.next,
    this.previous,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: json["urls"] == null
            ? []
            : List<Url>.from(json["urls"]!.map((x) => Url.fromMap(x))),
        startYear: json["startYear"],
        endYear: json["endYear"],
        rating: ratingValues.map[json["rating"]]!,
        type: resultTypeValues.map[json["type"]]!,
        modified: json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        creators: json["creators"] == null
            ? null
            : Creators.fromMap(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromMap(json["characters"]),
        stories:
            json["stories"] == null ? null : Stories.fromMap(json["stories"]),
        comics:
            json["comics"] == null ? null : Characters.fromMap(json["comics"]),
        events:
            json["events"] == null ? null : Characters.fromMap(json["events"]),
        next: json["next"] == null ? null : Next.fromMap(json["next"]),
        previous: json["previous"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "urls":
            urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toMap())),
        "startYear": startYear,
        "endYear": endYear,
        "rating": ratingValues.reverse[rating],
        "type": resultTypeValues.reverse[type],
        "modified": modified,
        "thumbnail": thumbnail?.toMap(),
        "creators": creators?.toMap(),
        "characters": characters?.toMap(),
        "stories": stories?.toMap(),
        "comics": comics?.toMap(),
        "events": events?.toMap(),
        "next": next?.toMap(),
        "previous": previous,
      };
}

class Characters {
  final int? available;
  final String? collectionUri;
  final List<Next>? items;
  final int? returned;

  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Characters.fromJson(String str) =>
      Characters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<Next>.from(json["items"]!.map((x) => Next.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "returned": returned,
      };
}

class Next {
  final String? resourceUri;
  final String? name;

  Next({
    this.resourceUri,
    this.name,
  });

  factory Next.fromJson(String str) => Next.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Next.fromMap(Map<String, dynamic> json) => Next(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Creators {
  final int? available;
  final String? collectionUri;
  final List<CreatorsItem>? items;
  final int? returned;

  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Creators.fromJson(String str) => Creators.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Creators.fromMap(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<CreatorsItem>.from(
                json["items"]!.map((x) => CreatorsItem.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "returned": returned,
      };
}

class CreatorsItem {
  final String? resourceUri;
  final String? name;
  final Role? role;

  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  factory CreatorsItem.fromJson(String str) =>
      CreatorsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: roleValues.map[json["role"]]!,
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": roleValues.reverse[role],
      };
}

enum Role {
  EDITOR,
  WRITER,
  PENCILLER_COVER,
  PENCILLER,
  ARTIST,
  COLORIST,
  PENCILER,
  LETTERER,
  PENCILER_COVER,
  INKER,
  COLORIST_COVER,
  INKER_COVER,
  OTHER,
  PAINTER_COVER
}

final roleValues = EnumValues({
  "artist": Role.ARTIST,
  "colorist": Role.COLORIST,
  "colorist (cover)": Role.COLORIST_COVER,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "inker (cover)": Role.INKER_COVER,
  "letterer": Role.LETTERER,
  "other": Role.OTHER,
  "painter (cover)": Role.PAINTER_COVER,
  "penciler": Role.PENCILER,
  "penciler (cover)": Role.PENCILER_COVER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

enum Rating {
  EMPTY,
  RATED_T,
  MARVEL_PSR,
  RATING_RATED_T,
  RATING_MARVEL_PSR,
  T,
  RATING_T,
  A
}

final ratingValues = EnumValues({
  "A": Rating.A,
  "": Rating.EMPTY,
  "Marvel Psr": Rating.MARVEL_PSR,
  "Rated T": Rating.RATED_T,
  "MARVEL PSR": Rating.RATING_MARVEL_PSR,
  "Rated T+": Rating.RATING_RATED_T,
  "T+": Rating.RATING_T,
  "T": Rating.T
});

class Stories {
  final int? available;
  final String? collectionUri;
  final List<StoriesItem>? items;
  final int? returned;

  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Stories.fromJson(String str) => Stories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<StoriesItem>.from(
                json["items"]!.map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "returned": returned,
      };
}

class StoriesItem {
  final String? resourceUri;
  final String? name;
  final ItemType? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromJson(String str) =>
      StoriesItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": itemTypeValues.reverse[type],
      };
}

enum ItemType { COVER, INTERIOR_STORY, EMPTY }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY
});

class Thumbnail {
  final String? path;
  final String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "extension": extension,
      };
}

enum ResultType { COLLECTION, LIMITED, EMPTY, ONE_SHOT, ONGOING }

final resultTypeValues = EnumValues({
  "collection": ResultType.COLLECTION,
  "": ResultType.EMPTY,
  "limited": ResultType.LIMITED,
  "one shot": ResultType.ONE_SHOT,
  "ongoing": ResultType.ONGOING
});

class Url {
  final UrlType? type;
  final String? url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: urlTypeValues.map[json["type"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": urlTypeValues.reverse[type],
        "url": url,
      };
}

enum UrlType { DETAIL }

final urlTypeValues = EnumValues({"detail": UrlType.DETAIL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
