// To parse this JSON data, do
//
//     final moviePopularFeed = moviePopularFeedFromJson(jsonString);

import 'dart:convert';

MoviePopularFeed moviePopularFeedFromJson(String str) =>
    MoviePopularFeed.fromJson(json.decode(str));

String moviePopularFeedToJson(MoviePopularFeed data) =>
    json.encode(data.toJson());

class MoviePopularFeed {
  int? count;
  SubjectCollection? subjectCollection;
  List<SubjectCollectionItem>? subjectCollectionItems;
  int? total;
  int? start;

  MoviePopularFeed({
    this.count,
    this.subjectCollection,
    this.subjectCollectionItems,
    this.total,
    this.start,
  });

  factory MoviePopularFeed.fromJson(Map<String, dynamic> json) =>
      MoviePopularFeed(
        count: json["count"],
        subjectCollection: json["subject_collection"] == null
            ? null
            : SubjectCollection.fromJson(json["subject_collection"]),
        subjectCollectionItems: json["subject_collection_items"] == null
            ? []
            : List<SubjectCollectionItem>.from(json["subject_collection_items"]!
                .map((x) => SubjectCollectionItem.fromJson(x))),
        total: json["total"],
        start: json["start"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "subject_collection": subjectCollection?.toJson(),
        "subject_collection_items": subjectCollectionItems == null
            ? []
            : List<dynamic>.from(
                subjectCollectionItems!.map((x) => x.toJson())),
        "total": total,
        "start": start,
      };
}

class SubjectCollection {
  String? subjectType;
  String? subtitle;
  BackgroundColorScheme? backgroundColorScheme;
  String? sharingTitle;
  dynamic updatedAt;
  String? screenshotTitle;
  String? screenshotUrl;
  int? total;
  String? screenshotType;
  String? id;
  String? name;
  bool? showHeaderMask;
  String? mediumName;
  dynamic badge;
  String? description;
  String? shortName;
  dynamic nFollowers;
  String? coverUrl;
  bool? showRank;
  int? doneCount;
  String? sharingUrl;
  int? subjectCount;
  String? wechatTimelineShare;
  int? collectCount;
  String? url;
  String? uri;
  Display? display;
  String? iconFgImage;
  String? moreDescription;
  bool? showFilterPlayable;

  SubjectCollection({
    this.subjectType,
    this.subtitle,
    this.backgroundColorScheme,
    this.sharingTitle,
    this.updatedAt,
    this.screenshotTitle,
    this.screenshotUrl,
    this.total,
    this.screenshotType,
    this.id,
    this.name,
    this.showHeaderMask,
    this.mediumName,
    this.badge,
    this.description,
    this.shortName,
    this.nFollowers,
    this.coverUrl,
    this.showRank,
    this.doneCount,
    this.sharingUrl,
    this.subjectCount,
    this.wechatTimelineShare,
    this.collectCount,
    this.url,
    this.uri,
    this.display,
    this.iconFgImage,
    this.moreDescription,
    this.showFilterPlayable,
  });

  factory SubjectCollection.fromJson(Map<String, dynamic> json) =>
      SubjectCollection(
        subjectType: json["subject_type"],
        subtitle: json["subtitle"],
        backgroundColorScheme: json["background_color_scheme"] == null
            ? null
            : BackgroundColorScheme.fromJson(json["background_color_scheme"]),
        sharingTitle: json["sharing_title"],
        updatedAt: json["updated_at"],
        screenshotTitle: json["screenshot_title"],
        screenshotUrl: json["screenshot_url"],
        total: json["total"],
        screenshotType: json["screenshot_type"],
        id: json["id"],
        name: json["name"],
        showHeaderMask: json["show_header_mask"],
        mediumName: json["medium_name"],
        badge: json["badge"],
        description: json["description"],
        shortName: json["short_name"],
        nFollowers: json["n_followers"],
        coverUrl: json["cover_url"],
        showRank: json["show_rank"],
        doneCount: json["done_count"],
        sharingUrl: json["sharing_url"],
        subjectCount: json["subject_count"],
        wechatTimelineShare: json["wechat_timeline_share"],
        collectCount: json["collect_count"],
        url: json["url"],
        uri: json["uri"],
        display:
            json["display"] == null ? null : Display.fromJson(json["display"]),
        iconFgImage: json["icon_fg_image"],
        moreDescription: json["more_description"],
        showFilterPlayable: json["show_filter_playable"],
      );

