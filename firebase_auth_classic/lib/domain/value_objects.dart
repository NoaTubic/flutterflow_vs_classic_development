import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_classic/domain/errors.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure, T> get value;

  T getOrCrash() {
    return value.fold((failure) => throw UnexpectedValueError(failure), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueID extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;
  const UniqueID._(this.value);

  factory UniqueID() {
    return UniqueID._(
      right(const Uuid().v1()),
    );
  }

  factory UniqueID.fromUniqueString(String uniqueId) {
    return UniqueID._(right(uniqueId));
  }
}
