import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_classic/domain/errors.dart';
import 'package:firebase_auth_classic/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth_classic/injections/injection.dart';

extension FirestoreHelpers on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await locator<AuthRepository>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }
}

extension DocumentReferenceExtension on DocumentReference {
  CollectionReference get todoCollection => collection('todos');
}
