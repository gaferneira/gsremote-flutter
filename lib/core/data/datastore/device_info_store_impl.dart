

import 'package:dyi_controller/core/data/datastore/device_info_store.dart';
import 'package:dyi_controller/core/storage/storage_service.dart';

class DeviceInfoStoreImpl implements DeviceInfoStore {

  final String _key = "device_id";
  late StorageService storageService;

  DeviceInfoStoreImpl(this.storageService);

  @override
  Future<String?> getDeviceId() async {
    return storageService.getString(_key);
  }

  @override
  Future<bool> removeDeviceId() {
    return storageService.removeString(_key);
  }

  @override
  Future<bool> saveDeviceId(String deviceId) {
    return storageService.saveString(_key, deviceId);
  }
}
