import 'package:equatable/equatable.dart';

enum CardBrand { mastercard, visa, americanExpress, paypal }

class SavedCard extends Equatable {
  final String name;
  final String number;

  const SavedCard({
    required this.name,
    required this.number,
    // required this.brand,
  });

  @override
  List<Object?> get props => [number];
}
