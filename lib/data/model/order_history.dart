import 'package:equatable/equatable.dart';

class OrderHistory extends Equatable {
  final String place;
  final String date;
  final String sum;

  const OrderHistory({
    required this.place,
    required this.date,
    required this.sum,
  });

  @override
  List<Object?> get props => [place, date, sum];
}
