import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class TrekPointFeature extends DataWithUUID {
  final String name;
  final IconData icon;

  TrekPointFeature({
    required this.name,
    required this.icon,
    super.id,
  });

  static TrekPointFeature phone =
      TrekPointFeature(name: 'Телефон', icon: Icons.phone, id: 'phone');

  static TrekPointFeature lodge =
      TrekPointFeature(name: 'Ночевка', icon: Icons.bungalow, id: 'lodge');

  static TrekPointFeature photoPoint = TrekPointFeature(
      name: 'Фото', icon: Icons.photo_camera, id: 'photoPoint');

  static TrekPointFeature shop = TrekPointFeature(
      name: 'Магазин', icon: Icons.shopping_basket, id: 'shop');

  static TrekPointFeature eatery =
      TrekPointFeature(name: 'Питание', icon: Icons.restaurant, id: 'eatery');

  static TrekPointFeature transport = TrekPointFeature(
      name: 'Транспорт', icon: Icons.airport_shuttle, id: 'transport');

  static final Map<String, TrekPointFeature> _values = {
    phone.id: phone,
    lodge.id: lodge,
    shop.id: shop,
    eatery.id: eatery,
    transport.id: transport,
  };

  static List<TrekPointFeature> get values => _values.values.toList();

  static TrekPointFeature getById(String id) => _values[id]!;

  String toJson() => id;

  factory TrekPointFeature.fromJson(json) => getById(json);
}
