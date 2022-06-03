
import '../../model/OrdersModel.dart';

class OrderServices{
  static List<OrdersModel> getOrderList() {
    return [
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 2,
        selected: true
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 3,
          selected: false
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 2,
          selected: false
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 1,
          selected: false
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 2,
          selected: false
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 4,
          selected: false
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 1,
          selected: false
      ),
      new OrdersModel(
        id : 1,
        title: "Mix veg Pizza",
        price: 209,
        image: "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
        quantity: 2,
          selected: false
      ),
    ];
  }
}