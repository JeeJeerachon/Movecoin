class ProductselectModel  {
  //F
  String itemname;
  int price, priceday;

  //M
  ProductselectModel (this.itemname, this.price, this.priceday);
  ProductselectModel .fromMap(Map<String, dynamic> map) {
    itemname = map['itemname'];
    price = map['price'];
    priceday = map['priceday'];
  }
}
