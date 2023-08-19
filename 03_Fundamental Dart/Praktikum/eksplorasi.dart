import 'dart:io';

// soal no 1
class Palindrom {
  String text;
  Palindrom(this.text);

  palindromTrue() {
    text = text.toLowerCase();
    return text == text.split("").reversed.join("");
  }
}

//soal no 2
class FaktorBilangan {
  int angka;
  FaktorBilangan(this.angka);

  faktorBilangan() {
    List bilangan = [];
    for (int i = 1; i <= angka; i++) {
      if (angka % i == 0) {
        bilangan.add(i);
      }
    }
    return bilangan;
  }
}

void main() {
  // cek palindrom
  inputString(String message) {
    stdout.write(message);
    return stdin.readLineSync() ?? "";
  }

  var kata = inputString("Masukkan kata untuk di cek: ");
  var cekPalindrom = Palindrom(kata).palindromTrue();
  if (cekPalindrom) {
    print("Palindrom");
  } else {
    print("Bukan Palindrom");
  }

  //Faktor bilangan
  inputInt(String message) {
    stdout.write(message);
    return int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  }

  var inputAngka = inputInt("Masukkan angka: ");
  var hasilFaktor = FaktorBilangan(inputAngka).faktorBilangan();
  for (int i in hasilFaktor) {
    print(i);
  }
}
