import 'dart:io';

// soal Branching
void cekNilai(int nilai) {
  if (nilai > 70) {
    print("Nilai A");
  } else if (nilai > 40) {
    print("Nilai B");
  } else if (nilai > 0) {
    print("Nilai C");
  } else {
    print(" ");
  }
}

// looping
void looping(){
  //melakukan perulangan hingga kondisi i lebih kecil sama dengan 10
  for( int i = 1; i <=10; i++){
    print(i);
  }
}
void main() {
  //cek nilai
  print("Pengecekan Nilai");
  stdout.write("Masukkan Nilai: ");
  int nilai = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  cekNilai(nilai); //call cekNilai funtion

  print("");

  // looping
  print("Tampilkan nilai 1-10");
  looping(); //call looping funtion
}
