class TeamModel {
  TeamModel({required this.memberIds});

  TeamModel.fromJson(Map<String, Object?> json)
      : this(
          memberIds: json['memberIds']! as List<String>,
        );

  final List<String> memberIds;

  Map<String, Object?> toJson() {
    return {
      'memberIds': memberIds,
    };
  }
}
