// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stepp_place_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteppPlaceFeedResponse _$SteppPlaceFeedResponseFromJson(
        Map<String, dynamic> json) =>
    SteppPlaceFeedResponse(
      feed: (json['data'] as List<dynamic>)
          .map((e) => Feed.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SteppPlaceFeedResponseToJson(
        SteppPlaceFeedResponse instance) =>
    <String, dynamic>{
      'data': instance.feed,
    };

Feed _$FeedFromJson(Map<String, dynamic> json) => Feed(
      postId: json['post_id'] as int,
      original: Original.fromJson(json['original'] as Map<String, dynamic>),
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      coverUrl: json['cover_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      caption: json['caption'] as String,
      likeCount: json['like_count'] as int,
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'post_id': instance.postId,
      'original': instance.original,
      'owner': instance.owner,
      'cover_url': instance.coverUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'caption': instance.caption,
      'like_count': instance.likeCount,
    };

Original _$OriginalFromJson(Map<String, dynamic> json) => Original(
      originalId: json['original_id'] as int,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      name: json['name'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      totalStepp: json['total_stepp'] as int,
      steppCount: json['stepp_count'] as int,
      originalPostId: json['original_post_id'] as int,
    );

Map<String, dynamic> _$OriginalToJson(Original instance) => <String, dynamic>{
      'original_id': instance.originalId,
      'owner': instance.owner,
      'name': instance.name,
      'location': instance.location,
      'total_stepp': instance.totalStepp,
      'stepp_count': instance.steppCount,
      'original_post_id': instance.originalPostId,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      locationId: json['location_id'] as int,
      name: json['name'] as String,
      geoPoint: json['geo_point'] as String,
      steppCount: json['stepp_count'] as int,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'location_id': instance.locationId,
      'name': instance.name,
      'geo_point': instance.geoPoint,
      'stepp_count': instance.steppCount,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      userId: json['user_id'] as int,
      name: json['name'] as String,
      profileImgUrl: json['profile_img_url'] as String,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'profile_img_url': instance.profileImgUrl,
    };
