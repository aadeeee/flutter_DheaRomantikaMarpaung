import 'faktorPersekutuanTerbesar.dart';
import 'faktorPersekutuanTerkecil.dart';

void main() {
  final KelipatanPersekutuanTerkecil kpk = KelipatanPersekutuanTerkecil(8, 6);
  final KelipatanPersekutuanTerbesar fpb = KelipatanPersekutuanTerbesar(12, 18);
  print(kpk.hasil());
  print(fpb.hasil());
}


