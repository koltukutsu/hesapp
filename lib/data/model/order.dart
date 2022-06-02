import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String place;
  final String date;
  final String sum;

  const Order({
    required this.place,
    required this.date,
    required this.sum,
  });

  @override
  List<Object?> get props => [place, date, sum];
}
