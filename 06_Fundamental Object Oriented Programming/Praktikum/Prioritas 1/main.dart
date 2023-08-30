import 'hewan.dart';
import 'mobil.dart';

void main(){
  Hewan hewan1 = Hewan(100);
  Hewan hewan2 = Hewan(20);
  Hewan hewan3 = Hewan(40);

  Mobil mobil = Mobil(150, []);
  mobil.tambahMuatan(hewan1);
  mobil.tambahMuatan(hewan2);
  mobil.tambahMuatan(hewan3);
  mobil.totalMuatan();
  
}