  Map<String, dynamic> toJson() => {
        "subject_type": subjectType,
        "subtitle": subtitle,
        "background_color_scheme": backgroundColorScheme?.toJson(),
        "sharing_title": sharingTitle,
        "updated_at": updatedAt,
        "screenshot_title": screenshotTitle,
        "screenshot_url": screenshotUrl,
        "total": total,
        "screenshot_type": screenshotType,
        "id": id,
        "name": name,
        "show_header_mask": showHeaderMask,
        "medium_name": mediumName,
        "badge": badge,
        "description": description,
        "short_name": shortName,
        "n_followers": nFollowers,
        "cover_url": coverUrl,
        "show_rank": showRank,
        "done_count": doneCount,
        "sharing_url": sharingUrl,
        "subject_count": subjectCount,
        "wechat_timeline_share": wechatTimelineShare,
        "collect_count": collectCount,
        "url": url,
        "uri": uri,
        "display": display?.toJson(),
        "icon_fg_image": iconFgImage,
        "more_description": moreDescription,
        "show_filter_playable": showFilterPlayable,
      };
}

class BackgroundColorScheme {
  bool? isDark;
  String? primaryColorLight;
  String? secondaryColor;
  String? primaryColorDark;

  BackgroundColorScheme({
    this.isDark,
    this.primaryColorLight,
    this.secondaryColor,
    this.primaryColorDark,
  });

  factory BackgroundColorScheme.fromJson(Map<String, dynamic> json) =>
      BackgroundColorScheme(
        isDark: json["is_dark"],
        primaryColorLight: json["primary_color_light"],
        secondaryColor: json["secondary_color"],
        primaryColorDark: json["primary_color_dark"],
      );

  Map<String, dynamic> toJson() => {
        "is_dark": isDark,
        "primary_color_light": primaryColorLight,
        "secondary_color": secondaryColor,
        "primary_color_dark": primaryColorDark,
      };
}

class Display {
  String? layout;

  Display({
    this.layout,
  });

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        layout: json["layout"],
      );

  Map<String, dynamic> toJson() => {
        "layout": layout,
      };
}

class SubjectCollectionItem {
  dynamic originalPrice;
  Rating? rating;
  Cover? cover;
  List<dynamic>? actions;
  String? year;
  String? cardSubtitle;
  String? id;
  String? title;
  List<Comment>? comments;
  dynamic label;
  List<String>? actors;
  dynamic interest;
  Type? type;
  String? description;
  bool? hasLinewatch;
  dynamic price;
  dynamic date;
  String? info;
  RatingData? ratingData;
  String? url;
  String? releaseDate;
  String? originalTitle;
  String? uri;
  String? subtype;
  List<String>? directors;
  String? reviewerName;
  String? nullRatingReason;

  SubjectCollectionItem({
    this.originalPrice,
    this.rating,
    this.cover,
    this.actions,
    this.year,
    this.cardSubtitle,
    this.id,
    this.title,
    this.comments,
    this.label,
    this.actors,
    this.interest,
    this.type,
    this.description,
    this.hasLinewatch,
    this.price,
    this.date,
    this.info,
    this.ratingData,
    this.url,
    this.releaseDate,
    this.originalTitle,
    this.uri,
    this.subtype,
    this.directors,
    this.reviewerName,
    this.nullRatingReason,
  });

