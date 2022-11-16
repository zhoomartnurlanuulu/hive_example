import 'package:hive_flutter/hive_flutter.dart';

part 'gadget_model.g.dart';

@HiveType(typeId: 0)
class GadgetModel extends HiveObject {
  @HiveField(0)
  String brand;
  @HiveField(1)
  String model;
  @HiveField(2)
  String type;
  @HiveField(3)
  String price;

  GadgetModel({
    this.brand = '',
    this.model = '',
    this.type = '',
    this.price = '',
  });
}
