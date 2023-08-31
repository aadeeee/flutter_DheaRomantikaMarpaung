import 'Shape.dart';

class Rectangle implements Shape {
  int width;
  int height;
  Rectangle(this.width, this.height);

  @override
  int getArea() {
    final int luas = (width * height).toInt();
    return luas;
  }

  @override
  int getPerimeter() {
    final int keliling = ((2 * width) + (2 * height)).toInt();
    return keliling;
  }
}
