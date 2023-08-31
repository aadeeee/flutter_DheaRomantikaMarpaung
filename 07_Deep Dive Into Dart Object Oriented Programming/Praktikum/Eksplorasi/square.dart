import 'Shape.dart';

class Square implements Shape {
  int side;
  Square(this.side);
  @override
  int getArea() {
    final int luas = (2 * side).toInt();
    return luas;
  }

  @override
  int getPerimeter() {
    final int keliling = (4 * side).toInt();
    return keliling;
  }
}
