// class to de-serialize the json data that comes from API calls
class BibleModel {
  String? id;
  String dblId;
  String name;

  BibleModel({
    this.id,
    this.dblId = '',
    this.name = '',
  });

  factory BibleModel.fromJson(Map<String, dynamic> json) => BibleModel(
        id: json['id'],
        dblId: json['dblId'],
        name: json['name'],
      );

  BibleModel copyWith({
    String? id,
    String? dblId,
    String? name,
  }) =>
      BibleModel(
        id: id ?? this.id,
        dblId: dblId ?? this.dblId,
        name: name ?? this.name,
      );
}
