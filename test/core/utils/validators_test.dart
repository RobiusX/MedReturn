import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/core/utils/validators.dart';

void main() {
  group('Validators Unit Tests', () {
    test('validateEmail accepts valid email formats', () {
      expect(Validators.validateEmail('user@domain.com'), isNull);
      expect(Validators.validateEmail('student@university.edu'), isNull);
      expect(Validators.validateEmail('first.last@company.org'), isNull);
    });

    test('validateEmail rejects empty and malformed emails', () {
      expect(Validators.validateEmail(''), 'Please enter your email address');
      expect(
        Validators.validateEmail('   '),
        'Please enter your email address',
      );
      expect(Validators.validateEmail(null), 'Please enter your email address');
      expect(
        Validators.validateEmail('plainaddress'),
        'Please enter a valid email address',
      );
      expect(
        Validators.validateEmail('@missingusername.com'),
        'Please enter a valid email address',
      );
      expect(
        Validators.validateEmail('user@domain'),
        'Please enter a valid email address',
      );
    });

    test('validatePassword enforces minimum character length', () {
      expect(Validators.validatePassword('123456'), isNull);
      expect(Validators.validatePassword('securePass123'), isNull);
      expect(Validators.validatePassword(''), 'Please enter your password');
      expect(Validators.validatePassword(null), 'Please enter your password');
      expect(
        Validators.validatePassword('12345'),
        'Password must be at least 6 characters',
      );
    });

    test('validateConfirmPassword enforces matching passwords', () {
      expect(
        Validators.validateConfirmPassword('secret123', 'secret123'),
        isNull,
      );
      expect(
        Validators.validateConfirmPassword('secret123', 'other123'),
        'Passwords do not match',
      );
      expect(
        Validators.validateConfirmPassword('', 'secret123'),
        'Please confirm your password',
      );
      expect(
        Validators.validateConfirmPassword(null, 'secret123'),
        'Please confirm your password',
      );
    });

    test('validateRequired enforces non-empty fields', () {
      expect(
        Validators.validateRequired('Robius Sani', fieldName: 'Full name'),
        isNull,
      );
      expect(
        Validators.validateRequired('', fieldName: 'Full name'),
        'Full name cannot be empty',
      );
      expect(
        Validators.validateRequired('A', fieldName: 'Full name', minLength: 2),
        'Full name must be at least 2 characters',
      );
    });
  });
}
