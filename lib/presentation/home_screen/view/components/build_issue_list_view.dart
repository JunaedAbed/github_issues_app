import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issues_app/core/utils/format_date.dart';
import 'package:github_issues_app/presentation/home_screen/controller/home_controller.dart';

Widget buildIssueListView(HomeController controller) {
  return Obx(
    () => ListView.builder(
      controller: controller.scrollController,
      itemCount: controller.filteredIssues.isEmpty
          ? controller.issues.length
          : controller.filteredIssues.length,
      itemBuilder: (context, index) {
        final issue = controller.filteredIssues.isEmpty
            ? controller.issues[index]
            : controller.filteredIssues[index];

        if (index == controller.issues.length) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            issue.title.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            issue.body.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            formatDate(issue.createdAt.toString()),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            issue.user!.login.toString().toUpperCase(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (issue.labels!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 2,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: issue.labels!.map((label) {
                      return Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(
                          "LABEL ${label.id.toString()}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.deepPurple.shade300,
                      );
                    }).toList(),
                  ),
                ),
              const SizedBox(height: 10),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
            ],
          );
        }
      },
    ),
  );
}
