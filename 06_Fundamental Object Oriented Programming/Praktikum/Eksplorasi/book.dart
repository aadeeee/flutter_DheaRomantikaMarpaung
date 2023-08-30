class Buku {
  String id;
  String judul;
  String penerbit;
  int harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);

  static List<Buku> daftarBuku = [];

  static void addBook(Buku newBook) {
    bool isDuplicate = daftarBuku.any((e) {
      return e.id == newBook.id;
    });

    if (!isDuplicate) {
      daftarBuku.add(newBook);
      print("Buku dengan ID ${newBook.id} berhasil ditambahkan");
    } else {
      print("Course dengan judul ${newBook.id} sudah ada dalam daftar!");
    }
  }

  static void listBook() {
    if (daftarBuku.isNotEmpty) {
      print("${"=" * 50}\nDATA Buku Dalam Toko");
      for (var i = 0; i < daftarBuku.length; i++) {
        var data = daftarBuku[i];
        print(
            "Data ke-${i + 1}.\n- ${data.id}\n- ${data.judul}\n- ${data.penerbit}\n- Rp.${data.harga}\n- ${data.kategori}\n");
      }
    } else {
      print("Toko belum memiliki buku.");
    }
  }

  static void removeBook(Buku buku) {
    if (daftarBuku.contains(buku)) {
      daftarBuku.remove(buku);
      print("Buku dengan id '${buku.id}' berhasil dihapus!!!");
    } else {
      print("Buku dengan id '${buku.id}' tidak tersedia!!!");
    }
  }
}
