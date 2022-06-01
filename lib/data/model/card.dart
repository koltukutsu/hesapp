import 'package:equatable/equatable.dart';

enum CardBrand { mastercard, visa, americanExpress, paypal }

class Card extends Equatable {
  final String number;
  final CardBrand brand;

  const Card({
    required this.number,
    required this.brand,
  });

  @override
  String toString() {
    switch (brand) {
      case CardBrand.mastercard:
        return 'MasterCard';
      case CardBrand.visa:
        return 'Visa';
      case CardBrand.americanExpress:
        return 'American Express';
      case CardBrand.paypal:
        return 'PayPal';
    }
  }

  @override
  List<Object?> get props => [number];
}
