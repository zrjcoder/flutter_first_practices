// To parse this JSON data, do
//
//     final moviePopularFeed = moviePopularFeedFromJson(jsonString);

import 'dart:convert';

MoviePopularFeed moviePopularFeedFromJson(String str) =>
    MoviePopularFeed.fromJson(json.decode(str));

String moviePopularFeedToJson(MoviePopularFeed data) =>
    json.encode(data.toJson());

class MoviePopularFeed {
  int count;
  SubjectCollection subjectCollection;
  List<SubjectCollectionItem> subjectCollectionItems;
  int total;
  int start;

  MoviePopularFeed({
    required this.count,
    required this.subjectCollection,
    required this.subjectCollectionItems,
    required this.total,
    required this.start,
  });

  factory MoviePopularFeed.fromJson(Map<String, dynamic> json) =>
      MoviePopularFeed(
        count: json["count"],
        subjectCollection:
            SubjectCollection.fromJson(json["subject_collection"]),
        subjectCollectionItems: List<SubjectCollectionItem>.from(
            json["subject_collection_items"]
                .map((x) => SubjectCollectionItem.fromJson(x))),
        total: json["total"],
        start: json["start"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "subject_collection": subjectCollection.toJson(),
        "subject_collection_items":
            List<dynamic>.from(subjectCollectionItems.map((x) => x.toJson())),
        "total": total,
        "start": start,
      };
}

class SubjectCollection {
  String subjectType;
  String subtitle;
  BackgroundColorScheme backgroundColorScheme;
  String sharingTitle;
  dynamic updatedAt;
  String screenshotTitle;
  String screenshotUrl;
  int total;
  String screenshotType;
  String id;
  String name;
  bool showHeaderMask;
  String mediumName;
  dynamic badge;
  String description;
  String shortName;
  dynamic nFollowers;
  String coverUrl;
  bool showRank;
  int doneCount;
  String sharingUrl;
  int subjectCount;
  String wechatTimelineShare;
  int collectCount;
  String url;
  String uri;
  Display display;
  String iconFgImage;
  String moreDescription;
  bool showFilterPlayable;

  SubjectCollection({
    required this.subjectType,
    required this.subtitle,
    required this.backgroundColorScheme,
    required this.sharingTitle,
    required this.updatedAt,
    required this.screenshotTitle,
    required this.screenshotUrl,
    required this.total,
    required this.screenshotType,
    required this.id,
    required this.name,
    required this.showHeaderMask,
    required this.mediumName,
    required this.badge,
    required this.description,
    required this.shortName,
    required this.nFollowers,
    required this.coverUrl,
    required this.showRank,
    required this.doneCount,
    required this.sharingUrl,
    required this.subjectCount,
    required this.wechatTimelineShare,
    required this.collectCount,
    required this.url,
    required this.uri,
    required this.display,
    required this.iconFgImage,
    required this.moreDescription,
    required this.showFilterPlayable,
  });

  factory SubjectCollection.fromJson(Map<String, dynamic> json) =>
      SubjectCollection(
        subjectType: json["subject_type"],
        subtitle: json["subtitle"],
        backgroundColorScheme:
            BackgroundColorScheme.fromJson(json["background_color_scheme"]),
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
        display: Display.fromJson(json["display"]),
        iconFgImage: json["icon_fg_image"],
        moreDescription: json["more_description"],
        showFilterPlayable: json["show_filter_playable"],
      );

  Map<String, dynamic> toJson() => {
        "subject_type": subjectType,
        "subtitle": subtitle,
        "background_color_scheme": backgroundColorScheme.toJson(),
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
        "display": display.toJson(),
        "icon_fg_image": iconFgImage,
        "more_description": moreDescription,
        "show_filter_playable": showFilterPlayable,
      };
}

class BackgroundColorScheme {
  bool isDark;
  String primaryColorLight;
  String secondaryColor;
  String primaryColorDark;

