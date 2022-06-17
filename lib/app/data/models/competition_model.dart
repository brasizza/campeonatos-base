// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'country_model.dart';

class Competition {
  final int id;
  final String link;
  final String name;
  final Country country;
  Competition({
    required this.id,
    required this.link,
    required this.name,
    required this.country,
  });

  Competition copyWith({
    int? id,
    String? link,
    String? name,
    Country? country,
  }) {
    return Competition(
      id: id ?? this.id,
      link: link ?? this.link,
      name: name ?? this.name,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'link': link,
      'name': name,
      'country': country.toMap(),
    };
  }

  factory Competition.fromMap(Map<String, dynamic> map) {
    return Competition(
      id: map['id'] as int,
      link: map['slug'] as String,
      name: map['name'] as String,
      country: Country.fromMap(map['country'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Competition.fromJson(String source) => Competition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Competition(id: $id, link: $link, name: $name, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Competition && other.id == id && other.link == link && other.name == name && other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^ link.hashCode ^ name.hashCode ^ country.hashCode;
  }
}
