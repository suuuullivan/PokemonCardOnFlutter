import 'package:flutter/material.dart';

import '../../themes/app_color.dart';
import '../../data/models/pokemon_card.dart';

class CardTypeGradient {
  final String typeName;
  final Color colorStart;
  final Color colorEnd;

  const CardTypeGradient({
    required this.typeName,
    required this.colorStart,
    required this.colorEnd,
  });
}

class CardTypeGradients {
  static const List<CardTypeGradient> gradients = [
    CardTypeGradient(
      typeName: 'Colorless',
      colorStart: AppColor.cardColorlessFirstColor,
      colorEnd: AppColor.cardColorlessSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Darkness',
      colorStart: AppColor.cardDarknessFirstColor,
      colorEnd: AppColor.cardDarknessSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Dragon',
      colorStart: AppColor.cardDragonFirstColor,
      colorEnd: AppColor.cardDragonSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Fairy',
      colorStart: AppColor.cardFairyFirstColor,
      colorEnd: AppColor.cardFairySecondColor,
    ),
    CardTypeGradient(
      typeName: 'Fighting',
      colorStart: AppColor.cardFightingFirstColor,
      colorEnd: AppColor.cardFightingSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Fire',
      colorStart: AppColor.cardFireFirstColor,
      colorEnd: AppColor.cardFireSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Grass',
      colorStart: AppColor.cardGrassFirstColor,
      colorEnd: AppColor.cardGrassSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Lightning',
      colorStart: AppColor.cardLightningFirstColor,
      colorEnd: AppColor.cardLightningSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Metal',
      colorStart: AppColor.cardMetalFirstColor,
      colorEnd: AppColor.cardMetalSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Psychic',
      colorStart: AppColor.cardPsychicFirstColor,
      colorEnd: AppColor.cardPsychicSecondColor,
    ),
    CardTypeGradient(
      typeName: 'Water',
      colorStart: AppColor.cardWaterFirstColor,
      colorEnd: AppColor.cardWaterSecondColor,
    ),
  ];

  static CardTypeGradient findGradient(String typeName) {
    return gradients.firstWhere(
          (gradient) => gradient.typeName == typeName,
    );
  }
}