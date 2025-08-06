class RestaurantModel {
  final String name;
  final String image;
  final List<String> foodTypes;
  final double rate;
  final String deliveryFee;
  final String deliveryTime;

  RestaurantModel({
    required this.name,
    required this.image,
    required this.foodTypes,
    required this.rate,
    required this.deliveryFee,
    required this.deliveryTime,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    final rawFoodTypes = json['foodtypes'];
    List<String> parsedFoodTypes;

    if (rawFoodTypes is String) {
      parsedFoodTypes = rawFoodTypes.split(',').map((e) => e.trim()).toList();
    } else if (rawFoodTypes is List) {
      parsedFoodTypes = List<String>.from(rawFoodTypes);
    } else {
      parsedFoodTypes = [];
    }

    return RestaurantModel(
      name: json['name'] ?? 'Restaurant',
      image: json['image'] ?? '',
      foodTypes: parsedFoodTypes,
      rate: double.tryParse(json['rate'].toString()) ?? 0.0,
      deliveryFee: json['delivery_fee'] ?? '',
      deliveryTime: json['delivery_time'] ?? '',
    );
  }
}
