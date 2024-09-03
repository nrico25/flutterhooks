// logicBangunDatar.dart

double? calculateSquareArea(double? side) {
  if (side != null) {
    return side * side;
  }
  return null; // Return null if input is invalid
}

double? calculateRectangleArea(double? length, double? width) {
  if (length != null && width != null) {
    return length * width;
  }
  return null; // Return null if inputs are invalid
}

double? calculateTriangleArea(double? base, double? height) {
  if (base != null && height != null) {
    return 0.5 * base * height;
  }
  return null; // Return null if inputs are invalid
}
