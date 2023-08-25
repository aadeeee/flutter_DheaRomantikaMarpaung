//Prioritas 1
Future<List<int>> PerkalianList(List<int> data, int number) async {
  //inisalisasi variabel result
  List<int> result = [];
  await Future.forEach(data, (index) {
    return Future.delayed(Duration(seconds: 2), () {
      var hasilPerkalian = index * number;
      result.add(hasilPerkalian);
      print(
          "Iterasi ke-${data.indexOf(index) + 1} $index x $number = $hasilPerkalian");
    });
  });
  return result;
}

void main() async {
  List<int> data = [1, 2, 3, 4, 5, 6];
  int n = 3;
  List hasil = await PerkalianList(data, n);
  print(hasil);
}