import 'matematika.dart';

class KelipatanPersekutuanTerkecil implements Matematika {
  final int x;
  final int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  hasil() {
    int kpk;
    int faktor;

    if (x == 0 || y == 0) {
      kpk = 0;
    } else {
      if (x > y) {
        faktor = x;
      } else {
        faktor = y;
      }

      while (true) {
        if (faktor % x == 0 && faktor % y == 0) {
          kpk = faktor;
          break;
        }
        faktor += (x > y) ? x : y;
      }
    }
    return "KPK dari $x dan $y adalah $kpk";
  }
}
