import 'package:get/get.dart';
import 'package:student_details_getx/models.dart/students_model.dart';

class StudentsController extends GetxController {
  var students = <StudentsClass>[].obs;
  void addStudents(StudentsClass student) {
    students.add(student);
  }
}
