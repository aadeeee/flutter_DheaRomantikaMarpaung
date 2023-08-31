import 'bangunRuang.dart';

class Kubus extends BangunRuang {
  double sisi;

  //memanggil construktor dari class BangunRuang
  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  volume() {
    final double volume = sisi * sisi * sisi;
    return "Volume Kubus adalah $volume";
  }
}
