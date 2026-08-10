import 'dart:io';

void main() {
// =========================
// Folders
// =========================

final directories = [
'lib/core/config',
'lib/core/routes',
'lib/core/theme',
'lib/modules/splash/presentation/pages',
];

// =========================
// Files
// =========================

final files = {
'lib/core/config/app_config.dart': '''
class AppConfig {
}
''',

'lib/core/routes/app_router.dart': '''
class AppRouter {
}
''',

'lib/core/routes/app_routes.dart': '''
class AppRoutes {
}
''',

'lib/core/theme/app_theme.dart': '''
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
  );
}
''',

'lib/modules/splash/presentation/pages/splash_page.dart': '''
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
''',
};

// =========================
// Create Directories
// =========================

for (final directory in directories) {
Directory(directory).createSync(recursive: true);

print('📁 Created: $directory');
}

// =========================
// Create Files
// =========================

for (final entry in files.entries) {
final file = File(entry.key);

if (!file.existsSync()) {
file.createSync(recursive: true);
file.writeAsStringSync(entry.value);

print('📄 Created: ${entry.key}');
} else {
print('⚠️ Already exists: ${entry.key}');
}
}

print('');
print('====================================');
print('✅ Project structure created!');
print('====================================');
}

