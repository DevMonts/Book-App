import 'package:flutter/material.dart';

class IconsConverter {
  static IconData? getIconFromString(
    String iconName,
  ) {
    final Map<String, IconData> iconMap = {
      'ac_unit': Icons.ac_unit,
      'air': Icons.air,
      'anchor': Icons.anchor,
      'brightness_3': Icons.brightness_3,
      'church': Icons.church,
      'cloud': Icons.cloud,
      'cottage': Icons.cottage,
      'deck': Icons.deck,
      'delete': Icons.delete,
      'electric_bolt': Icons.electric_bolt,
      'explore': Icons.explore,
      'favorite': Icons.favorite,
      'heart_broken': Icons.heart_broken,
      'local_fire_department': Icons.local_fire_department,
      'local_florist': Icons.local_florist,
      'local_pizza': Icons.local_pizza,
      'south_america': Icons.south_america,
      'sunny': Icons.sunny,
    };
    return iconMap[iconName];
  }
}
