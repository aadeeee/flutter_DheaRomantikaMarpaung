import 'course.dart';

class Student {
  String nama;
  String kelas;
  List<Course> listCourse = [];
  Student(this.nama, this.kelas);

  void addCourse(Course newCourse) {
    bool isDuplicate = listCourse.any((course) {
      return course.judul == newCourse.judul;
    });

    if (!isDuplicate) {
      listCourse.add(newCourse);
      print("Course dengan judul ${newCourse.judul} berhasil ditambahkan");
    } else {
      print("Course dengan judul ${newCourse.judul} sudah ada dalam daftar!");
    }
  }

  void removeCourse(Course course) {
    if (listCourse.contains(course)) {
      listCourse.remove(course);
      print("Course dengan judul '${course.judul}' berhasil dihapus!!!");
    } else {
      print("Course dengan judul '${course.judul}' tidak tersedia!!!");
    }
  }

  void daftarCourse() {
    if (listCourse.isNotEmpty) {
      print("${"=" * 50}\nDATA SISWA\nNama : $nama\nKelas : $kelas\n");
      print("DAFTAR COURSE:");
      for (var i = 0; i < listCourse.length; i++) {
        var course = listCourse[i];
        print("${i + 1}. ${course.judul} => ${course.deskripsi}");
      }
    } else {
      print("Siswa dengan $nama belum memiliki course.");
    }
  }
}
