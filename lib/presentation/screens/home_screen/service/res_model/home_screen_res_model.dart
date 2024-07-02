class HomeScreenResData {
  final List<Product>? products;
  final num? total;
  final num? skip;
  final num? limit;

  HomeScreenResData({
     this.products,
     this.total,
     this.skip,
     this.limit,
  });

  factory HomeScreenResData.fromJson(Map<String, dynamic> json) {
    List<Product> productsList = (json['products'] as List)
        .map((item) => Product.fromJson(item))
        .toList();

    return HomeScreenResData(
      products: productsList,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Product {
  final num? id;
  final String? title;
  final String? description;
  final num? price;
  final num? discountPercentage;
  final num? rating;
  final num? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;

  Product({
     this.id,
     this.title,
     this.description,
     this.price,
     this.discountPercentage,
     this.rating,
     this.stock,
     this.brand,
     this.category,
     this.thumbnail,
     this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: (json['images'] as List).cast<String>(),
    );
  }
}