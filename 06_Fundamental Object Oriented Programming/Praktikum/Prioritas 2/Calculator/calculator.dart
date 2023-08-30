class Calculator {
  int bil1;
  int bil2;

  Calculator(this.bil1, this.bil2);

  void penjumlahan() {
    int hasil = bil1 + bil2;
    print("Hasil penjumlahan adalah $hasil");
  }

  void pengurangan() {
    int hasil = bil1 - bil2;
    print("Hasil penjumlahan adalah $hasil");
  }

  void perkalian() {
    int hasil = bil1 * bil2;
    print("Hasil penjumlahan adalah $hasil");
  }

  void pembagian() {
    double hasil = bil1 / bil2;
    print("Hasil penjumlahan adalah $hasil");
  }
}