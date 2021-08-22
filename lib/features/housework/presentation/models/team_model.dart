import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sharing_housework/features/housework/domain/usecases/generate_dynamic_link_usecase.dart';

class TeamModel extends ChangeNotifier {
  final GenerateInvitationLinkUsecase generateInvitationLinkUsecase;

  TeamModel({required this.generateInvitationLinkUsecase});

  var _invitationUrl = '';

  String get invitationUrl => _invitationUrl;

  void generateInvitationUrl() async {
    final link = await generateInvitationLinkUsecase();
    _invitationUrl = link.toString();
    Share.share(_invitationUrl);
    notifyListeners();
  }
}
