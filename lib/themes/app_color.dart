import 'package:flutter/material.dart';

class AppColor {
  // Colors
  static const Color primary = darkBlue;
  static const Color surface = lightGrey;
  static Color cardShadowColor = Colors.black.withOpacity(0.5);
  static Color white80 = Colors.white.withOpacity(0.8);
  static Color white50 = Colors.white.withOpacity(0.5);
  static Color white20 = Colors.white.withOpacity(0.2);
  static Color white10 = Colors.white.withOpacity(0.1);

  static const Color lavender = Color(0xFFDBAEFF);
  static const Color purple = Color(0xFF4C19A1);
  static Color purple10 = purple.withOpacity(0.1);

  static const Color white = Color (0xFFFFFFFF);
  static const Color grey = Color(0xFFD6DFE8);
  static const Color lightGrey = Color(0xFFEEF2F5);

  static const Color darkBlue = Color(0xFF081831);
  static Color darkBlue30 = darkBlue.withOpacity(0.3);
  static Color darkBlue50 = darkBlue.withOpacity(0.5);
  static const Color mediumBlue = Color(0xFF1D6586);

  static const Color electricGreen = Color(0xff2bffb7);
  static  Color electricGreen50 = electricGreen.withOpacity(0.5);
  static const Color green = Color(0xFF00AC73);
  static Color green20 = green.withOpacity(0.2);
  static Color green10 = green.withOpacity(0.1);

  static Color grey30 = grey.withOpacity(0.3);
  static const Color mediumGrey = Color(0xFF393939);
  static Color mediumGrey20 = mediumGrey.withOpacity(0.2);
  static Color mediumGrey50 = mediumGrey.withOpacity(0.5);
  static const Color darkGrey = Color(0xFF282828);

  static const Color cyan = Color(0xFF17A2B8);
  static const Color mediumCyan = Color(0xFF206570);
  static const Color darkCyan = Color(0xFF364446);
  static Color cyan50 = cyan.withOpacity(0.5);
  static Color cyan10 = cyan.withOpacity(0.1);


  static const cardFireFirstColor = Color(0XFFE02A02);
  static const cardFireSecondColor = Color(0XFFFFBD15);

  static const cardGrassFirstColor = Color(0XFF9EFED0);
  static const cardGrassSecondColor = Color(0XFF038E00);

  static const cardLightningFirstColor = Color(0XFFFFC700);
  static const cardLightningSecondColor = Color(0XFFFFDC5F);

  static const cardWaterFirstColor = Color(0XFFC0F6FA);
  static const cardWaterSecondColor = Color(0XFF03A4E8);

  static const cardIceFirstColor = Color(0xFFADFFF7);
  static const cardIceSecondColor = Color(0xFF3CD7C9);

  static const cardNormalFirstColor = Color(0xFFCFAE00);
  static const cardNormalSecondColor = Color(0xFFFDEBA7);

  static const cardColorlessFirstColor = Color(0XFFD3D3D3);
  static const cardColorlessSecondColor = Color(0XFFFFFFFF);

  static const cardDarknessFirstColor = Color(0XFF4A4A4A);
  static const cardDarknessSecondColor = Color(0XFF000000);

  static const cardDragonFirstColor = Color(0XFF7038F8);
  static const cardDragonSecondColor = Color(0XFF4A007F);

  static const cardFairyFirstColor = Color(0XFFFFC0CB);
  static const cardFairySecondColor = Color(0XFFF489B5);

  static const cardFightingFirstColor = Color(0XFFC03028);
  static const cardFightingSecondColor = Color(0XFF7D1F1A);

  static const cardMetalFirstColor = Color(0XFFB8B8D0);
  static const cardMetalSecondColor = Color(0XFF9090A0);

  static const cardPsychicFirstColor = Color(0XFFFF6666);
  static const cardPsychicSecondColor = Color(0XFFAA0088);


  static createGradient(List<Color> colors) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  static Shader createGradientShader(List<Color> colors) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(
      Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
    );
  }

  static createGradientFromTo(List<Color> colors , AlignmentGeometry begin , AlignmentGeometry end){
    return LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
    );
  }

  // Gradient Color
  static final Gradient greyGradient = createGradient([
    const Color(0xFFD6DFE8),
    const Color(0xFFEEF2F5),
  ]);

  static final Gradient lavanderGradient = createGradient([
    const Color(0xFFB69FF9),
    const Color(0xFFDBAEFF),
  ]);

  static final Gradient darkBlueGradient = createGradientFromTo([
    const Color(0xFF081831),
    const Color(0xFF42567B),
  ],
    const Alignment(-1, 1),
    const Alignment(1, -1)
  );
}

extension ColorExtension on Color {
  MaterialColor getMaterialColor() {
    List strengths = <double>[0.05];
    final swatch = <int, Color>{};
    final int r = red, g = green, b = blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(value, swatch);
  }
}
