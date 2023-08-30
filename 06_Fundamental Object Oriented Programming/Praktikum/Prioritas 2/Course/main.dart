import 'course.dart';
import 'student.dart';

void main() {
  Course course1 = Course("Flutter", "Pengembangan perangkat lunak mobile");
  Course course2 = Course("UI/UX", "Pengembangan perangkat lunak yang berfokus pada pengalaman pengguna");
  Course course3 = Course("React", "library JavaScript yang digunakan untuk membangun antarmuka pengguna (UI) yang interaktif dan dinamis");
  Course course4 = Course("Flutter", "Pengembangan perangkat lunak mobile");

  Student student = Student("Dhea", "A");
  //menambahkan course baru
  student.addCourse(course1);
  student.addCourse(course2);
  student.addCourse(course3);
  student.addCourse(course4);

  student.daftarCourse();
  
  //menghapus course
  student.removeCourse(course2);

  //melihat daftar course
  student.daftarCourse();
}