  BackgroundColorScheme({
    required this.isDark,
    required this.primaryColorLight,
    required this.secondaryColor,
    required this.primaryColorDark,
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
  String layout;

  Display({
    required this.layout,
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
  Rating rating;
  Cover cover;
  List<dynamic> actions;
  String year;
  String cardSubtitle;
  String id;
  String title;
  List<Comment>? comments;
  dynamic label;
  List<String> actors;
  dynamic interest;
  Type type;
  String description;
  bool hasLinewatch;
  dynamic price;
  dynamic date;
  String info;
  RatingData? ratingData;
  String url;
  String? releaseDate;
  String? originalTitle;
  String uri;
  String subtype;
  List<String> directors;
  String reviewerName;
  String nullRatingReason;

  SubjectCollectionItem({
    required this.originalPrice,
    required this.rating,
    required this.cover,
    required this.actions,
    required this.year,
    required this.cardSubtitle,
    required this.id,
    required this.title,
    this.comments,
    required this.label,
    required this.actors,
    required this.interest,
    required this.type,
    required this.description,
    required this.hasLinewatch,
    required this.price,
    required this.date,
    required this.info,
    this.ratingData,
    required this.url,
    required this.releaseDate,
    this.originalTitle,
    required this.uri,
    required this.subtype,
    required this.directors,
    required this.reviewerName,
    required this.nullRatingReason,
  });

  factory SubjectCollectionItem.fromJson(Map<String, dynamic> json) =>
      SubjectCollectionItem(
        originalPrice: json["original_price"],
        rating: Rating.fromJson(json["rating"]),
        cover: Cover.fromJson(json["cover"]),
        actions: List<dynamic>.from(json["actions"].map((x) => x)),
        year: json["year"],
        cardSubtitle: json["card_subtitle"],
        id: json["id"],
        title: json["title"],
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
        label: json["label"],
        actors: List<String>.from(json["actors"].map((x) => x)),
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
        directors: List<String>.from(json["directors"].map((x) => x)),
        reviewerName: json["reviewer_name"],
        nullRatingReason: json["null_rating_reason"],
      );

  Map<String, dynamic> toJson() => {
        "original_price": originalPrice,
        "rating": rating.toJson(),
        "cover": cover.toJson(),
        "actions": List<dynamic>.from(actions.map((x) => x)),
        "year": year,
        "card_subtitle": cardSubtitle,
        "id": id,
        "title": title,
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "label": label,
        "actors": List<dynamic>.from(actors.map((x) => x)),
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
        "directors": List<dynamic>.from(directors.map((x) => x)),
        "reviewer_name": reviewerName,
        "null_rating_reason": nullRatingReason,
      };
}

class Comment {
  String comment;
  Rating rating;
  String sharingUrl;
  bool showTimeTip;
  bool isVoted;
  String uri;
  List<dynamic> platforms;
  int voteCount;
  DateTime createTime;
  String status;
  User user;
  String ipLocation;
  String recommendReason;
  String userDoneDesc;
  String id;
  String wechatTimelineShare;

  Comment({
    required this.comment,
    required this.rating,
    required this.sharingUrl,
    required this.showTimeTip,
    required this.isVoted,
    required this.uri,
    required this.platforms,
    required this.voteCount,
    required this.createTime,
    required this.status,
    required this.user,
    required this.ipLocation,
    required this.recommendReason,
    required this.userDoneDesc,
    required this.id,
    required this.wechatTimelineShare,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json["comment"],
        rating: Rating.fromJson(json["rating"]),
        sharingUrl: json["sharing_url"],
        showTimeTip: json["show_time_tip"],
        isVoted: json["is_voted"],
        uri: json["uri"],
        platforms: List<dynamic>.from(json["platforms"].map((x) => x)),
        voteCount: json["vote_count"],
        createTime: DateTime.parse(json["create_time"]),
        status: json["status"],
        user: User.fromJson(json["user"]),
        ipLocation: json["ip_location"],
        recommendReason: json["recommend_reason"],
        userDoneDesc: json["user_done_desc"],
        id: json["id"],
        wechatTimelineShare: json["wechat_timeline_share"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "rating": rating.toJson(),
        "sharing_url": sharingUrl,
        "show_time_tip": showTimeTip,
        "is_voted": isVoted,
        "uri": uri,
        "platforms": List<dynamic>.from(platforms.map((x) => x)),
        "vote_count": voteCount,
        "create_time": createTime.toIso8601String(),
        "status": status,
        "user": user.toJson(),
        "ip_location": ipLocation,
        "recommend_reason": recommendReason,
        "user_done_desc": userDoneDesc,
        "id": id,
        "wechat_timeline_share": wechatTimelineShare,
      };
}

class Rating {
  int count;
  int max;
  double starCount;
  double value;

  Rating({
    required this.count,
    required this.max,
    required this.starCount,
    required this.value,
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
  DateTime regTime;
  bool followed;
  String name;
  bool inBlacklist;
  String url;
  String gender;
  String uri;
  String id;
  String remark;
  String avatar;
  bool isClub;
  String type;
  String kind;
  String uid;

  User({
    required this.loc,
    required this.regTime,
    required this.followed,
    required this.name,
    required this.inBlacklist,
    required this.url,
    required this.gender,
    required this.uri,
    required this.id,
    required this.remark,
    required this.avatar,
    required this.isClub,
    required this.type,
    required this.kind,
    required this.uid,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        loc: json["loc"],
        regTime: DateTime.parse(json["reg_time"]),
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
        "reg_time": regTime.toIso8601String(),
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
  String url;
  int width;
  Shape shape;
  int height;

  Cover({
    required this.url,
    required this.width,
    required this.shape,
    required this.height,
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
  List<double> stats;
  List<TypeRank> typeRanks;

  RatingData({
    required this.stats,
    required this.typeRanks,
  });

  factory RatingData.fromJson(Map<String, dynamic> json) => RatingData(
        stats: List<double>.from(json["stats"].map((x) => x?.toDouble())),
        typeRanks: List<TypeRank>.from(
            json["type_ranks"].map((x) => TypeRank.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stats": List<dynamic>.from(stats.map((x) => x)),
        "type_ranks": List<dynamic>.from(typeRanks.map((x) => x.toJson())),
      };
}

class TypeRank {
  String type;
  double rank;

  TypeRank({
    required this.type,
    required this.rank,
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
