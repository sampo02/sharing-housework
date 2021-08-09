import 'package:sharing_housework/features/housework/domain/entities/task.dart';
import 'package:sharing_housework/features/housework/domain/entities/team_user.dart';

class NewTeam {
  List<Task> tasks;
  List<TeamUser> members;

  NewTeam({required this.tasks, required this.members});

  void assign(TeamUser member) {
    members.add(member);
  }
}

class Team extends NewTeam {
  String id;

  Team({required this.id, required tasks, required members})
      : super(tasks: tasks, members: members);
}
