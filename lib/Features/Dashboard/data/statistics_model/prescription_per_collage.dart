import 'package:equatable/equatable.dart';

class PrescriptionPerCollage extends Equatable {
	final String? collegeName;
	final int? count;

	const PrescriptionPerCollage({this.collegeName, this.count});

	factory PrescriptionPerCollage.fromJson(Map<String, dynamic> json) {
		return PrescriptionPerCollage(
			collegeName: json['collegeName'] as String?,
			count: json['count'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'collegeName': collegeName,
				'count': count,
			};

	@override
	List<Object?> get props => [collegeName, count];
}
