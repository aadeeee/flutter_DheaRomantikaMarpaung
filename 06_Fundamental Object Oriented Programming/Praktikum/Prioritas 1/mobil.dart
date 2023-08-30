import 'hewan.dart';

class Mobil {
  double kapasitas;
  List<Hewan> muatan;

  Mobil(this.kapasitas, this.muatan);

  void tambahMuatan(Hewan newdata) {
    if (newdata.berat < kapasitas) {
      muatan.add(newdata);
      kapasitas -= newdata.berat;
      print(
          "Hewan berhasil ditambahkan, dengan sisa kapasitas ${kapasitas}");
    } else {
      print("Kapasitas mobil sudah tidak mencukupi");
    }
  }

  void totalMuatan() {
    if (muatan.isNotEmpty) {
      double jumlahTotal = 0;
      print("Daftar muatan dalam mobil:");
      for (var i = 0; i < muatan.length; i++) {
        print("Data ke-${i + 1}: ${muatan[i].berat}");
        jumlahTotal += muatan[i].berat;
      }
      print("Jumlah total muatan $jumlahTotal");
    } else {
      print("Mobil tidak memiliki muatan saat ini.");
    }
  }
}
