import 'dart:math';

import 'Shape.dart';

class Circle implements Shape {
  int radius;

  Circle(this.radius);

  @override
  int getArea() {
    final int area = (pi * radius * radius).toInt();
    return area;
  }

  @override
  int getPerimeter() {
    final int perimeter = (2 * pi * radius).toInt();
    return perimeter;
  }
}
