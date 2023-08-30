import 'book.dart';

void main() {
  Buku buku1 = Buku("P1234", "Belajar Flutter", "A", 175000, "Pemrograman");
  Buku buku2 = Buku("P7846", "Belajar Memasak", "B", 50000, "Kuliner");

  Buku.addBook(buku1);
  Buku.addBook(buku2);

  Buku.listBook();

  Buku.removeBook(buku2);

  Buku.listBook();
}
