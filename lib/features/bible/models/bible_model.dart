// class to de-serialize the json data that comes from API calls
class BibleModel {
  String id;
  String name;

  BibleModel({
    this.id = '',
    this.name = '',
  });

  factory BibleModel.fromJson(Map<String, dynamic> json) => BibleModel(
        id: json['id'],
        name: json['name'],
      );

  BibleModel copyWith({
    String? id,
    String? name,
  }) =>
      BibleModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