  factory SubjectCollectionItem.fromJson(Map<String, dynamic> json) =>
      SubjectCollectionItem(
        originalPrice: json["original_price"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        cover: json["cover"] == null ? null : Cover.fromJson(json["cover"]),
        actions: json["actions"] == null
            ? []
            : List<dynamic>.from(json["actions"]!.map((x) => x)),
        year: json["year"],
        cardSubtitle: json["card_subtitle"],
        id: json["id"],
        title: json["title"],
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
        label: json["label"],
        actors: json["actors"] == null
            ? []
            : List<String>.from(json["actors"]!.map((x) => x)),
        interest: json["interest"],
        type: typeValues.map[json["type"]]!,
        description: json["description"],
        hasLinewatch: json["has_linewatch"],
        price: json["price"],
        date: json["date"],
        info: json["info"],
        ratingData: json["rating_data"] == null
            ? null
            : RatingData.fromJson(json["rating_data"]),
        url: json["url"],
        releaseDate: json["release_date"],
        originalTitle: json["original_title"],
        uri: json["uri"],
        subtype: json["subtype"],
        directors: json["directors"] == null
            ? []
            : List<String>.from(json["directors"]!.map((x) => x)),
        reviewerName: json["reviewer_name"],
        nullRatingReason: json["null_rating_reason"],
      );

  Map<String, dynamic> toJson() => {
        "original_price": originalPrice,
        "rating": rating?.toJson(),
        "cover": cover?.toJson(),
        "actions":
            actions == null ? [] : List<dynamic>.from(actions!.map((x) => x)),
        "year": year,
        "card_subtitle": cardSubtitle,
        "id": id,
        "title": title,
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "label": label,
        "actors":
            actors == null ? [] : List<dynamic>.from(actors!.map((x) => x)),
        "interest": interest,
        "type": typeValues.reverse[type],
        "description": description,
        "has_linewatch": hasLinewatch,
        "price": price,
        "date": date,
        "info": info,
        "rating_data": ratingData?.toJson(),
        "url": url,
        "release_date": releaseDate,
        "original_title": originalTitle,
        "uri": uri,
        "subtype": subtype,
        "directors": directors == null
            ? []
            : List<dynamic>.from(directors!.map((x) => x)),
        "reviewer_name": reviewerName,
        "null_rating_reason": nullRatingReason,
      };
}

class Comment {
  String? comment;
  Rating? rating;
  String? sharingUrl;
  bool? showTimeTip;
  bool? isVoted;
  String? uri;
  List<dynamic>? platforms;
  int? voteCount;
  DateTime? createTime;
  String? status;
  User? user;
  String? ipLocation;
  String? recommendReason;
  String? userDoneDesc;
  String? id;
  String? wechatTimelineShare;

