import 'dart:io';
import 'dart:math';
//soal no 1
class Persegi {
  double sisi;
  Persegi(this.sisi);
  //rumus luas persegi
   luasPersegi() {
    return sisi * sisi;
  }
  //rumus keliling persegi
  kelilingPersegi() {
    return 4 * sisi;
  }
}

class PersegiPanjang {
  double panjang;
  double lebar;

  PersegiPanjang(this.panjang, this.lebar);
  //rumus luas persegi panjang
   luasPersegiPanjang() {
    return panjang * lebar;
  }
  //rumus keliling persegi panjang
   kelilingPersegiPanjang() {
    return 2 * (panjang + lebar);
  }
}

//soal no 2
class Lingkaran{
  double jariJari;

  Lingkaran(this.jariJari);
  //rumus luas lingkaran
   luasLingkaran() {
    return pi * jariJari * jariJari;
  }
  //rumus keliling lingkaran
 kelilingLingkaran() {
    return 2 * pi * jariJari;
  }
}

void main() {
  print("***Tekan Enter jika anda tidak ingin menjalankan program***");
   inputDouble(String message) {
    stdout.write(message);
    return double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
  }

  // Persegi
  print("Persegi\n");
  var sisi = inputDouble("Masukkan jumlah sisi Persegi: ");
  var soalPersegi = Persegi(sisi);
  print("Luas Persegi adalah ${soalPersegi.luasPersegi()} cm");
  print("Keliling Persegi adalah ${soalPersegi.kelilingPersegi()} cm");
  print("====================================\n");

  //Persegi Panjang
  print("Persegi Panjang\n");
  var panjang = inputDouble("Masukkan Panjang Persegi Panjang: ");
  var lebar = inputDouble("Masukkan lebar Persegi Panjang: ");
  var soalPersegiPanjang = PersegiPanjang(panjang, lebar);
  print("Luas Persegi Panjang adalah ${soalPersegiPanjang.luasPersegiPanjang()} cm");
  print("Keliling Persegi Panjang adalah ${soalPersegiPanjang.kelilingPersegiPanjang()} cm");
  print("====================================");

  //Lingkaran
  print("Lingkaran\n");
  var r = inputDouble("Masukkan jumlah jari-jari lingkaran: ");
  var soalLingkaran = Lingkaran(r);
  print("Luas Lingkaran adalah ${soalLingkaran.luasLingkaran()} cm\nKeliling Lingkaran adalah ${soalLingkaran.kelilingLingkaran()} cm");
  

}
