import 'package:hive/hive.dart';
part 'item_model.g.dart';
@HiveType(typeId: 0)
class ItemModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;

  ItemModel({required this.subtitle, required this.title});
}