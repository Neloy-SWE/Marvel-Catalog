import 'dart:convert';

class CreatorDetailsModel {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final Data? data;

  CreatorDetailsModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory CreatorDetailsModel.fromJson(String str) => CreatorDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorDetailsModel.fromMap(Map<String, dynamic> json) => CreatorDetailsModel(
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
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "offset": offset,
    "limit": limit,
    "total": total,
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
  };
}

class Result {
  final int? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? suffix;
  final String? fullName;
  final String? modified;
  final Thumbnail? thumbnail;
  final String? resourceUri;
  final Comics? comics;
  final Comics? series;
  final Stories? stories;
  final Comics? events;
  final List<Url>? urls;

  Result({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.suffix,
    this.fullName,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    suffix: json["suffix"],
    fullName: json["fullName"],
    modified: json["modified"],
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromMap(json["thumbnail"]),
    resourceUri: json["resourceURI"],
    comics: json["comics"] == null ? null : Comics.fromMap(json["comics"]),
    series: json["series"] == null ? null : Comics.fromMap(json["series"]),
    stories: json["stories"] == null ? null : Stories.fromMap(json["stories"]),
    events: json["events"] == null ? null : Comics.fromMap(json["events"]),
    urls: json["urls"] == null ? [] : List<Url>.from(json["urls"]!.map((x) => Url.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "suffix": suffix,
    "fullName": fullName,
    "modified": modified,
    "thumbnail": thumbnail?.toMap(),
    "resourceURI": resourceUri,
    "comics": comics?.toMap(),
    "series": series?.toMap(),
    "stories": stories?.toMap(),
    "events": events?.toMap(),
    "urls": urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toMap())),
  };
}

class Comics {
  final int? available;
  final String? collectionUri;
  final List<ComicsItem>? items;
  final int? returned;

  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Comics.fromJson(String str) => Comics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comics.fromMap(Map<String, dynamic> json) => Comics(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: json["items"] == null ? [] : List<ComicsItem>.from(json["items"]!.map((x) => ComicsItem.fromMap(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toMap() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
    "returned": returned,
  };
}

class ComicsItem {
  final String? resourceUri;
  final String? name;

  ComicsItem({
    this.resourceUri,
    this.name,
  });

  factory ComicsItem.fromJson(String str) => ComicsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicsItem.fromMap(Map<String, dynamic> json) => ComicsItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "resourceURI": resourceUri,
    "name": name,
  };
}

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
    items: json["items"] == null ? [] : List<StoriesItem>.from(json["items"]!.map((x) => StoriesItem.fromMap(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toMap() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
    "returned": returned,
  };
}

class StoriesItem {
  final String? resourceUri;
  final String? name;
  final String? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromJson(String str) => StoriesItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "resourceURI": resourceUri,
    "name": name,
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
