import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_details_getx/controller/class_controller.dart';

class GridViewSection extends StatefulWidget {
  const GridViewSection({super.key, required this.studentsCtrl});
  final StudentsController studentsCtrl;
  @override
  State<GridViewSection> createState() => _GridViewSectionState();
}

class _GridViewSectionState extends State<GridViewSection> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.studentsCtrl.students.isEmpty) {
        return const Center(
          child: Text('No Students Details Available'),
        );
      }
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 15 / 15,
          ),
          itemCount: widget.studentsCtrl.students.length,
          itemBuilder: (context, index) {
            final data = widget.studentsCtrl.students[index];
            return Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 0.5),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            // child: Column(
            //   children: [
            //     data.image != null? 
            //   ],
            // ),
            );
          });
    });
  }
}
