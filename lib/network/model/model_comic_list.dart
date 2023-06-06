// To parse this JSON data, do
//
//     final comicListModel = comicListModelFromMap(jsonString);

import 'dart:convert';

class ComicListModel {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final Data? data;

  ComicListModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory ComicListModel.fromJson(String str) =>
      ComicListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicListModel.fromMap(Map<String, dynamic> json) => ComicListModel(
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
  final int? digitalId;
  final String? title;
  final int? issueNumber;
  final String? variantDescription;
  final String? description;
  final String? modified;
  final String? isbn;
  final String? upc;
  final String? diamondCode;
  final Ean? ean;
  final String? issn;
  final Format? format;
  final int? pageCount;
  final List<TextObject>? textObjects;
  final String? resourceUri;
  final List<Url>? urls;
  final Series? series;
  final List<Series>? variants;
  final List<Series>? collections;
  final List<Series>? collectedIssues;
  final List<Date>? dates;
  final List<Price>? prices;
  final Thumbnail? thumbnail;
  final List<Thumbnail>? images;
  final Creators? creators;
  final Characters? characters;
  final Stories? stories;
  final Characters? events;

  Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: eanValues.map[json["ean"]]!,
        issn: json["issn"],
        format: formatValues.map[json["format"]]!,
        pageCount: json["pageCount"],
        textObjects: json["textObjects"] == null
            ? []
            : List<TextObject>.from(
                json["textObjects"]!.map((x) => TextObject.fromMap(x))),
        resourceUri: json["resourceURI"],
        urls: json["urls"] == null
            ? []
            : List<Url>.from(json["urls"]!.map((x) => Url.fromMap(x))),
        series: json["series"] == null ? null : Series.fromMap(json["series"]),
        variants: json["variants"] == null
            ? []
            : List<Series>.from(
                json["variants"]!.map((x) => Series.fromMap(x))),
        collections: json["collections"] == null
            ? []
            : List<Series>.from(
                json["collections"]!.map((x) => Series.fromMap(x))),
        collectedIssues: json["collectedIssues"] == null
            ? []
            : List<Series>.from(
                json["collectedIssues"]!.map((x) => Series.fromMap(x))),
        dates: json["dates"] == null
            ? []
            : List<Date>.from(json["dates"]!.map((x) => Date.fromMap(x))),
        prices: json["prices"] == null
            ? []
            : List<Price>.from(json["prices"]!.map((x) => Price.fromMap(x))),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        images: json["images"] == null
            ? []
            : List<Thumbnail>.from(
                json["images"]!.map((x) => Thumbnail.fromMap(x))),
        creators: json["creators"] == null
            ? null
            : Creators.fromMap(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromMap(json["characters"]),
        stories:
            json["stories"] == null ? null : Stories.fromMap(json["stories"]),
        events:
            json["events"] == null ? null : Characters.fromMap(json["events"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": description,
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCode,
        "ean": eanValues.reverse[ean],
        "issn": issn,
        "format": formatValues.reverse[format],
        "pageCount": pageCount,
        "textObjects": textObjects == null
            ? []
            : List<dynamic>.from(textObjects!.map((x) => x.toMap())),
        "resourceURI": resourceUri,
        "urls":
            urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toMap())),
        "series": series?.toMap(),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toMap())),
        "collections": collections == null
            ? []
            : List<dynamic>.from(collections!.map((x) => x.toMap())),
        "collectedIssues": collectedIssues == null
            ? []
            : List<dynamic>.from(collectedIssues!.map((x) => x.toMap())),
        "dates": dates == null
            ? []
            : List<dynamic>.from(dates!.map((x) => x.toMap())),
        "prices": prices == null
            ? []
            : List<dynamic>.from(prices!.map((x) => x.toMap())),
        "thumbnail": thumbnail?.toMap(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toMap())),
        "creators": creators?.toMap(),
        "characters": characters?.toMap(),
        "stories": stories?.toMap(),
        "events": events?.toMap(),
      };
}

class Characters {
  final int? available;
  final String? collectionUri;
  final List<Series>? items;
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
            : List<Series>.from(json["items"]!.map((x) => Series.fromMap(x))),
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

class Series {
  final String? resourceUri;
  final String? name;

  Series({
    this.resourceUri,
    this.name,
  });

