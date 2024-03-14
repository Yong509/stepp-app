import 'package:json_annotation/json_annotation.dart';

part 'stepp_place_feed_response.g.dart';

@JsonSerializable()
class SteppPlaceFeedResponse {
  @JsonKey(name: "data")
  final Feed feed;

  SteppPlaceFeedResponse({
    required this.feed,
  });

  factory SteppPlaceFeedResponse.fromJson(Map<String, dynamic> json) => _$SteppPlaceFeedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SteppPlaceFeedResponseToJson(this);
}

@JsonSerializable()
class Feed {
  @JsonKey(name: "post_id")
  final int postId;
  @JsonKey(name: "original")
  final Original original;
  @JsonKey(name: "owner")
  final Owner owner;
  @JsonKey(name: "cover_url")
  final String coverUrl;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "caption")
  final String caption;
  @JsonKey(name: "like_count")
  final int likeCount;

  Feed({
    required this.postId,
    required this.original,
    required this.owner,
    required this.coverUrl,
    required this.createdAt,
    required this.caption,
    required this.likeCount,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}

@JsonSerializable()
class Original {
  @JsonKey(name: "original_id")
  final int originalId;
  @JsonKey(name: "owner")
  final Owner owner;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "location")
  final Location location;
  @JsonKey(name: "total_stepp")
  final int totalStepp;
  @JsonKey(name: "stepp_count")
  final int steppCount;
  @JsonKey(name: "original_post_id")
  final int originalPostId;

  Original({
    required this.originalId,
    required this.owner,
    required this.name,
    required this.location,
    required this.totalStepp,
    required this.steppCount,
    required this.originalPostId,
  });

  factory Original.fromJson(Map<String, dynamic> json) => _$OriginalFromJson(json);

  Map<String, dynamic> toJson() => _$OriginalToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: "location_id")
  final int locationId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "geo_point")
  final String geoPoint;
  @JsonKey(name: "stepp_count")
  final int steppCount;

  Location({
    required this.locationId,
    required this.name,
    required this.geoPoint,
    required this.steppCount,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Owner {
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "profile_img_url")
  final String profileImgUrl;

  Owner({
    required this.userId,
    required this.name,
    required this.profileImgUrl,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
