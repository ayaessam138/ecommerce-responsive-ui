class ProductModel {

  final String name;
  final String image;


  ProductModel({

    required this.name,
    required this.image,

  });

  // ✅ fromJson
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(

      name: json['name'] as String,
      image: json['image'] as String,

    );
  }

  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {

      'name': name,
      'image': image,

    };
  }
}
