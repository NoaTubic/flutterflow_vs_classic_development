import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth_classic/domain/value_objects.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required UniqueID id,
  }) = _UserEntity;
}
