import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issues_app/data/models/issues_response_mode.dart';
import 'package:github_issues_app/data/services/issue_repository.dart';
import 'package:github_issues_app/data/services/issue_repository_interface.dart';

class HomeController extends GetxController {
  final IssueRepositoryInterface _repo = IssueRepository();

  final RxList<IssuesResponseModel> issues = <IssuesResponseModel>[].obs;
  final RxList<IssuesResponseModel> _filteredIssues =
      <IssuesResponseModel>[].obs;

  RxBool isLoadingMoreData = false.obs;

  final TextEditingController searchTextController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  RxList<IssuesResponseModel> get filteredIssues => _filteredIssues;

  int currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    getIssues();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    print("object");
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoadingMoreData.value) {
      loadMoreData();
    }
  }

  void getIssues() async {
    issues.value = await _repo.getIssues(currentPage);
  }

  void searchIssues(String searchTerm) {
    _filteredIssues.assignAll(
      issues.where((issue) {
        return issue.labels!.any((label) {
          return label.id.toString().contains(searchTerm);
        });
      }).toList(),
    );

    if (_filteredIssues.isEmpty) {
      Get.snackbar(
        'No Results',
        'No issues found with the specified label ID.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundGradient:
            const LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
        duration: const Duration(seconds: 2),
      );
    }
  }

  void loadMoreData() async {
    print("loading more");
    if (isLoadingMoreData.value) {
      return;
    }

    try {
      isLoadingMoreData.value = true;
      currentPage++;
      final newData = await _repo.getIssues(currentPage);
      issues.addAll(newData);
    } finally {
      isLoadingMoreData.value = false;
    }
  }
}
