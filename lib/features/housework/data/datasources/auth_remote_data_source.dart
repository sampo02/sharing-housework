import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharing_housework/features/housework/core/exceptions/exception.dart';
import 'package:sharing_housework/features/housework/data/models/user_model.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> signInGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw SignInDialogCanceledException();
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final data = await FirebaseAuth.instance.signInWithCredential(credential);
    final user = data.user!;
    return UserModel(
        id: UserId(user.uid),
        displayName: user.displayName,
        email: user.email,
        photoUrl: user.photoURL);
  }
}
