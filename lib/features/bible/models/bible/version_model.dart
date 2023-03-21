class VersionModel {
  String bibleId; //472735b48a27b402-01
  String? bibleVersion; //The NKJV version

  VersionModel({
    required this.bibleId,
    this.bibleVersion,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
        bibleId: json['id'],
        bibleVersion: json['name'],
      );

  VersionModel copyWith({
    String? bibleId,
    String? bibleVersion,
  }) =>
      VersionModel(
        bibleId: bibleId ?? this.bibleId,
        bibleVersion: bibleVersion ?? this.bibleVersion,
      );
}
