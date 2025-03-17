import 'package:dyi_controller/core/data/repository/bluetooth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/data/repository/bluetooth_repository.dart';
import 'core/data/repository/mock_bluetooth_repository.dart';
import 'core/storage/storage_service.dart';

const useMock = true;

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

final bluetoothRepositoryProvider = Provider<BluetoothRepository>((ref) {
  return useMock ? MockBluetoothRepository() : BluetoothRepositoryImpl();
});

