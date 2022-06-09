// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Country {
  final int id;
  final String name;
  final String? flag;
  final String? prefix;
  Country({
    required this.id,
    required this.name,
    this.flag,
    this.prefix,
  });

  Country copyWith({
    int? id,
    String? name,
    String? flag,
    String? prefix,
  }) {
    return Country(
      id: id ?? this.id,
      name: name ?? this.name,
      flag: flag ?? this.flag,
      prefix: prefix ?? this.prefix,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'flag': flag,
      'prefix': prefix,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['id'] as int,
      name: map['name'] as String,
      flag: map['flag'] != null ? map['flag'] as String : null,
      prefix: map['bc'] != null ? map['flag'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Country(id: $id, name: $name, flag: $flag, prefix: $prefix)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country && other.id == id && other.name == name && other.flag == flag && other.prefix == prefix;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ flag.hashCode ^ prefix.hashCode;
  }
}
