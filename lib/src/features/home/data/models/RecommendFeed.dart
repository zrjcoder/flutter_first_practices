// To parse this JSON data, do
//
//     final recommendFeed = recommendFeedFromJson(jsonString);

import 'dart:convert';

RecommendFeed recommendFeedFromJson(String str) =>
    RecommendFeed.fromJson(json.decode(str));

String recommendFeedToJson(RecommendFeed data) => json.encode(data.toJson());

class RecommendFeed {
  int? count;
  List<Item>? items;
  String? toast;
  int? newItemCount;
  int? start;

  RecommendFeed({
    this.count,
    this.items,
    this.toast,
    this.newItemCount,
    this.start,
  });

  factory RecommendFeed.fromJson(Map<String, dynamic> json) => RecommendFeed(
        count: json["count"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        toast: json["toast"],
        newItemCount: json["new_item_count"],
        start: json["start"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "toast": toast,
        "new_item_count": newItemCount,
        "start": start,
      };
}

class Item {
  String? uid;
  bool? showActions;
  ItemTopic? topic;
  dynamic createdTime;
  dynamic actionInfo;
  int? collectionsCount;
  int? resharesCount;
  Owner? owner;
  bool? isGray;
  String? id;
  int? layout;
  List<dynamic>? comments;
  Content? content;
  bool? isCollected;
  String? typeCn;
  String? type;
  int? reactionType;
  RecReasonInfo? recReasonInfo;
  RecInfo? recInfo;
  RecommendInfo? recommendInfo;
  String? sharingUrl;
  dynamic resharer;
  String? url;
  String? uri;
  String? foldKey;
  int? reactionsCount;
  int? commentsCount;
  dynamic ownerAlterLabel;
  dynamic adInfo;

  Item({
    this.uid,
    this.showActions,
    this.topic,
    this.createdTime,
    this.actionInfo,
    this.collectionsCount,
    this.resharesCount,
    this.owner,
    this.isGray,
    this.id,
    this.layout,
    this.comments,
    this.content,
    this.isCollected,
    this.typeCn,
    this.type,
    this.reactionType,
    this.recReasonInfo,
    this.recInfo,
    this.recommendInfo,
    this.sharingUrl,
    this.resharer,
    this.url,
    this.uri,
    this.foldKey,
    this.reactionsCount,
    this.commentsCount,
    this.ownerAlterLabel,
    this.adInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        uid: json["uid"],
        showActions: json["show_actions"],
        topic: json["topic"] == null ? null : ItemTopic.fromJson(json["topic"]),
        createdTime: json["created_time"],
        actionInfo: json["action_info"],
        collectionsCount: json["collections_count"],
        resharesCount: json["reshares_count"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        isGray: json["is_gray"],
        id: json["id"],
        layout: json["layout"],
        comments: json["comments"] == null
            ? []
            : List<dynamic>.from(json["comments"]!.map((x) => x)),
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        isCollected: json["is_collected"],
        typeCn: json["type_cn"],
        type: json["type"],
        reactionType: json["reaction_type"],
        recReasonInfo: json["rec_reason_info"] == null
            ? null
            : RecReasonInfo.fromJson(json["rec_reason_info"]),
        recInfo: json["rec_info"] == null
            ? null
            : RecInfo.fromJson(json["rec_info"]),
        recommendInfo: json["recommend_info"] == null
            ? null
            : RecommendInfo.fromJson(json["recommend_info"]),
        sharingUrl: json["sharing_url"],
        resharer: json["resharer"],
        url: json["url"],
        uri: json["uri"],
        foldKey: json["fold_key"],
        reactionsCount: json["reactions_count"],
        commentsCount: json["comments_count"],
        ownerAlterLabel: json["owner_alter_label"],
        adInfo: json["ad_info"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "show_actions": showActions,
        "topic": topic?.toJson(),
        "created_time": createdTime,
        "action_info": actionInfo,
        "collections_count": collectionsCount,
        "reshares_count": resharesCount,
        "owner": owner?.toJson(),
        "is_gray": isGray,
        "id": id,
        "layout": layout,
        "comments":
            comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
        "content": content?.toJson(),
        "is_collected": isCollected,
        "type_cn": typeCn,
        "type": type,
        "reaction_type": reactionType,
        "rec_reason_info": recReasonInfo?.toJson(),
        "rec_info": recInfo?.toJson(),
        "recommend_info": recommendInfo?.toJson(),
        "sharing_url": sharingUrl,
        "resharer": resharer,
        "url": url,
        "uri": uri,
        "fold_key": foldKey,
        "reactions_count": reactionsCount,
        "comments_count": commentsCount,
        "owner_alter_label": ownerAlterLabel,
        "ad_info": adInfo,
      };
}

class Content {
  Status? status;
  List<dynamic>? abstractEntities;
  int? photosCount;
  dynamic rating;
  ContentAuthor? author;
  String? url;
  String? contentAbstract;
  String? title;
  String? uri;
  List<dynamic>? photos;
  dynamic videoInfo;
  String? originalAbstract;
  dynamic card;
  String? type;
  String? id;
  ArticleSubjects? articleSubjects;

  Content({
    this.status,
    this.abstractEntities,
    this.photosCount,
    this.rating,
    this.author,
    this.url,
    this.contentAbstract,
    this.title,
    this.uri,
    this.photos,
    this.videoInfo,
    this.originalAbstract,
    this.card,
    this.type,
    this.id,
    this.articleSubjects,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        abstractEntities: json["abstract_entities"] == null
            ? []
            : List<dynamic>.from(json["abstract_entities"]!.map((x) => x)),
        photosCount: json["photos_count"],
        rating: json["rating"],
        author: json["author"] == null
            ? null
            : ContentAuthor.fromJson(json["author"]),
        url: json["url"],
        contentAbstract: json["abstract"],
        title: json["title"],
        uri: json["uri"],
        photos: json["photos"] == null
            ? []
            : List<dynamic>.from(json["photos"]!.map((x) => x)),
        videoInfo: json["video_info"],
        originalAbstract: json["original_abstract"],
        card: json["card"],
        type: json["type"],
        id: json["id"],
        articleSubjects: json["article_subjects"] == null
            ? null
            : ArticleSubjects.fromJson(json["article_subjects"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "abstract_entities": abstractEntities == null
            ? []
            : List<dynamic>.from(abstractEntities!.map((x) => x)),
        "photos_count": photosCount,
        "rating": rating,
        "author": author?.toJson(),
        "url": url,
        "abstract": contentAbstract,
        "title": title,
        "uri": uri,
        "photos":
            photos == null ? [] : List<dynamic>.from(photos!.map((x) => x)),
        "video_info": videoInfo,
        "original_abstract": originalAbstract,
        "card": card,
        "type": type,
        "id": id,
        "article_subjects": articleSubjects?.toJson(),
      };
}

class ArticleSubjects {
  ArticleSubjects();

  factory ArticleSubjects.fromJson(Map<String, dynamic> json) =>
      ArticleSubjects();

  Map<String, dynamic> toJson() => {};
}

class ContentAuthor {
  Loc? loc;
  String? kind;
  String? name;
  String? url;
  String? gender;
  String? authorAbstract;
  String? uri;
  String? avatar;
  bool? isClub;
  String? type;
  String? id;
  String? uid;

  ContentAuthor({
    this.loc,
    this.kind,
    this.name,
    this.url,
    this.gender,
    this.authorAbstract,
    this.uri,
    this.avatar,
    this.isClub,
    this.type,
    this.id,
    this.uid,
  });

  factory ContentAuthor.fromJson(Map<String, dynamic> json) => ContentAuthor(
        loc: json["loc"] == null ? null : Loc.fromJson(json["loc"]),
        kind: json["kind"],
        name: json["name"],
        url: json["url"],
        gender: json["gender"],
        authorAbstract: json["abstract"],
        uri: json["uri"],
        avatar: json["avatar"],
        isClub: json["is_club"],
        type: json["type"],
        id: json["id"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "loc": loc?.toJson(),
        "kind": kind,
        "name": name,
        "url": url,
        "gender": gender,
        "abstract": authorAbstract,
        "uri": uri,
        "avatar": avatar,
        "is_club": isClub,
        "type": type,
        "id": id,
        "uid": uid,
      };
}

class Loc {
  String? id;
  String? name;
  String? uid;

  Loc({
    this.id,
    this.name,
    this.uid,
  });

  factory Loc.fromJson(Map<String, dynamic> json) => Loc(
        id: json["id"],
        name: json["name"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "uid": uid,
      };
}

class Status {
  bool? liked;
  String? replyLimit;
  String? text;
  String? screenshotTitle;
  bool? isEditable;
  String? screenshotUrl;
  bool? isSubscription;
  List<dynamic>? images;
  int? resharesCount;
  String? screenshotType;
  String? id;
  String? editBuyFeatureUri;
  StatusAuthor? author;
  String? subscriptionText;
  String? miniProgramCoverUrl;
  List<dynamic>? entities;
  int? reactionsCount;
  bool? canTransferReplyLimit;
  dynamic resharedStatus;
  String? type;
  bool? forbidReshareAndComment;
  int? reactionType;
  String? miniProgramName;
  int? resharersCount;
  DateTime? editTime;
  bool? hasRelatedContents;
  bool? isPrivate;
  String? sharingUrl;
  dynamic card;
  StatusTopic? topic;
  String? reshareId;
  String? wechatTimelineShare;
  String? title;
  int? likeCount;
  String? uri;
  List<dynamic>? noticeInfos;
  String? miniProgramPage;
  dynamic parentStatus;
  dynamic videoInfo;
  DateTime? createTime;
  int? commentsCount;
  String? activity;
  bool? isStatusAd;
  bool? canTransferAccessible;

  Status({
    this.liked,
    this.replyLimit,
    this.text,
    this.screenshotTitle,
    this.isEditable,
    this.screenshotUrl,
    this.isSubscription,
    this.images,
    this.resharesCount,
    this.screenshotType,
    this.id,
    this.editBuyFeatureUri,
    this.author,
    this.subscriptionText,
    this.miniProgramCoverUrl,
    this.entities,
    this.reactionsCount,
    this.canTransferReplyLimit,
    this.resharedStatus,
    this.type,
    this.forbidReshareAndComment,
    this.reactionType,
    this.miniProgramName,
    this.resharersCount,
    this.editTime,
    this.hasRelatedContents,
    this.isPrivate,
    this.sharingUrl,
    this.card,
    this.topic,
    this.reshareId,
    this.wechatTimelineShare,
    this.title,
    this.likeCount,
    this.uri,
    this.noticeInfos,
    this.miniProgramPage,
    this.parentStatus,
    this.videoInfo,
    this.createTime,
    this.commentsCount,
    this.activity,
    this.isStatusAd,
    this.canTransferAccessible,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        liked: json["liked"],
        replyLimit: json["reply_limit"],
        text: json["text"],
        screenshotTitle: json["screenshot_title"],
        isEditable: json["is_editable"],
        screenshotUrl: json["screenshot_url"],
        isSubscription: json["is_subscription"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        resharesCount: json["reshares_count"],
        screenshotType: json["screenshot_type"],
        id: json["id"],
        editBuyFeatureUri: json["edit_buy_feature_uri"],
        author: json["author"] == null
            ? null
            : StatusAuthor.fromJson(json["author"]),
        subscriptionText: json["subscription_text"],
        miniProgramCoverUrl: json["mini_program_cover_url"],
        entities: json["entities"] == null
            ? []
            : List<dynamic>.from(json["entities"]!.map((x) => x)),
        reactionsCount: json["reactions_count"],
        canTransferReplyLimit: json["can_transfer_reply_limit"],
        resharedStatus: json["reshared_status"],
        type: json["type"],
        forbidReshareAndComment: json["forbid_reshare_and_comment"],
        reactionType: json["reaction_type"],
        miniProgramName: json["mini_program_name"],
        resharersCount: json["resharers_count"],
        editTime: json["edit_time"] == null
            ? null
            : DateTime.parse(json["edit_time"]),
        hasRelatedContents: json["has_related_contents"],
        isPrivate: json["is_private"],
        sharingUrl: json["sharing_url"],
        card: json["card"],
        topic:
            json["topic"] == null ? null : StatusTopic.fromJson(json["topic"]),
        reshareId: json["reshare_id"],
        wechatTimelineShare: json["wechat_timeline_share"],
        title: json["title"],
        likeCount: json["like_count"],
        uri: json["uri"],
        noticeInfos: json["notice_infos"] == null
            ? []
            : List<dynamic>.from(json["notice_infos"]!.map((x) => x)),
        miniProgramPage: json["mini_program_page"],
        parentStatus: json["parent_status"],
        videoInfo: json["video_info"],
        createTime: json["create_time"] == null
            ? null
            : DateTime.parse(json["create_time"]),
        commentsCount: json["comments_count"],
        activity: json["activity"],
        isStatusAd: json["is_status_ad"],
        canTransferAccessible: json["can_transfer_accessible"],
      );

  Map<String, dynamic> toJson() => {
        "liked": liked,
        "reply_limit": replyLimit,
        "text": text,
        "screenshot_title": screenshotTitle,
        "is_editable": isEditable,
        "screenshot_url": screenshotUrl,
        "is_subscription": isSubscription,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "reshares_count": resharesCount,
        "screenshot_type": screenshotType,
        "id": id,
        "edit_buy_feature_uri": editBuyFeatureUri,
        "author": author?.toJson(),
        "subscription_text": subscriptionText,
        "mini_program_cover_url": miniProgramCoverUrl,
        "entities":
            entities == null ? [] : List<dynamic>.from(entities!.map((x) => x)),
        "reactions_count": reactionsCount,
        "can_transfer_reply_limit": canTransferReplyLimit,
        "reshared_status": resharedStatus,
        "type": type,
        "forbid_reshare_and_comment": forbidReshareAndComment,
        "reaction_type": reactionType,
        "mini_program_name": miniProgramName,
        "resharers_count": resharersCount,
        "edit_time": editTime?.toIso8601String(),
        "has_related_contents": hasRelatedContents,
        "is_private": isPrivate,
        "sharing_url": sharingUrl,
        "card": card,
        "topic": topic?.toJson(),
        "reshare_id": reshareId,
        "wechat_timeline_share": wechatTimelineShare,
        "title": title,
        "like_count": likeCount,
        "uri": uri,
        "notice_infos": noticeInfos == null
            ? []
            : List<dynamic>.from(noticeInfos!.map((x) => x)),
        "mini_program_page": miniProgramPage,
        "parent_status": parentStatus,
        "video_info": videoInfo,
        "create_time": createTime?.toIso8601String(),
        "comments_count": commentsCount,
        "activity": activity,
        "is_status_ad": isStatusAd,
        "can_transfer_accessible": canTransferAccessible,
      };
}

class StatusAuthor {
  Loc? loc;
  String? kind;
  String? name;
  int? avatarSideIconType;
  String? url;
  int? verifyType;
  String? id;
  DateTime? regTime;
  String? uri;
  String? avatarSideIconId;
  String? avatar;
  bool? isClub;
  String? type;
  String? avatarSideIcon;
  String? uid;

  StatusAuthor({
    this.loc,
    this.kind,
    this.name,
    this.avatarSideIconType,
    this.url,
    this.verifyType,
    this.id,
    this.regTime,
    this.uri,
    this.avatarSideIconId,
    this.avatar,
    this.isClub,
    this.type,
    this.avatarSideIcon,
    this.uid,
  });

  factory StatusAuthor.fromJson(Map<String, dynamic> json) => StatusAuthor(
        loc: json["loc"] == null ? null : Loc.fromJson(json["loc"]),
        kind: json["kind"],
        name: json["name"],
        avatarSideIconType: json["avatar_side_icon_type"],
        url: json["url"],
        verifyType: json["verify_type"],
        id: json["id"],
        regTime:
            json["reg_time"] == null ? null : DateTime.parse(json["reg_time"]),
        uri: json["uri"],
        avatarSideIconId: json["avatar_side_icon_id"],
        avatar: json["avatar"],
        isClub: json["is_club"],
        type: json["type"],
        avatarSideIcon: json["avatar_side_icon"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "loc": loc?.toJson(),
        "kind": kind,
        "name": name,
        "avatar_side_icon_type": avatarSideIconType,
        "url": url,
        "verify_type": verifyType,
        "id": id,
        "reg_time": regTime?.toIso8601String(),
        "uri": uri,
        "avatar_side_icon_id": avatarSideIconId,
        "avatar": avatar,
        "is_club": isClub,
        "type": type,
        "avatar_side_icon": avatarSideIcon,
        "uid": uid,
      };
}

class StatusTopic {
  String? topicLabelBgImg;
  String? name;
  String? title;
  String? url;
  List<dynamic>? clickTrackUrls;
  dynamic tailIcon;
  String? uri;
  String? postTemplateUrl;
  String? id;
  String? topicIcon;
  String? topicLabelColorType;
  bool? isPersonal;
  int? contentType;
  bool? isPublic;
  String? cardSubtitle;
  bool? isReadCheckin;
  List<dynamic>? adMonitorUrls;
  String? topicIconLarge;
  String? type;
  bool? isAd;
  String? sharingUrl;

  StatusTopic({
    this.topicLabelBgImg,
    this.name,
    this.title,
    this.url,
    this.clickTrackUrls,
    this.tailIcon,
    this.uri,
    this.postTemplateUrl,
    this.id,
    this.topicIcon,
    this.topicLabelColorType,
    this.isPersonal,
    this.contentType,
    this.isPublic,
    this.cardSubtitle,
    this.isReadCheckin,
    this.adMonitorUrls,
    this.topicIconLarge,
    this.type,
    this.isAd,
    this.sharingUrl,
  });

  factory StatusTopic.fromJson(Map<String, dynamic> json) => StatusTopic(
        topicLabelBgImg: json["topic_label_bg_img"],
        name: json["name"],
        title: json["title"],
        url: json["url"],
        clickTrackUrls: json["click_track_urls"] == null
            ? []
            : List<dynamic>.from(json["click_track_urls"]!.map((x) => x)),
        tailIcon: json["tail_icon"],
        uri: json["uri"],
        postTemplateUrl: json["post_template_url"],
        id: json["id"],
        topicIcon: json["topic_icon"],
        topicLabelColorType: json["topic_label_color_type"],
        isPersonal: json["is_personal"],
        contentType: json["content_type"],
        isPublic: json["is_public"],
        cardSubtitle: json["card_subtitle"],
        isReadCheckin: json["is_read_checkin"],
        adMonitorUrls: json["ad_monitor_urls"] == null
            ? []
            : List<dynamic>.from(json["ad_monitor_urls"]!.map((x) => x)),
        topicIconLarge: json["topic_icon_large"],
        type: json["type"],
        isAd: json["is_ad"],
        sharingUrl: json["sharing_url"],
      );

  Map<String, dynamic> toJson() => {
        "topic_label_bg_img": topicLabelBgImg,
        "name": name,
        "title": title,
        "url": url,
        "click_track_urls": clickTrackUrls == null
            ? []
            : List<dynamic>.from(clickTrackUrls!.map((x) => x)),
        "tail_icon": tailIcon,
        "uri": uri,
        "post_template_url": postTemplateUrl,
        "id": id,
        "topic_icon": topicIcon,
        "topic_label_color_type": topicLabelColorType,
        "is_personal": isPersonal,
        "content_type": contentType,
        "is_public": isPublic,
        "card_subtitle": cardSubtitle,
        "is_read_checkin": isReadCheckin,
        "ad_monitor_urls": adMonitorUrls == null
            ? []
            : List<dynamic>.from(adMonitorUrls!.map((x) => x)),
        "topic_icon_large": topicIconLarge,
        "type": type,
        "is_ad": isAd,
        "sharing_url": sharingUrl,
      };
}

class Owner {
  String? eventLabel;
  bool? isRectAvatar;
  String? url;
  int? verifyType;
  String? uri;
  String? avatar;
  String? type;
  String? id;
  String? name;

  Owner({
    this.eventLabel,
    this.isRectAvatar,
    this.url,
    this.verifyType,
    this.uri,
    this.avatar,
    this.type,
    this.id,
    this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        eventLabel: json["event_label"],
        isRectAvatar: json["is_rect_avatar"],
        url: json["url"],
        verifyType: json["verify_type"],
        uri: json["uri"],
        avatar: json["avatar"],
        type: json["type"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "event_label": eventLabel,
        "is_rect_avatar": isRectAvatar,
        "url": url,
        "verify_type": verifyType,
        "uri": uri,
        "avatar": avatar,
        "type": type,
        "id": id,
        "name": name,
      };
}

class RecInfo {
  String? source;
  AppEventSupplementaryInfo? appEventSupplementaryInfo;
  List<Tag>? tags;

  RecInfo({
    this.source,
    this.appEventSupplementaryInfo,
    this.tags,
  });

  factory RecInfo.fromJson(Map<String, dynamic> json) => RecInfo(
        source: json["source"],
        appEventSupplementaryInfo: json["app_event_supplementary_info"] == null
            ? null
            : AppEventSupplementaryInfo.fromJson(
                json["app_event_supplementary_info"]),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "app_event_supplementary_info": appEventSupplementaryInfo?.toJson(),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
      };
}

class AppEventSupplementaryInfo {
  String? reqId;
  String? algStrategy;
  String? keyword;

  AppEventSupplementaryInfo({
    this.reqId,
    this.algStrategy,
    this.keyword,
  });

  factory AppEventSupplementaryInfo.fromJson(Map<String, dynamic> json) =>
      AppEventSupplementaryInfo(
        reqId: json["req_id"],
        algStrategy: json["alg_strategy"],
        keyword: json["keyword"],
      );

  Map<String, dynamic> toJson() => {
        "req_id": reqId,
        "alg_strategy": algStrategy,
        "keyword": keyword,
      };
}

class Tag {
  String? type;
  String? id;
  String? title;

  Tag({
    this.type,
    this.id,
    this.title,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        type: json["type"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "title": title,
      };
}

class RecReasonInfo {
  String? text;
  String? uri;
  String? icon;

  RecReasonInfo({
    this.text,
    this.uri,
    this.icon,
  });

  factory RecReasonInfo.fromJson(Map<String, dynamic> json) => RecReasonInfo(
        text: json["text"],
        uri: json["uri"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "uri": uri,
        "icon": icon,
      };
}

class RecommendInfo {
  String? text;
  String? uri;

  RecommendInfo({
    this.text,
    this.uri,
  });

  factory RecommendInfo.fromJson(Map<String, dynamic> json) => RecommendInfo(
        text: json["text"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "uri": uri,
      };
}

class ItemTopic {
  String? topicLabelBgImg;
  String? name;
  String? topicIconLarge;
  String? url;
  String? uri;
  String? topicIcon;
  String? topicLabelColorType;
  bool? isPersonal;
  String? type;
  String? id;

  ItemTopic({
    this.topicLabelBgImg,
    this.name,
    this.topicIconLarge,
    this.url,
    this.uri,
    this.topicIcon,
    this.topicLabelColorType,
    this.isPersonal,
    this.type,
    this.id,
  });

  factory ItemTopic.fromJson(Map<String, dynamic> json) => ItemTopic(
        topicLabelBgImg: json["topic_label_bg_img"],
        name: json["name"],
        topicIconLarge: json["topic_icon_large"],
        url: json["url"],
        uri: json["uri"],
        topicIcon: json["topic_icon"],
        topicLabelColorType: json["topic_label_color_type"],
        isPersonal: json["is_personal"],
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "topic_label_bg_img": topicLabelBgImg,
        "name": name,
        "topic_icon_large": topicIconLarge,
        "url": url,
        "uri": uri,
        "topic_icon": topicIcon,
        "topic_label_color_type": topicLabelColorType,
        "is_personal": isPersonal,
        "type": type,
        "id": id,
      };
}
