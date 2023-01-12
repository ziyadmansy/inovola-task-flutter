import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:inovola_tech_task/modules/courses/domain_layer/entities/reserv_type_entity.dart';

class CourseDetailsEntity {
  final int id;
  final String title;
  final List<String> imgsUrl;
  final String interest;
  final double price;
  final DateTime date;
  final String address;
  final String trainerName;
  final String trainerImg;
  final String trainerInfo;
  final String occasionDetail;
  final double lat;
  final double lon;
  final bool isSold;
  final bool isPrivateEvent;
  final bool hiddenCashPayment;
  bool isLiked;
  final List<ReservationType> reserveTypes;

  CourseDetailsEntity({
    required this.id,
    required this.title,
    required this.imgsUrl,
    required this.interest,
    required this.price,
    required this.date,
    required this.address,
    required this.trainerName,
    required this.trainerImg,
    required this.trainerInfo,
    required this.occasionDetail,
    required this.lat,
    required this.lon,
    required this.isLiked,
    required this.isSold,
    required this.isPrivateEvent,
    required this.hiddenCashPayment,
    required this.reserveTypes,
  });

  void toggleLikeStatus(bool isLiked) {
    this.isLiked = isLiked;
  }

  factory CourseDetailsEntity.test() {
    return CourseDetailsEntity(
      id: 0,
      title: '',
      imgsUrl: [],
      interest: '',
      price: 0,
      date: DateTime.now(),
      address: '',
      trainerName: '',
      trainerImg: '',
      trainerInfo: '',
      occasionDetail: '',
      lat: 0.0,
      lon: 0.0,
      isLiked: true,
      isSold: true,
      isPrivateEvent: true,
      hiddenCashPayment: true,
      reserveTypes: [],
    );
  }

  CourseDetailsEntity copyWith({
    int? id,
    String? title,
    List<String>? imgsUrl,
    String? interest,
    double? price,
    DateTime? date,
    String? address,
    String? trainerName,
    String? trainerImg,
    String? trainerInfo,
    String? occasionDetail,
    double? lat,
    double? lon,
    bool? isLiked,
    bool? isSold,
    bool? isPrivateEvent,
    bool? hiddenCashPayment,
    List<ReservationType>? reserveTypes,
  }) {
    return CourseDetailsEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      imgsUrl: imgsUrl ?? this.imgsUrl,
      interest: interest ?? this.interest,
      price: price ?? this.price,
      date: date ?? this.date,
      address: address ?? this.address,
      trainerName: trainerName ?? this.trainerName,
      trainerImg: trainerImg ?? this.trainerImg,
      trainerInfo: trainerInfo ?? this.trainerInfo,
      occasionDetail: occasionDetail ?? this.occasionDetail,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      isLiked: isLiked ?? this.isLiked,
      isSold: isSold ?? this.isSold,
      isPrivateEvent: isPrivateEvent ?? this.isPrivateEvent,
      hiddenCashPayment: hiddenCashPayment ?? this.hiddenCashPayment,
      reserveTypes: reserveTypes ?? this.reserveTypes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imgsUrl': imgsUrl,
      'interest': interest,
      'price': price,
      'date': date.millisecondsSinceEpoch,
      'address': address,
      'trainerName': trainerName,
      'trainerImg': trainerImg,
      'trainerInfo': trainerInfo,
      'occasionDetail': occasionDetail,
      'lat': lat,
      'lon': lon,
      'isLiked': isLiked,
      'isSold': isSold,
      'isPrivateEvent': isPrivateEvent,
      'hiddenCashPayment': hiddenCashPayment,
      'reserveTypes': reserveTypes.map((x) => x.toMap()).toList(),
    };
  }

  factory CourseDetailsEntity.fromMap(Map<String, dynamic> map) {
    return CourseDetailsEntity(
      id: map['id'],
      title: map['title'] ?? '',
      // imgsUrl: List<String>.from(map['img']),
      imgsUrl: [
        'https://free4kwallpapers.com/uploads/originals/2015/07/22/natural-cover-facebook.jpg',
        'https://images.unsplash.com/photo-1604537529428-15bcbeecfe4d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bmF0dXJhbHxlbnwwfHwwfHw%3D&w=1000&q=80',
        'https://img.freepik.com/free-photo/beautiful-tree-middle-field-covered-with-grass-with-tree-line-background_181624-29267.jpg',
      ],
      interest: map['interest'] ?? '',
      price: double.parse(map['price'].toString()),
      date: DateTime.parse(map['date']),
      address: map['address'] ?? '',
      trainerName: map['trainerName'] ?? '',
      // trainerImg: map['trainerImg'] ?? '',
      trainerImg: 'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png',
      trainerInfo: map['trainerInfo'] ?? '',
      occasionDetail: map['occasionDetail'] ?? '',
      lat: double.parse(map['latitude'].toString()),
      lon: double.parse(map['longitude'].toString()),
      isLiked: map['isLiked'] ?? false,
      isSold: map['isSold'] ?? false,
      isPrivateEvent: map['isPrivateEvent'] ?? false,
      hiddenCashPayment: map['hiddenCashPayment'] ?? false,
      reserveTypes: List<ReservationType>.from(
        (map['reservTypes'] as List).map((x) => ReservationType.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseDetailsEntity.fromJson(String source) =>
      CourseDetailsEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseDetailsEntity(id: $id, title: $title, imgsUrl: $imgsUrl, interest: $interest, price: $price, date: $date, address: $address, trainerName: $trainerName, trainerImg: $trainerImg, trainerInfo: $trainerInfo, occasionDetail: $occasionDetail, lat: $lat, lon: $lon, isLiked: $isLiked, isSold: $isSold, isPrivateEvent: $isPrivateEvent, hiddenCashPayment: $hiddenCashPayment, reserveTypes: $reserveTypes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseDetailsEntity &&
        other.id == id &&
        other.title == title &&
        listEquals(other.imgsUrl, imgsUrl) &&
        other.interest == interest &&
        other.price == price &&
        other.date == date &&
        other.address == address &&
        other.trainerName == trainerName &&
        other.trainerImg == trainerImg &&
        other.trainerInfo == trainerInfo &&
        other.occasionDetail == occasionDetail &&
        other.lat == lat &&
        other.lon == lon &&
        other.isLiked == isLiked &&
        other.isSold == isSold &&
        other.isPrivateEvent == isPrivateEvent &&
        other.hiddenCashPayment == hiddenCashPayment &&
        listEquals(other.reserveTypes, reserveTypes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        imgsUrl.hashCode ^
        interest.hashCode ^
        price.hashCode ^
        date.hashCode ^
        address.hashCode ^
        trainerName.hashCode ^
        trainerImg.hashCode ^
        trainerInfo.hashCode ^
        occasionDetail.hashCode ^
        lat.hashCode ^
        lon.hashCode ^
        isLiked.hashCode ^
        isSold.hashCode ^
        isPrivateEvent.hashCode ^
        hiddenCashPayment.hashCode ^
        reserveTypes.hashCode;
  }
}
