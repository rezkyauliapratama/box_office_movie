import 'package:flutter/material.dart';
import 'features/di/injection_container.dart' as di;
import 'features/presentation/pages/dashboard/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}