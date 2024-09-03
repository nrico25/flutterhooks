class Geometric {
  static double? calculateCubeVolume(double? side) {
    return side != null ? side * side * side : null;
  }

  static double? calculateRectangularPrismVolume(double? length, double? width, double? height) {
    return (length != null && width != null && height != null) ? length * width * height : null;
  }

  static double? calculateSphereVolume(double? radius) {
    return radius != null ? (4 / 3) * 3.14 * radius * radius * radius : null;
  }

  static double? calculateCylinderVolume(double? radius, double? height) {
    return (radius != null && height != null) ? 3.14 * radius * radius * height : null;
  }
}
