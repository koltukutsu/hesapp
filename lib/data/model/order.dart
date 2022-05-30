import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final String user;
  final String place;
  final String date;
  final String sum;

  const Order({
    required this.id,
    required this.user,
    required this.place,
    required this.date,
    required this.sum,
  });

  @override
  List<Object?> get props => [id, user, place, date, sum];
}
