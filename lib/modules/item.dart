import './review.dart';

class Item {
  String id, categoryName, name, brand, sellerId;
  int offer = 0, numberInStock, numberOfReviews;
  double itemQuantity;
  double price;
  double rate;
  bool inStock;
  Map<String, String> specs = {};
  List<Review> reviews = [];
  List<String> photosUrl = [];

  Item(
      {this.id,
      this.itemQuantity,
      this.brand,
      this.categoryName,
      this.inStock,
      this.name,
      this.numberInStock,
      this.numberOfReviews,
      this.offer,
      this.photosUrl,
      this.price,
      this.rate,
      this.reviews,
      this.sellerId,
      this.specs});

  double newPrice() => price * (100 - offer) / 100;

  double starClac() {
    double sum = 0;
    for (var n in reviews) {
      sum += n.numberOfStars;
    }
    return sum / reviews.length;
  }

  bool isInStock() {
    return numberInStock > 0;
  }
}
