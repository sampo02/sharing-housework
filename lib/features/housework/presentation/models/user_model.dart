import 'package:flutter/widgets.dart';
import 'package:sharing_housework/features/housework/domain/usecases/sign_in_google_usecase.dart';

class UserModel extends ChangeNotifier {
  final SignInGoogleUsecase signInGoogleUsecase;

  UserModel({required this.signInGoogleUsecase});

  Future<void> signInGoogle() async {
    await signInGoogleUsecase();
    notifyListeners();
  }
}