  factory Series.fromJson(String str) => Series.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Series.fromMap(Map<String, dynamic> json) => Series(
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
  PENCILLER_COVER,
  WRITER,
  INKER,
  PENCILER,
  LETTERER,
  COLORIST,
  PENCILLER,
  ARTIST,
  OTHER,
  PENCILER_COVER,
  COLORIST_COVER,
  INKER_COVER
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
  "penciler": Role.PENCILER,
  "penciler (cover)": Role.PENCILER_COVER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

class Date {
  final DateType? type;
  final String? date;

  Date({
    this.type,
    this.date,
  });

  factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        type: dateTypeValues.map[json["type"]]!,
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "type": dateTypeValues.reverse[type],
        "date": date,
      };
}

enum DateType { ONSALE_DATE, FOC_DATE, UNLIMITED_DATE, DIGITAL_PURCHASE_DATE }

final dateTypeValues = EnumValues({
  "digitalPurchaseDate": DateType.DIGITAL_PURCHASE_DATE,
  "focDate": DateType.FOC_DATE,
  "onsaleDate": DateType.ONSALE_DATE,
  "unlimitedDate": DateType.UNLIMITED_DATE
});

enum Ean {
  EMPTY,
  THE_978078513704752499,
  THE_978078516750152999,
  THE_978078513621752499,
  THE_978078512178753999,
  THE_978130293462051599,
  THE_978078513450351499
}

final eanValues = EnumValues({
  "": Ean.EMPTY,
  "9780785 121787 53999": Ean.THE_978078512178753999,
  "9780785 134503 51499": Ean.THE_978078513450351499,
  "9780785 136217 52499": Ean.THE_978078513621752499,
  "9780785 137047 52499": Ean.THE_978078513704752499,
  "9780785 167501 52999": Ean.THE_978078516750152999,
  "9781302 934620 51599": Ean.THE_978130293462051599
});

enum Format {
  EMPTY,
  COMIC,
  DIGITAL_COMIC,
  TRADE_PAPERBACK,
  HARDCOVER,
  DIGEST,
  DIGITAL_VERTICAL_COMIC
}

final formatValues = EnumValues({
  "Comic": Format.COMIC,
  "Digest": Format.DIGEST,
  "Digital Comic": Format.DIGITAL_COMIC,
  "Digital Vertical Comic": Format.DIGITAL_VERTICAL_COMIC,
  "": Format.EMPTY,
  "Hardcover": Format.HARDCOVER,
  "Trade Paperback": Format.TRADE_PAPERBACK
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

enum Extension { JPG }

final extensionValues = EnumValues({"jpg": Extension.JPG});

class Price {
  final PriceType? type;
  final double? price;

  Price({
    this.type,
    this.price,
  });

  factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        type: priceTypeValues.map[json["type"]]!,
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "type": priceTypeValues.reverse[type],
        "price": price,
      };
}

enum PriceType { PRINT_PRICE, DIGITAL_PURCHASE_PRICE }

final priceTypeValues = EnumValues({
  "digitalPurchasePrice": PriceType.DIGITAL_PURCHASE_PRICE,
  "printPrice": PriceType.PRINT_PRICE
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

enum ItemType { COVER, INTERIOR_STORY, EMPTY, RECAP, LETTERS, PROMO }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY,
  "letters": ItemType.LETTERS,
  "promo": ItemType.PROMO,
  "recap": ItemType.RECAP
});

class TextObject {
  final TextObjectType? type;
  final Language? language;
  final String? text;

  TextObject({
    this.type,
    this.language,
    this.text,
  });

  factory TextObject.fromJson(String str) =>
      TextObject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TextObject.fromMap(Map<String, dynamic> json) => TextObject(
        type: textObjectTypeValues.map[json["type"]]!,
        language: languageValues.map[json["language"]]!,
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "type": textObjectTypeValues.reverse[type],
        "language": languageValues.reverse[language],
        "text": text,
      };
}

enum Language { EN_US }

final languageValues = EnumValues({"en-us": Language.EN_US});

enum TextObjectType { ISSUE_SOLICIT_TEXT, ISSUE_PREVIEW_TEXT }

final textObjectTypeValues = EnumValues({
  "issue_preview_text": TextObjectType.ISSUE_PREVIEW_TEXT,
  "issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT
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

enum UrlType { DETAIL, PURCHASE, READER, IN_APP_LINK }

final urlTypeValues = EnumValues({
  "detail": UrlType.DETAIL,
  "inAppLink": UrlType.IN_APP_LINK,
  "purchase": UrlType.PURCHASE,
  "reader": UrlType.READER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
