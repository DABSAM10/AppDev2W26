void main() {
  print(calculateArea(length: 5, width: 3.5));
  print(calculateArea(length: 4));
  print(calculateArea());
}

double calculateArea({double? length, double?  width}) {
  if (length == null && width == null) {
    return 0;
  }

  if (width == null) {
    return length! * length; // Square area
  }

  return length! * width; // Rectangle area
}