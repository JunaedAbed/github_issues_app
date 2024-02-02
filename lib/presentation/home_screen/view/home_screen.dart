import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issues_app/presentation/home_screen/controller/home_controller.dart';
import 'package:github_issues_app/presentation/home_screen/view/components/build_issue_list_view.dart';
import 'package:github_issues_app/presentation/home_screen/view/components/build_search_box.dart';
import 'package:github_issues_app/presentation/home_screen/view/components/top_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text(
          "Issues",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topText(),
              buildSearchBox(controller),
              const SizedBox(height: 10),
              Expanded(child: buildIssueListView(controller)),
            ],
          ),
        ),
      ),
    );
  }
}
