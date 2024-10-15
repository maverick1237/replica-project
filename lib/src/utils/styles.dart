import 'package:flutter/material.dart';

class PillStyles {
  static final BoxDecoration pillActive = BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(24),
  );

  static final BoxDecoration pillNonActive = BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(24),
  );

  static final BoxDecoration pillDropdown = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.blueAccent, width: 1),
    borderRadius: BorderRadius.circular(24),
  );
}
