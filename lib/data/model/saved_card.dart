import 'package:equatable/equatable.dart';

enum CardBrand { mastercard, visa, americanExpress, paypal }

class SavedCard extends Equatable {
  final String name;
  final String number;
  final CardBrand brand;

  const SavedCard({
    required this.name,
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
