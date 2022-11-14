import 'package:appointment/domain/client/values.dart';
import 'package:appointment/domain/common/failures.dart';
import 'package:appointment/domain/common/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Value Object", () {
    group("Name", nameTests);
  });
}

void nameTests() {
  // Non empty name
  group("value", () {
    test(
        "Should return Right(name) with the same value, when value length is equal to 1",
        () {
      // Arrange
      const name = "J";
      final sut = Name(name);

      // Act
      final actual = sut.value;

      // Assert
      expect(actual, isA<Right<StringFailure, String>>());
      expect(actual, const Right(name));
      expect(sut.isValid, isTrue);
      expect(sut.isNotValid, isFalse);
      expect(sut.getOrThrow(), name);
    });

    // Empty name
    test(
        "Should return a type of Left<StringFailure, String>, String> when name length is less than 1",
        () {
      // Arrange
      const name = "";
      final sut = Name(name);

      // Act
      final actual = sut.value;

      // Assert
      expect(actual, isA<Left<StringFailure, String>>());
      expect(sut.isValid, isFalse);
      expect(sut.isNotValid, isTrue);
      expect(() => sut.getOrThrow(), throwsA(isA<UnexpectedValueError>()));
    });
  });
}
