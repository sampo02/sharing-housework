import 'package:sharing_housework/features/housework/data/models/team_user_model.dart';

class TeamModel {
  TeamModel({required this.memberIds, required this.members});

  TeamModel.fromJson(Map<String, Object?> json)
      : this(
            memberIds: json['memberIds']! as List<String>,
            members: json['members']! as List<TeamUserModel>);

  final List<String> memberIds;
  final List<TeamUserModel> members;

  Map<String, Object?> toJson() {
    return {
      'memberIds': memberIds,
      'members': Map.fromIterables(members.map((e) => e.id.value).toList(),
          members.map((e) => e.toJson()))
    };
  }
}
