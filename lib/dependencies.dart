import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/storage/storage_service.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});


