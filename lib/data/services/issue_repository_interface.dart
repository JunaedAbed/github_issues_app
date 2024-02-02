import 'package:github_issues_app/data/models/issues_response_mode.dart';

abstract class IssueRepositoryInterface {
  Future<List<IssuesResponseModel>> getIssues(int currentPage);
}
