Summary minggu 06

Asset

1. Asset merupakan sebuah kumpulan file-file atau berkas-berkas yang di bundled dan di deployed bersamaan dengan aplikasi saat dijalankan. Berisi data-data tetap atau statis biasanya menyimpan gambar, font, JSON files, dan icons. Untuk mengakases asset wajib menambahkan atau mendefinisikan di dalam pubspec.yaml dengan mengakses lokasi path dari dari asset.
2. Image atau gambar merupakan salah satu contoh file atau berkas yang disimpan di dalam asset yang digunakan agar membuat tampilan aplikasi jauh lebih menarik, format gambar yang didukung pada flutter adalah JPEG, WebP, GIF, PNG, BMP, WBMP, Animated Web/GIF. Untuk mengakses gambar dari asset wajib memanggil fungsiImage.asset(lokasi_gambar), atau jika ingin mengakses gambar dari browser menggunakan Image.network(url_gambar).
3. Font juga merupakan salah satu file yang dapat di simpan di asset, namun penggunaan font tidak sebatas dari asset namun juga bisa menggunakan bawaan flutter atau dari google font. Jika diakses dari asset wajib atau misal menggunakan font dari google wajib menambahkan font tersebut di pubspec, kemudian jika ingin menggunakan font tersebut, hanya perlu memanggil nama dari font tersebut, jika tidak ingin menggunakan dari asset namun ingin menggunakan font google wajib menambhakan sebuah package baru yakni google_fonts.
