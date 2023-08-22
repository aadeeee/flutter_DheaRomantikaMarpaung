import 'dart:io';

void prima(int nilai) {
  //inisialisai nilai prima di awal sebagai true
  bool prima = true;
  // pengecekan apakah nilai i lebih kecil dibandingkan nilai inputan
  for (int i = 2; i < nilai; i++) {
    // bilangan bulat yang lebih besar dari 1 dan hanya memiliki dua faktor pembagi yang berbeda, yaitu 1 dan bilangan itu sendiri
    if (nilai % i == 0) {
      prima = false;
      break;
    }
  }
  //penecekan apakah nilai prima bernilai true atau false
  if (prima) {
    print("Bilangan prima");
  } else {
    print("Bukan bilangan prima");
  }
}

void tabelPerkalian(int nilai) {
  //inisialisasi variabel baris sebagai list kosong
  List<String> baris = [];
  //pengecekan apakah nilai i lebih kecil atau sama dengan nilai inputan
  for (int i = 1; i <= nilai; i++){
    //inisialisasi variabel yang menampung hasil perkalian dalam setiap iterasi sebagai list kosong
    List<String> hasilPerkalian = [];
    for (int j = 1; j <= nilai; j++){
      //menambahkan hasil perulangan ke dalam list hasil perkalian
      hasilPerkalian.add((i * j).toString().padLeft(2));
    }
    // menambahkan hasil perkalian ke dalam list baris
    baris.add(hasilPerkalian.join(" "));
  }
  //menampilkan hasil
  print(baris.join("\n"));
}
void main(){
  //Pengecekan bilangan prima
  print("Pengecekan bilangan prima");
  stdout.write("Masukkan Nilai: ");
  int cekAngka = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  prima(cekAngka); // call prima function

  //tabel perkalian
  print("TABEL PERKALIAN");
  stdout.write("Masukkan Nilai: ");
  int nilai = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  tabelPerkalian(nilai);// call tabelPerkalian funtion
}

