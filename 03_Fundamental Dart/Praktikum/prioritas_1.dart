import 'dart:io';
import 'dart:math';
//soal no 1
class Persegi {
  double sisi;
  Persegi(this.sisi);
  //rumus luas persegi
  double luasPersegi() {
    return sisi * sisi;
  }
  //rumus keliling persegi
  double kelilingPersegi() {
    return 4 * sisi;
  }
}

class PersegiPanjang {
  double panjang;
  double lebar;

  PersegiPanjang(this.panjang, this.lebar);
  //rumus luas persegi panjang
  double luasPersegiPanjang() {
    return panjang * lebar;
  }
  //rumus keliling persegi panjang
  double kelilingPersegiPanjang() {
    return 2 * (panjang + lebar);
  }
}

//soal no 2
class Lingkaran{
  double jariJari;

  Lingkaran(this.jariJari);
  //rumus luas lingkaran
  double luasLingkaran() {
    return pi * jariJari * jariJari;
  }
  //rumus keliling lingkaran
  double kelilingLingkaran() {
    return 2 * pi * jariJari;
  }
}

void main() {
  print("***Tekan Enter jika anda tidak ingin menjalankan program***");
  double inputDouble(String message) {
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
