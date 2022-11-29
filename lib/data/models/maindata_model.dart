// To parse this JSON data, do
//
//     final mainData = mainDataFromJson(jsonString);

import 'dart:convert';

MainData mainDataFromJson(String str) => MainData.fromJson(json.decode(str));

String mainDataToJson(MainData data) => json.encode(data.toJson());

class MainData {
  MainData({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory MainData.fromJson(Map<String, dynamic> json) => MainData(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.properties,
    this.count,
    this.propertyIds,
  });

  final List<Property>? properties;
  final int? count;
  final List<int>? propertyIds;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        properties: List<Property>.from(
            json["properties"].map((x) => Property.fromJson(x))),
        count: json["count"],
        propertyIds: List<int>.from(json["property_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "properties": List<dynamic>.from(properties!.map((x) => x.toJson())),
        "count": count,
        "property_ids": List<dynamic>.from(propertyIds!.map((x) => x)),
      };
}

class Property {
  Property({
    this.id,
    this.liked = false,
    this.userId,
    this.addressStreetName,
    this.addressArea,
    this.addressCity,
    this.addressPostcode,
    this.addressCountry,
    this.addressCityCode,
    this.addressCountryCode,
    this.latitude,
    this.longitude,
    this.propertyType,
    this.listingType,
    this.roomType,
    this.monthlyPrice,
    this.personPrice,
    this.bedrooms,
    this.bathrooms,
    this.moveInDate,
    this.lengthOfStay,
    this.type,
    this.isSuitableForStudent,
    this.depositAmount,
    this.currentFlatmates,
    this.flatmateGender,
    this.floorPlan,
    this.description,
    this.slug,
    this.nearestLatitude,
    this.nearestLongitude,
    this.nearestLocation,
    this.nearestLocationTime,
    this.nearestLocationType,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.propertyUrl,
    this.status,
    this.isFreeToContact,
    this.freeToContact,
    this.freeWithinDays,
    this.user,
    this.propertyVideos,
    this.propertyImages,
    this.propertyFloorPlans,
    this.keyFeatures,
  });

  final int? id;
  late bool liked;
  final int? userId;
  final String? addressStreetName;
  final String? addressArea;
  final String? addressCity;
  final String? addressPostcode;
  final dynamic addressCountry;
  final dynamic addressCityCode;
  final String? addressCountryCode;
  final double? latitude;
  final double? longitude;
  final String? propertyType;
  final String? listingType;
  final String? roomType;
  final int? monthlyPrice;
  final int? personPrice;
  final int? bedrooms;
  final int? bathrooms;
  final String? moveInDate;
  final String? lengthOfStay;
  final String? type;
  final int? isSuitableForStudent;
  final int? depositAmount;
  final int? currentFlatmates;
  final dynamic flatmateGender;
  final dynamic floorPlan;
  final String? description;
  final String? slug;
  final double? nearestLatitude;
  final double? nearestLongitude;
  final String? nearestLocation;
  final String? nearestLocationTime;
  final String? nearestLocationType;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? propertyUrl;
  final String? status;
  final bool? isFreeToContact;
  final String? freeToContact;
  final String? freeWithinDays;
  final User? user;
  final List<PropertyImageElement>? propertyVideos;
  final List<PropertyImageElement>? propertyImages;
  final List<dynamic>? propertyFloorPlans;
  final List<KeyFeature>? keyFeatures;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        userId: json["user_id"],
        addressStreetName: json["address_street_name"],
        addressArea: json["address_area"],
        addressCity: json["address_city"],
        addressPostcode: json["address_postcode"],
        addressCountry: json["address_country"],
        addressCityCode: json["address_city_code"],
        addressCountryCode: json["address_country_code"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        propertyType: json["property_type"],
        listingType: json["listing_type"],
        roomType: json["room_type"] == null ? null : json["room_type"],
        monthlyPrice: json["monthly_price"],
        personPrice: json["person_price"],
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        moveInDate: json["move_in_date"],
        lengthOfStay: json["length_of_stay"],
        type: json["type"],
        isSuitableForStudent: json["is_suitable_for_student"],
        depositAmount: json["deposit_amount"],
        currentFlatmates: json["current_flatmates"] == null
            ? null
            : json["current_flatmates"],
        flatmateGender: json["flatmate_gender"],
        floorPlan: json["floor_plan"],
        description: json["description"],
        slug: json["slug"],
        nearestLatitude: json["nearest_latitude"].toDouble(),
        nearestLongitude: json["nearest_longitude"].toDouble(),
        nearestLocation: json["nearest_location"],
        nearestLocationTime: json["nearest_location_time"],
        nearestLocationType: json["nearest_location_type"] == null
            ? null
            : json["nearest_location_type"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        propertyUrl: json["property_url"],
        status: json["status"],
        isFreeToContact: json["is_free_to_contact"],
        freeToContact: json["free_to_contact"],
        freeWithinDays: json["free_within_days"],
        user: User.fromJson(json["user"]),
        propertyVideos: List<PropertyImageElement>.from(json["property_videos"]
            .map((x) => PropertyImageElement.fromJson(x))),
        propertyImages: List<PropertyImageElement>.from(json["property_images"]
            .map((x) => PropertyImageElement.fromJson(x))),
        propertyFloorPlans:
            List<dynamic>.from(json["property_floor_plans"].map((x) => x)),
        keyFeatures: List<KeyFeature>.from(
            json["key_features"].map((x) => KeyFeature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "address_street_name": addressStreetName,
        "address_area": addressArea,
        "address_city": addressCity,
        "address_postcode": addressPostcode,
        "address_country": addressCountry,
        "address_city_code": addressCityCode,
        "address_country_code": addressCountryCode,
        "latitude": latitude,
        "longitude": longitude,
        "property_type": propertyType,
        "listing_type": listingType,
        "room_type": roomType == null ? null : roomType,
        "monthly_price": monthlyPrice,
        "person_price": personPrice,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "move_in_date": moveInDate,
        "length_of_stay": lengthOfStay,
        "type": type,
        "is_suitable_for_student": isSuitableForStudent,
        "deposit_amount": depositAmount,
        "current_flatmates": currentFlatmates == null ? null : currentFlatmates,
        "flatmate_gender": flatmateGender,
        "floor_plan": floorPlan,
        "description": description,
        "slug": slug,
        "nearest_latitude": nearestLatitude,
        "nearest_longitude": nearestLongitude,
        "nearest_location": nearestLocation,
        "nearest_location_time": nearestLocationTime,
        "nearest_location_type":
            nearestLocationType == null ? null : nearestLocationType,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "property_url": propertyUrl,
        "status": status,
        "is_free_to_contact": isFreeToContact,
        "free_to_contact": freeToContact,
        "free_within_days": freeWithinDays,
        "user": user?.toJson(),
        "property_videos":
            List<dynamic>.from(propertyVideos!.map((x) => x.toJson())),
        "property_images":
            List<dynamic>.from(propertyImages!.map((x) => x.toJson())),
        "property_floor_plans":
            List<dynamic>.from(propertyFloorPlans!.map((x) => x)),
        "key_features": List<dynamic>.from(keyFeatures!.map((x) => x.toJson())),
      };
}

class KeyFeature {
  KeyFeature({
    this.id,
    this.type,
    this.name,
    this.darkIcon,
    this.colorIcon,
    this.darkIconUrl,
    this.colorIconUrl,
    this.pivot,
  });

  final int? id;
  final KeyFeatureType? type;
  final String? name;
  final String? darkIcon;
  final String? colorIcon;
  final String? darkIconUrl;
  final String? colorIconUrl;
  final Pivot? pivot;

  factory KeyFeature.fromJson(Map<String, dynamic> json) => KeyFeature(
        id: json["id"],
        type: keyFeatureTypeValues.map[json["type"]],
        name: json["name"],
        darkIcon: json["dark_icon"],
        colorIcon: json["color_icon"],
        darkIconUrl: json["dark_icon_url"],
        colorIconUrl: json["color_icon_url"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": keyFeatureTypeValues.reverse[type],
        "name": name,
        "dark_icon": darkIcon,
        "color_icon": colorIcon,
        "dark_icon_url": darkIconUrl,
        "color_icon_url": colorIconUrl,
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  Pivot({
    this.propertyId,
    this.keyFeatureId,
  });

  final int? propertyId;
  final int? keyFeatureId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        propertyId: json["property_id"],
        keyFeatureId: json["key_feature_id"],
      );

  Map<String, dynamic> toJson() => {
        "property_id": propertyId,
        "key_feature_id": keyFeatureId,
      };
}

enum KeyFeatureType { FEATURE }

final keyFeatureTypeValues =
    EnumValues({"feature": KeyFeatureType.FEATURE}, {});

class PropertyImageElement {
  PropertyImageElement({
    this.id,
    this.userId,
    this.propertyId,
    this.path,
    this.type,
    this.thumbnail,
  });

  final int? id;
  final int? userId;
  final int? propertyId;
  final String? path;
  final PropertyImageType? type;
  final String? thumbnail;

  factory PropertyImageElement.fromJson(Map<String, dynamic> json) =>
      PropertyImageElement(
        id: json["id"],
        userId: json["user_id"],
        propertyId: json["property_id"],
        path: json["path"],
        type: propertyImageTypeValues.map[json["type"]],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "property_id": propertyId,
        "path": path,
        "type": propertyImageTypeValues.reverse[type],
        "thumbnail": thumbnail,
      };
}

enum PropertyImageType { IMAGE, VIDEO }

final propertyImageTypeValues = EnumValues(
    {"image": PropertyImageType.IMAGE, "video": PropertyImageType.VIDEO}, {});

class User {
  User({
    this.id,
    this.profileImage,
    this.name,
    this.profileImageUrl,
  });

  final int? id;
  final String? profileImage;
  final String? name;
  final String? profileImageUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        name: json["name"],
        profileImageUrl: json["profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profile_image": profileImage == null ? null : profileImage,
        "name": name,
        "profile_image_url": profileImageUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map, this.reverseMap);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
