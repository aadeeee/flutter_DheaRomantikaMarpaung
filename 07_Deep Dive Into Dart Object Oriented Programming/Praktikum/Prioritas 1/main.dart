import 'balok.dart';
import 'kubus.dart';

void main(){
  final Balok balok = Balok(10, 5, 3);
  final Kubus kubus = Kubus(10);
  print(balok.volume());
  print(kubus.volume());
  
}