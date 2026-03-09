import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_details_getx/models.dart/students_model.dart';

class StudentsController extends GetxController {
  final Box<StudentsClass> studentsBox =
      Hive.box<StudentsClass>('students_box');
  var students = <StudentsClass>[].obs;
  var viewStudents = false.obs;
  var searchQuery = ''.obs;
  @override
  void onInit() {
    students.value = studentsBox.values.toList();
    super.onInit();
  }

  void addStudents(StudentsClass student) {
    studentsBox.add(student);
    students.add(student);
  }

  void deleteStudentsProfile(int index) {
    studentsBox.deleteAt(index);
    students.removeAt(index);
  }

  StudentsClass fetchData(int index) {
    return students[index];
  }

  void updateStudentsDetails(int index, StudentsClass curStud) {
    studentsBox.put(index, curStud);
    students[index] = curStud;
  }

  void searchStudents(String query) {
    searchQuery.value = query;
  }

  List<StudentsClass> get filteredStudents {
    if (searchQuery.value.isEmpty) {
      return students;
    }
    return students.where((child) {
      final name = child.studentsName!.toLowerCase();
      final id = child.studentsId!.toLowerCase();
      final search = searchQuery.value.toLowerCase();
      return name.contains(search) || id.contains(search);
    }).toList();
  }
}
