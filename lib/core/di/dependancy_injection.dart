import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton(() => Supabase.instance.client);
}
