class CardItem {
  String itemCategoryName;
  String itemId;
  String itemName;
  num itemPrice;
  String itemUrl;
  num noInStock;
  num quantity;
  CardItem(
      {this.quantity,
      this.itemCategoryName,
      this.itemId,
      this.itemName,
      this.itemPrice,
      this.itemUrl,
      this.noInStock});
}
