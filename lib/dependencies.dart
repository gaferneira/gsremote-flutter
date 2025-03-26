import '/core/data/datastore/device_info_store.dart';
import '/core/data/datastore/device_info_store_impl.dart';

import '/core/data/repository/bluetooth_universal_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/data/repository/bluetooth_repository.dart';
import 'core/data/repository/mock_bluetooth_repository.dart';
import 'core/storage/storage_service.dart';

const useMock = false;

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

final deviceInfoStoreProvider = Provider<DeviceInfoStore>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  return DeviceInfoStoreImpl(storageService);
});

final bluetoothRepositoryProvider = Provider<BluetoothRepository>((ref) {
  final deviceInfoStore = ref.watch(deviceInfoStoreProvider);
  return useMock ? MockBluetoothRepository() : BluetoothUniversalRepositoryImpl(deviceInfoStore);
});

