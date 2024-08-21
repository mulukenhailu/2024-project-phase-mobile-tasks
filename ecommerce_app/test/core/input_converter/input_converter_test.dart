import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/util/input_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;
  setUp(() {
    inputConverter = InputConverter();
  });

  group('input Converter', () {
    test('should return an integer when the string represent unsigned integer',
        () async {
      const testInt = '1';
      final result = inputConverter.stringeToUnsignedDouble(testInt);
      expect(result, const Right(1));
    });

    test('should return failure if the string is not an integer', () async {
      const testInt = 'abc';
      final result = inputConverter.stringeToUnsignedDouble(testInt);
      expect(result, const Left(InvalidInputFailure(message: 'Invalid Input')));
    });

    test('should return failure if the string is negative integer', () async {
      const testInt = '-1';
      final result = inputConverter.stringeToUnsignedDouble(testInt);
      expect(result, const Left(InvalidInputFailure(message: 'Invalid Input')));
    });
  });
}
