import 'package:baby_care/app/my_app.dart';
import 'package:baby_care/core/di/dependancy_injection.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://wcryzmwgvtcwfybfrwnk.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indjcnl6bXdndnRjd2Z5YmZyd25rIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE1MjE2OTYsImV4cCI6MjA1NzA5NzY5Nn0.sG11xNLRv9BRdRov3KKscdnsnfWPejlcdzNfiw1mElQ",
  );
  setupDI();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}
