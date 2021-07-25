import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharing_housework/features/housework/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> signInGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final data = await FirebaseAuth.instance.signInWithCredential(credential);
    final user = data.user!;
    return UserModel.fromData(user.displayName, user.email, user.photoURL);
  }
}
