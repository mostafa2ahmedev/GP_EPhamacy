import 'package:equatable/equatable.dart';

class Sale extends Equatable {
  final int? month;
  final double? price;

  const Sale({this.month, this.price});

  factory Sale.fromJson(Map<String, dynamic> json) => Sale(
        month: json['month'] as int?,
        price: json['price'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'month': month,
        'price': price,
      };

  @override
  List<Object?> get props => [month, price];
}
