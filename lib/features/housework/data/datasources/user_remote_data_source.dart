import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sharing_housework/features/housework/data/models/user_model.dart';
import 'package:sharing_housework/features/housework/domain/entities/user.dart';
import 'package:sharing_housework/features/housework/domain/values/user_id.dart';

abstract class UserRemoteDataSource {
  Future<UserModel?> findBy(UserId id);
  Future<void> store(User user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<UserModel?> findBy(UserId id) async {
    final doc = await users.doc(id.value).get();
    return doc.exists
        ? UserModel.fromData(id.value, doc.data() as Map<String, dynamic>)
        : null;
  }

  @override
  Future<void> store(User user) {
    return users
        .doc(user.id.value)
        .set({
          'displayName': user.displayName,
          'email': user.email,
          'photoUrl': user.photoUrl
        })
        .then((_) => (_))
        .catchError((_) => (_));
  }
}
