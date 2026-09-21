import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Ensure NO hardcoded Color(0x...) or Colors.* in lib files (must use AppColors)', () {
    final libDir = Directory('lib');
    final dartFiles = libDir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart') && !f.path.endsWith('app_colors.dart'));

    final hardcodedColorRegex = RegExp(r'\b(Color\(0x|Colors\.[a-zA-Z])');
    final violations = <String>[];

    for (final file in dartFiles) {
      final lines = file.readAsLinesSync();
      for (int i = 0; i < lines.length; i++) {
        final line = lines[i];
        if (hardcodedColorRegex.hasMatch(line)) {
          violations.add('${file.path}:${i + 1} -> $line');
        }
      }
    }

    expect(
      violations,
      isEmpty,
      reason: 'All colors must be defined in AppColors. Violations found:\n${violations.join('\n')}',
    );
  });
}
