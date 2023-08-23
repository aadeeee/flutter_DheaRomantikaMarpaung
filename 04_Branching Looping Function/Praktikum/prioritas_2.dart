import 'dart:io';
import 'dart:math';

void piramid(int nilai) {
  for (int i = 0; i < nilai; i++) {
    //jumlah spasi yang akan di cetak setiap iterasinya
    for (int j = 0; j < nilai - i -1; j++) {
      //menampilkan spasi
      stdout.write("  ");
    }
    //pola bintang 1 3 5
    for (int k = 0; k < (2 * i + 1); k++) {
      //menampilkan * sesuai pola
      stdout.write("* ");
    }
    //masuk ke baris baru setiap satu iterasi selesai
    print("");
  }
}

void jamPasir(int nilai) {
  //segitiga bagian atas
  for (int i = 0; i < nilai; i++) {
    //jumlah spasi yang akan di cetak setiap iterasinya
    for (int j = 0; j < i; j++) {
      //menampilkan spasi
      stdout.write(" ");
    }
    for (int k = 0; k < 2 * (nilai - i) - 1; k++) {
      //menampilkan angka 0
      stdout.write("0");
    }
    //masuk ke baris baru setiap satu iterasi selesai
    print(" ");
  }
  //Segitiga bagian bawah
  for (int i = nilai - 2; i >= 0; i--) {
    for (int j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (int k = 0; k < 2 * (nilai - i) - 1; k++) {
      //menampilkan angka 0
      stdout.write("0");
    }
    //masuk ke baris baru setiap satu iterasi selesai
    print(" ");
  }
}

void faktorial(int nilai) {
  //mengembalikan nilai 1 jika tidak memenuhi kondisi
  BigInt faktorial = BigInt.one;
  //cek apakah nilai > 1
  if (nilai > 1) {
    for (int i = 1; i <= nilai; i++) {
      //menyimpan hasil perkalian kedalam variabel faktorial
      faktorial *= BigInt.from(i);
    }
  }
  //menampilkan faktorial
  print(faktorial);
}

void luasLingkaran(int r) {
  //rumus luas lingkaran pi*r*r
  var hasil = pi * r * r;
  //menampilkan hasil
  print(hasil);
}

void main() {
  //piramida bintang
  print("Piramida Bintang");
  stdout.write("Masukkan nilai: ");
  int jlhBintang = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  piramid(jlhBintang); //call piramid function

  // jam pasir
  print("Jam Pasir");
  stdout.write("Masukkan nilai: ");
  int jlhAngka0 = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  jamPasir(jlhAngka0); //call jamPasir function

  //Faktorial
  print("Hasil Faktorial");
  stdout.write("Masukkan nilai: ");
  int angkaFaktorial = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  faktorial(angkaFaktorial); // call faktorial funtion

  // Lingkaran
  print("Luas Lingkaran");
  stdout.write("Masukkan nilai: ");
  int jari_jari = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  luasLingkaran(jari_jari); // call luasLingkaran funtion
}
