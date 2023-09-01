import 'matematika.dart';

class KelipatanPersekutuanTerbesar implements Matematika {
 final int x;
 final int y;

  KelipatanPersekutuanTerbesar(this.x, this.y);

  @override
  hasil() {
    List<int> faktorx = [];
    List<int> faktory = [];
    int? fpb;

    // Mencari bilangan faktor bilangan x
    for (int i = 1; i <= x; i++) {
      if (x % i == 0) {
        faktorx.add(i);
      }
    }

    // Mencari bilangan faktor bilangan y
    for (int i = 1; i <= y; i++) {
      if (y % i == 0) {
        faktory.add(i);
      }
    }

    // Jika salah satu bilangan bernilai 0
    if (x == 0) {
      fpb = y;
    } else if (y == 0) {
      fpb = x;
    } else if (x != 0 && y != 0) {
      for (int i = faktorx.length - 1; i >= 0; i--) {
        if (faktory.contains(faktorx[i])) {
          fpb = faktorx[i];
          break;
        }
      }
    } else {
      fpb = 0;
    }
    return "FPB dari $x dan $y adalah $fpb";
  }
}
