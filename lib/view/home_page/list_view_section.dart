import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_details_getx/controller/class_controller.dart';

class ListViewSection extends StatefulWidget {
  const ListViewSection({super.key, required this.studentsCtrl});
  final StudentsController studentsCtrl;
  @override
  State<ListViewSection> createState() => _ListViewSectionState();
}

class _ListViewSectionState extends State<ListViewSection> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.studentsCtrl.students.isEmpty) {
        return const Center(
          child: Text('No Students Details Available'),
        );
      }
      return ListView.builder(
        itemBuilder: (context, index) {
          final data = widget.studentsCtrl.students[index];
          return Card(
            child: ListTile(
              leading: data.image != null
                  ? CircleAvatar(
                      radius: 30,
                      backgroundImage: MemoryImage(data.image!),
                    )
                  : const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
              title: Text(data.studentsName ?? 'Unknown'),
              subtitle: Text(data.studentsId ?? 'Unknown'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ),
          );
        },
        itemCount: widget.studentsCtrl.students.length,
      );
    });
  }
}
