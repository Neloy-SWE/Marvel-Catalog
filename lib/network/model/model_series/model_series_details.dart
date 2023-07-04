// To parse this JSON data, do
//
//     final seriesDetailsModel = seriesDetailsModelFromMap(jsonString);

import 'dart:convert';

class SeriesDetailsModel {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final Data? data;

  SeriesDetailsModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory SeriesDetailsModel.fromJson(String str) =>
      SeriesDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeriesDetailsModel.fromMap(Map<String, dynamic> json) =>
      SeriesDetailsModel(
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
  final dynamic description;
  final String? resourceUri;
  final List<Url>? urls;
  final int? startYear;
  final int? endYear;
  final String? rating;
  final String? type;
  final String? modified;
  final Thumbnail? thumbnail;
  final Characters? creators;
  final Characters? characters;
  final Characters? stories;
  final Characters? comics;
  final Characters? events;
  final dynamic next;
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
        rating: json["rating"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        creators: json["creators"] == null
            ? null
            : Characters.fromMap(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromMap(json["characters"]),
        stories: json["stories"] == null
            ? null
            : Characters.fromMap(json["stories"]),
        comics:
            json["comics"] == null ? null : Characters.fromMap(json["comics"]),
        events:
            json["events"] == null ? null : Characters.fromMap(json["events"]),
        next: json["next"],
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
        "rating": rating,
        "type": type,
        "modified": modified,
        "thumbnail": thumbnail?.toMap(),
        "creators": creators?.toMap(),
        "characters": characters?.toMap(),
        "stories": stories?.toMap(),
        "comics": comics?.toMap(),
        "events": events?.toMap(),
        "next": next,
        "previous": previous,
      };
}

class Characters {
  final int? available;
  final String? collectionUri;
  final List<Item>? items;
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
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
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

class Item {
  final String? resourceUri;
  final String? name;
  final String? role;
  final String? type;

  Item({
    this.resourceUri,
    this.name,
    this.role,
    this.type,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
        "type": type,
      };
}

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

class Url {
  final String? type;
  final String? url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "url": url,
      };
}