  Comment({
    this.comment,
    this.rating,
    this.sharingUrl,
    this.showTimeTip,
    this.isVoted,
    this.uri,
    this.platforms,
    this.voteCount,
    this.createTime,
    this.status,
    this.user,
    this.ipLocation,
    this.recommendReason,
    this.userDoneDesc,
    this.id,
    this.wechatTimelineShare,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json["comment"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        sharingUrl: json["sharing_url"],
        showTimeTip: json["show_time_tip"],
        isVoted: json["is_voted"],
        uri: json["uri"],
        platforms: json["platforms"] == null
            ? []
            : List<dynamic>.from(json["platforms"]!.map((x) => x)),
        voteCount: json["vote_count"],
        createTime: json["create_time"] == null
            ? null
            : DateTime.parse(json["create_time"]),
        status: json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        ipLocation: json["ip_location"],
        recommendReason: json["recommend_reason"],
        userDoneDesc: json["user_done_desc"],
        id: json["id"],
        wechatTimelineShare: json["wechat_timeline_share"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "rating": rating?.toJson(),
        "sharing_url": sharingUrl,
        "show_time_tip": showTimeTip,
        "is_voted": isVoted,
        "uri": uri,
        "platforms": platforms == null
            ? []
            : List<dynamic>.from(platforms!.map((x) => x)),
        "vote_count": voteCount,
        "create_time": createTime?.toIso8601String(),
        "status": status,
        "user": user?.toJson(),
        "ip_location": ipLocation,
        "recommend_reason": recommendReason,
        "user_done_desc": userDoneDesc,
        "id": id,
        "wechat_timeline_share": wechatTimelineShare,
      };
}

class Rating {
  int? count;
  int? max;
  double? starCount;
  double? value;

  Rating({
    this.count,
    this.max,
    this.starCount,
    this.value,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        count: json["count"],
        max: json["max"],
        starCount: json["star_count"]?.toDouble(),
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "max": max,
        "star_count": starCount,
        "value": value,
      };
}

class User {
  dynamic loc;
  DateTime? regTime;
  bool? followed;
  String? name;
  bool? inBlacklist;
  String? url;
  String? gender;
  String? uri;
  String? id;
  String? remark;
  String? avatar;
  bool? isClub;
  String? type;
  String? kind;
  String? uid;

  User({
    this.loc,
    this.regTime,
    this.followed,
    this.name,
    this.inBlacklist,
    this.url,
    this.gender,
    this.uri,
    this.id,
    this.remark,
    this.avatar,
    this.isClub,
    this.type,
    this.kind,
    this.uid,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        loc: json["loc"],
        regTime:
            json["reg_time"] == null ? null : DateTime.parse(json["reg_time"]),
        followed: json["followed"],
        name: json["name"],
        inBlacklist: json["in_blacklist"],
        url: json["url"],
        gender: json["gender"],
        uri: json["uri"],
        id: json["id"],
        remark: json["remark"],
        avatar: json["avatar"],
        isClub: json["is_club"],
        type: json["type"],
        kind: json["kind"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "loc": loc,
        "reg_time": regTime?.toIso8601String(),
        "followed": followed,
        "name": name,
        "in_blacklist": inBlacklist,
        "url": url,
        "gender": gender,
        "uri": uri,
        "id": id,
        "remark": remark,
        "avatar": avatar,
        "is_club": isClub,
        "type": type,
        "kind": kind,
        "uid": uid,
      };
}

class Cover {
  String? url;
  int? width;
  Shape? shape;
  int? height;

  Cover({
    this.url,
    this.width,
    this.shape,
    this.height,
  });

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        url: json["url"],
        width: json["width"],
        shape: shapeValues.map[json["shape"]]!,
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "shape": shapeValues.reverse[shape],
        "height": height,
      };
}

enum Shape { RECTANGLE }

final shapeValues = EnumValues({"rectangle": Shape.RECTANGLE});

class RatingData {
  List<double>? stats;
  List<TypeRank>? typeRanks;

  RatingData({
    this.stats,
    this.typeRanks,
  });

  factory RatingData.fromJson(Map<String, dynamic> json) => RatingData(
        stats: json["stats"] == null
            ? []
            : List<double>.from(json["stats"]!.map((x) => x?.toDouble())),
        typeRanks: json["type_ranks"] == null
            ? []
            : List<TypeRank>.from(
                json["type_ranks"]!.map((x) => TypeRank.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stats": stats == null ? [] : List<dynamic>.from(stats!.map((x) => x)),
        "type_ranks": typeRanks == null
            ? []
            : List<dynamic>.from(typeRanks!.map((x) => x.toJson())),
      };
}

class TypeRank {
  String? type;
  double? rank;

  TypeRank({
    this.type,
    this.rank,
  });

  factory TypeRank.fromJson(Map<String, dynamic> json) => TypeRank(
        type: json["type"],
        rank: json["rank"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "rank": rank,
      };
}

enum Type { MOVIE }

final typeValues = EnumValues({"movie": Type.MOVIE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
