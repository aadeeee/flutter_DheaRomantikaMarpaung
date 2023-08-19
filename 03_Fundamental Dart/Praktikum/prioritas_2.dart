import 'dart:io';
import 'dart:math';

//soal no 1
class GabungString {
  String string1;
  String string2;
  String string3;
  GabungString(this.string1, this.string2, this.string3);
  //hasil penggabungan string
  result() {
    String hasil = string1 + " " + string2 + " " + string3;
    return hasil;
  }
}

//soal no 2
class Tabung {
  double jariJari;
  double tinggi;
  Tabung(this.jariJari, this.tinggi);
  //rumus volume lingkaran
  volumeTabung() {
    return pi * jariJari * jariJari * tinggi;
  }
}

void main() {
  print("***Tekan Enter jika anda tidak ingin menjalankan program***");
  //String
  inputString(String message) {
    stdout.write(message);
    return stdin.readLineSync() ?? "";
  }

  print("Hasil penggabungan string");
  var str1 = inputString("Masukkan teks 1: ");
  var str2 = inputString("Masukkan teks 2: ");
  var str3 = inputString("Masukkan teks 3: ");
  print(GabungString(str1, str2, str3).result());
  print("=========");

  // Tabung
  inputDouble(String message) {
    stdout.write(message);
    return double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
  }

  print("Tabung\n");
  var jariJari = inputDouble("Masukkan jumlah jari-jari tabung: ");
  var tinggi = inputDouble("Masukkan tinggi tabung: ");
  var soalTabung = Tabung(jariJari, tinggi).volumeTabung();
  print("Volume Tabung adalah ${soalTabung} cm");
}
