abstract interface class DeviceInfoStore {
  Future<bool> saveDeviceId(String deviceId);
  Future<String?> getDeviceId();
  Future<bool> removeDeviceId();
}
