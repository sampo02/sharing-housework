import 'package:flutter/widgets.dart';
import 'package:sharing_housework/features/housework/domain/usecases/get_current_user_usecase.dart';
import 'package:sharing_housework/features/housework/domain/usecases/sign_in_google_usecase.dart';

class UserModel extends ChangeNotifier {
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final SignInGoogleUsecase signInGoogleUsecase;

  UserModel(
      {required this.getCurrentUserUsecase, required this.signInGoogleUsecase});

  var _id = '';
  var _displayName = '';
  var _email = '';
  var _photoUrl = '';

  String get id => _id;
  String get displayName => _displayName;
  String get email => _email;
  String get photoUrl => _photoUrl;

  void setCurrent() {
    final user = getCurrentUserUsecase();
    if (user == null) {
      return;
    }

    _id = user.id.value;
    _displayName = user.displayName;
    _email = user.email;
    _photoUrl = user.photoUrl;

    notifyListeners();
  }

  Future<void> signInGoogle() async {
    final data = await signInGoogleUsecase();

    _id = data.id.value;
    _displayName = data.displayName;
    _email = data.email;
    _photoUrl = data.photoUrl;

    notifyListeners();
  }
}
