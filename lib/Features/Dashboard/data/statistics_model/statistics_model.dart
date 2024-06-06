import 'package:equatable/equatable.dart';

import 'prescription_per_collage.dart';
import 'sale.dart';
import 'student_per_collage.dart';

class StatisticsModel extends Equatable {
	final int? studentCount;
	final int? prescriptionCount;
	final int? runningOut;
	final int? aboutToExpire;
	final List<StudentPerCollage>? studentPerCollage;
	final List<PrescriptionPerCollage>? prescriptionPerCollage;
	final List<Sale>? sales;

	const StatisticsModel({
		this.studentCount, 
		this.prescriptionCount, 
		this.runningOut, 
		this.aboutToExpire, 
		this.studentPerCollage, 
		this.prescriptionPerCollage, 
		this.sales, 
	});

	factory StatisticsModel.fromJson(Map<String, dynamic> json) {
		return StatisticsModel(
			studentCount: json['studentCount'] as int?,
			prescriptionCount: json['prescriptionCount'] as int?,
			runningOut: json['runningOut'] as int?,
			aboutToExpire: json['aboutToExpire'] as int?,
			studentPerCollage: (json['studentPerCollage'] as List<dynamic>?)
						?.map((e) => StudentPerCollage.fromJson(e as Map<String, dynamic>))
						.toList(),
			prescriptionPerCollage: (json['prescriptionPerCollage'] as List<dynamic>?)
						?.map((e) => PrescriptionPerCollage.fromJson(e as Map<String, dynamic>))
						.toList(),
			sales: (json['sales'] as List<dynamic>?)
						?.map((e) => Sale.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'studentCount': studentCount,
				'prescriptionCount': prescriptionCount,
				'runningOut': runningOut,
				'aboutToExpire': aboutToExpire,
				'studentPerCollage': studentPerCollage?.map((e) => e.toJson()).toList(),
				'prescriptionPerCollage': prescriptionPerCollage?.map((e) => e.toJson()).toList(),
				'sales': sales?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props {
		return [
				studentCount,
				prescriptionCount,
				runningOut,
				aboutToExpire,
				studentPerCollage,
				prescriptionPerCollage,
				sales,
		];
	}
}
