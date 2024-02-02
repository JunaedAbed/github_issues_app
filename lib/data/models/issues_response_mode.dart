// To parse this JSON data, do
//
//     final issuesResponseModel = issuesResponseModelFromJson(jsonString);

import 'dart:convert';

List<IssuesResponseModel> issuesResponseModelFromJson(String str) =>
    List<IssuesResponseModel>.from(
        json.decode(str).map((x) => IssuesResponseModel.fromJson(x)));

String issuesResponseModelToJson(List<IssuesResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IssuesResponseModel {
  int? id;
  int? number;
  String? state;
  String? title;
  String? body;
  User? user;
  List<Label>? labels;
  String? createdAt;
  String? authorAssociation;
  String? stateReason;

  IssuesResponseModel({
    this.id,
    this.number,
    this.state,
    this.title,
    this.body,
    this.user,
    this.labels,
    this.createdAt,
    this.authorAssociation,
    this.stateReason,
  });

  factory IssuesResponseModel.fromJson(Map<String, dynamic> json) =>
      IssuesResponseModel(
        id: json["id"],
        number: json["number"],
        state: json["state"],
        title: json["title"],
        body: json["body"],
        user: User.fromJson(json["user"]),
        labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        createdAt: json["created_at"],
        authorAssociation: json["author_association"],
        stateReason: json["state_reason"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "state": state,
        "title": title,
        "body": body,
        "user": user!.toJson(),
        "labels": List<dynamic>.from(labels!.map((x) => x.toJson())),
        "created_at": createdAt,
        "author_association": authorAssociation,
        "state_reason": stateReason,
      };
}

class Label {
  int? id;
  String? nodeId;
  String? name;
  String? description;
  bool? labelDefault;

  Label({
    this.id,
    this.nodeId,
    this.name,
    this.description,
    this.labelDefault,
  });

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        description: json["description"],
        labelDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "description": description,
        "default": labelDefault,
      };
}

class User {
  String? login;
  int? id;
  String? type;
  bool? siteAdmin;

  User({
    this.login,
    this.id,
    this.type,
    this.siteAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        login: json["login"],
        id: json["id"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "type": type,
        "site_admin": siteAdmin,
      };
}
