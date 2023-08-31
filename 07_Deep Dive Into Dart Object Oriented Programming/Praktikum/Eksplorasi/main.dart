
import 'Circle.dart';
import 'Square.dart';
import 'Rectangle.dart';

void main(){
  final Circle circle = Circle(10);
  final Square square = Square(15);
  final Rectangle rectangle = Rectangle(2,6);

  print("Luas Lingkaran adalah ${circle.getArea()}");
  print("Keliling Lingkaran adalah ${circle.getPerimeter()}");
  

  print("Luas Persegi adalah ${square.getArea()}");
  print("Keliling Persegi adalah ${square.getPerimeter()}");

  print("Luas Persegi panjang adalah ${rectangle.getArea()}");
  print("Keliling Persegi panjang adalah ${rectangle.getPerimeter()}");
}