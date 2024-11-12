import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/constants/colors.dart';
import 'package:notes_app/widgets/toast.dart';

import '../controller/note_controller.dart';

class AddNewNotePage extends StatelessWidget {
  final NoteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.titleController.text = "";
    controller.contentController.text = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Note",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFF2EC4B6),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: [
              TextField(
                controller: controller.titleController,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: "Heading",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.hintColor,
                  ),
                  border: InputBorder.none,
                ),
                autofocus: true,
              ),
              TextField(
                style: const TextStyle(
                  fontSize: 16,
                ),
                controller: controller.contentController,
                decoration: const InputDecoration(
                  hintText: "Type your note...",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: AppColor.hintColor,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.titleController.text.isEmpty) {
            showToast(message: "Note title is empty");
          } else if (controller.contentController.text.isEmpty) {
            showToast(message: "Note description is empty");
          } else {
            controller.addNoteToDatabase();
          }
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
         backgroundColor: const Color(0xFF2EC4B6),
      ),
    );
  }
}
