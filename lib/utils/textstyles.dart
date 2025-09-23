import 'package:flutter/material.dart';

// This file defines text styles that automatically adapt to the app's theme
// (light or dark mode) for consistent typography.
class AppTextStyles {
  // Base text styles that define font size, family, and weight.
  // The colors are deliberately omitted here and will be applied dynamically.

  static const TextStyle _heading1Base = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _heading2Base = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _subheadingBase = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _bodyBase = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle _buttonBase = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _captionBase = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // Methods to get theme-aware text styles.
  // Use these methods to ensure colors adapt to light and dark modes.

  /// Style for the largest headings, adapting to the theme's primary color.
  static TextStyle heading1(BuildContext context) {
    return _heading1Base.copyWith(color: Theme.of(context).colorScheme.primary);
  }

  /// Style for secondary headings, adapting to the theme's onSurface color.
  static TextStyle heading2(BuildContext context) {
    return _heading2Base.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  /// Style for subheadings, using a slightly more muted text color.
  static TextStyle subheading(BuildContext context) {
    return _subheadingBase.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  /// Style for general body text.
  static TextStyle body(BuildContext context) {
    return _bodyBase.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }

  /// Style for text on buttons, ensuring high contrast against the button's background.
  static TextStyle button(BuildContext context) {
    return _buttonBase.copyWith(color: Theme.of(context).colorScheme.onPrimary);
  }

  /// Style for small, secondary text like captions.
  static TextStyle caption(BuildContext context) {
    return _captionBase.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}
