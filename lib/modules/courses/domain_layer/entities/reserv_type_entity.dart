import 'dart:convert';

class ReservationType {
  final int id;
  final String name;
  final int count;
  final double price;

  ReservationType({
    required this.id,
    required this.name,
    required this.count,
    required this.price,
  });

  ReservationType copyWith({
    int? id,
    String? name,
    int? count,
    double? price,
  }) {
    return ReservationType(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'count': count,
      'price': price,
    };
  }

  factory ReservationType.fromMap(Map<String, dynamic> map) {
    return ReservationType(
      id: map['id'],
      name: map['name'] ?? '',
      count: map['count'],
      price: double.parse(map['price'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationType.fromJson(String source) =>
      ReservationType.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReservationType(id: $id, name: $name, count: $count, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReservationType &&
        other.id == id &&
        other.name == name &&
        other.count == count &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ count.hashCode ^ price.hashCode;
  }
}
