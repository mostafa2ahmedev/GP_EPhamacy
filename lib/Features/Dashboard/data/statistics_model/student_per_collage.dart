import 'package:equatable/equatable.dart';

class StudentPerCollage extends Equatable {
  final String? collage;
  final int? count;

  const StudentPerCollage({this.collage, this.count});

  factory StudentPerCollage.fromJson(Map<String, dynamic> json) {
    return StudentPerCollage(
      collage: json['collage'] as String?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'collage': collage,
        'count': count,
      };

  @override
  List<Object?> get props => [collage, count];
}
