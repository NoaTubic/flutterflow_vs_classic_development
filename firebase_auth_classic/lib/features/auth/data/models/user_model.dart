import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth_classic/domain/value_objects.dart';
import 'package:firebase_auth_classic/features/auth/domain/entites/user_entity.dart';

extension UserModel on firebase.User {
  UserEntity toDomain() {
    return UserEntity(
      id: UniqueID.fromUniqueString(uid),
    );
  }
}
