import 'bangunRuang.dart';

class Balok extends BangunRuang {
  //memanggil construktor dari class BangunRuang
  Balok(super.panjang, super.lebar, super.tinggi);

  @override
  volume() {
    final double volume = panjang * lebar * tinggi;
    return "Volume balok adalah $volume";
  }
}
