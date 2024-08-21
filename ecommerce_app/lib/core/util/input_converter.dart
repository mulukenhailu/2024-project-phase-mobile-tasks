import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../error/failure.dart';

class InputConverter {
  Either<Failure, double> stringeToUnsignedDouble(String str) {
    try {
      final converterDouble = (int.parse(str) as num).toDouble();
      if (converterDouble < 0) throw const FormatException();
      return Right(converterDouble);
    } on FormatException {
      return const Left(InvalidInputFailure(message: 'Invalid Input'));
    }
  }
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({required super.message});
}
