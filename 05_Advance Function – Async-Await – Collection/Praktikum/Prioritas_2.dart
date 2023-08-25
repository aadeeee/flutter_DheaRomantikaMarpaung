// Prioritas 2 -1
void listToMap() {
  //List dengan sub elemen
  List<List<String>> hasilList = [
    ['Materi 1', "Flutter"],
    ['Materi 2', "React JS"],
    ['Materi 3', "Golang"],
    ['Materi 4', "UI/UX"],
    ['Materi 5', "QA"],
  ];
  //insialisasi varaibel hasilMap
  Map<String, String> hasilMap = {};

  int index = 0;
  while (index < hasilList.length) {
    hasilMap[hasilList[index][0]] = hasilList[index][1];
    index++;
  }
  //menampilan hasil map
  print(hasilMap);
}

// Prioritas 2-2
void rangeNilai() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];
  int totalNilai = 0;
  var jumlahData = nilai.length;
  for (var i in nilai) {
    totalNilai += i; //totalNilai + i
  }
  print((totalNilai / jumlahData).ceil());
}

// Prioritas 2-3
Future<BigInt> faktorial(int nilai) async {
  //inisialisasi variabel bernilai 1
  BigInt hasilFaktorial = BigInt.one;

  if (nilai > 1) {
    for (int i = 1; i < nilai; i++) {
      hasilFaktorial *= BigInt.from(i);
      await Future.delayed(Duration(milliseconds: 1500));
      print(
          "($hasilFaktorial x ${i + 1}): ${hasilFaktorial * BigInt.from(i + 1)}");
    }
    hasilFaktorial *= BigInt.from(nilai);
  } else if (nilai < 1) {
    print("Nilai harus lebih besar atau sama dengan 1");
  }
  return hasilFaktorial;
}

void main() async {
  //soal Prioritas 2-1
  listToMap();

  // Prioritas 2 -2
  rangeNilai();

  // Prioritas 2 -3
  int nilai = 5;
  BigInt nilaiFaktorial = await faktorial(nilai);
  print("faktorial dari $nilai: $nilaiFaktorial");
}
