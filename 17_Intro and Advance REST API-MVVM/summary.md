Summary Minggu 8

Introduction REST API – JSON serialization/deserialization

1. REST API (Representational State Transfer Application Programming Interface) merupakan pendekatan arsitektual untuk memisahkan tampilan dengan proses bisini sebuah yang digunakan untuk menghubungkan dan berinteraksi dengan server, dalam mneggunakan API terdapat sumber daya atau layanan yang direpresentasikan  sebagai URL dengan menggunakan HTTP.

2. Proses CRUD
    1. GET, Metode GET digunakan untuk membaca atau mengambil data yang ada di server. Permintaan yang dikirimkan oleh GET tidak mengubah atau menghapus data pada server dan bersifat idempoten, yang mana jika mengirim permintaan GET yang sama berkali-kali, data di dalam server akan tetap sama.
    2. POST, Metode POST digunakan create/membuat data baru pada server. Permintaan POST bertujuan untuk mengubah data pada server, dan setiap permintaan POST dilakukan maka akan menambahkan data yang baru pula di dalam server.
    3. PUT, Metode PUT digunakan untuk mengupdate/memperbarui data yang ada pada server atau untuk membuat data baru jika data tersebut belum ada, dan setiap permintaan PUT dilakukan maka akan melakukan proses pengubahan data yang ada di server atau menambah data jika data yang ingin di update belum ada di server.
    4. DELETE, Metode DELETE digunakan untuk menghapus data yang ada pada server. Dengan menggunakan metode delete maka akan data yang ada pada server juga akan berkurang.

3. JSON
    1. Serialisasi JSON merupakan sebuah proses mengambil data dari dalam program kemudian mengubah data tersebut menjadi format JSON. Biasanya proses  ini dilakukan ketika ingin mentransfer/mengirimkan data antara server dan klien.
    2. Deserialisasi JSON merupakan kebalikan dari serialisasi JSON, yaitu mengambil data dalam format JSON dan mengonversinya ke dalam bentuk yang dapat digunakan oleh program. 