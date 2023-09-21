Summary minggu 06

Flutter Navigation

1. Navigation merupakan sebuah cara atau langkah yang wajib digunakan ketika ingin berpindah dari satu halaman ke halaman yang lain.
2. Navigator merupakan sebuah widget pada flutter yang digunakan untuk mengelola tumpukan atau stack dalam aplikasi seperti menumpuk beberapa halaman ketika menjalankan widget ini atau menghapus halaman dari tumpukan.
3. Navigator.push adalah sebuah contoh penerapan navigasi yaitu dengan melakukan perpindahan dari satu halaman ke halaman berikutnya dimana dengan menggunakan cara ini, setiap screen yang di panggil akan saling menimpa atau membuat tumpukan atau stack. Misal jika mengakses halaman a lalu kemudian masuk ke halaman b, c, d semua halaman akan di tumpuk dan jika ingin mengakses kembali halaman a, kita harus mundur satu persatu halaman. Memiliki dua parameter yakni context yang merupakan variabel BuildContext pada fungsi build dan route yang digunakan untuk menentukan ke halaman mana akan berpindah.
4. Navigator.pop merupakan navigasi yang bertujuan agar bisa mundur ke halaman sebelumnya, misal pada jika ada di halaman a,b dan c agar bisa mengakses halaman a harus menggunakan Navigator.pop() dengan parameter context.
5. Navigator.pushNamed memiliki fungsi yang sama dengan Navigator.push namun, pada penggunaan dari navigasi ini kita boleh dengan bebas menetukan nama dari halaman tujuan yang kita inginkan yaitu dengan memberikan nama dari route atau halaman tujuan dengan catatan wajib menambahkan key routes pada aplikasi kita.
