void duplicate() {
  //inisialisasi nilai dataDuplicate
  List<dynamic> dataDuplicate = [
    "amuse",
    "tommy kaira",
    "spoon",
    "HKS",
    "litchfield",
    "amuse",
    "HKS"
  ];
  //menghapus data duplicate
  List<dynamic> deleteDuplicate = dataDuplicate.toSet().toList();
  print(deleteDuplicate);
}

void frekuensi() {
  List<dynamic> data = [
    "js",
    "js",
    "js",
    "golang",
    "python",
    "js",
    "js",
    "golang",
    "rust"
  ];
  Map JumlahData = {};
  for (var item in data) {
    if (JumlahData.containsKey(item)) {
      JumlahData[item]++;
    } else {
      JumlahData[item] = 1;
    }
  }
  print(JumlahData.toString().substring(1, JumlahData.toString().length - 1));
}

void main() {
  // Eksploarsi 1-1
  duplicate();

  // Eksploarsi 1-2
  frekuensi();
}
