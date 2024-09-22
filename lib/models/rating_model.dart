class RatingModel {
  RatingModel({
    // required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(json) {
    return RatingModel(
      // rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      count: json['count'],
    );
  }

  // final double rate;
  final int count;
}
