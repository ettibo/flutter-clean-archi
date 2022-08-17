extension IsStringNumeric on String {
  bool isNumeric() {
    return double.tryParse(this) != null;
  }
}

extension IsOptionalStringNumeric on String? {
  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null;
  }
}
