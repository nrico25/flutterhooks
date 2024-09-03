import 'dart:math';

double? calculatePower(double? base, double? exponent) {
  if (base != null && exponent != null) {
    return pow(base, exponent).toDouble();
  }
  return null; 
}
