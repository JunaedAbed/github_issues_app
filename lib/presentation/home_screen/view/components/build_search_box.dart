import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issues_app/presentation/home_screen/controller/home_controller.dart';

Widget buildSearchBox(HomeController controller) {
  return SizedBox(
    height: 60,
    child: TextField(
      onSubmitted: (value) {
        controller.searchIssues(value);
      },
      onEditingComplete: () {
        FocusScope.of(Get.context!).unfocus();
      },
      controller: controller.searchTextController,
      decoration: InputDecoration(
        labelText: "Search",
        hintText: "Search for issues...",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );
}
