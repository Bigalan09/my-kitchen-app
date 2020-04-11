import 'dart:ui';

class Palette {
  const Palette(
      {this.primary,
      this.secondary,
      this.background,
      this.foreground,
      this.textPrimary,
      this.textSecondary,
      this.shadow,
      this.overlay,
      this.danger,
      this.darkForeground,
      this.darkForegroundText,
      this.highlight});

  final Color primary;
  final Color secondary;
  final Color background;
  final Color foreground;
  final Color textPrimary;
  final Color textSecondary;
  final Color shadow;
  final Color overlay;
  final Color danger;
  final Color darkForeground;
  final Color darkForegroundText;
  final Color highlight;
}
