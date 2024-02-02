import 'package:github_issues_app/core/errors/error_controller.dart';
import 'package:github_issues_app/data/api/api_client.dart';
import 'package:github_issues_app/data/models/issues_response_mode.dart';
import 'package:github_issues_app/data/services/issue_repository_interface.dart';

class IssueRepository with ErrorController implements IssueRepositoryInterface {
  final apiClient = ApiClient();

  @override
  Future<List<IssuesResponseModel>> getIssues(int currentPage) async {
    try {
      var response =
          await apiClient.getData("facebook/react/issues?page=$currentPage");

      var issuesResponse = issuesResponseModelFromJson(response);

      return issuesResponse;
    } catch (e) {
      handleError(e);
      throw Exception('Error in getIssues: $e');
    }
  }
}
