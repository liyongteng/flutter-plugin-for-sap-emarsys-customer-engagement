import 'package:emarsys_sdk/notification_settings/notification_settings.dart';
import 'package:emarsys_sdk/version.dart';
import 'package:flutter/services.dart';

class Config {
  final MethodChannel _channel;

  Config(this._channel);

  Future<void> changeApplicationCode(String applicationCode) async {
    return _channel.invokeMethod(
        'config.changeApplicationCode', {"applicationCode": applicationCode});
  }

  Future<void> changeMerchantId(String merchantId) async {
    return _channel
        .invokeMethod('config.changeMerchantId', {"merchantId": merchantId});
  }

  Future<String?> applicationCode() {
    return _channel.invokeMethod('config.applicationCode');
  }

  Future<String?> merchantId() {
    return _channel.invokeMethod('config.merchantId');
  }

  Future<int?> contactFieldId() {
    return _channel.invokeMethod('config.contactFieldId');
  }

  Future<String> clientId() async {
    String? clientId = await _channel.invokeMethod('config.clientId');
    if (clientId == null) {
      throw TypeError();
    }
    return clientId;
  }

  Future<String> languageCode() async {
    String? language = await _channel.invokeMethod('config.languageCode');
    if (language == null) {
      throw TypeError();
    }
    return language;
  }

  Future<NotificationSettings> notificationSettings() async {
    Map<dynamic, dynamic>? notificationSettings =
        await _channel.invokeMethod('config.notificationSettings');
    if (notificationSettings == null) {
      throw TypeError();
    }
    return NotificationSettings.fromMap(notificationSettings);
  }

  Future<String> sdkVersion() async {
    String? sdkVersion = await _channel.invokeMethod('config.sdkVersion');
    if (sdkVersion == null) {
      throw TypeError();
    }
    return sdkVersion;
  }

  Future<String> flutterPluginVersion() async {
    return packageVersion;
  }
}
