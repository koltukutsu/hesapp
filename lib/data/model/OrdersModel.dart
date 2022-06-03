class OrdersModel {
  int id;
  String title;
  double price;
  String image;
  int quantity;
  bool selected;

  OrdersModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.quantity,
      required this.selected});
}
