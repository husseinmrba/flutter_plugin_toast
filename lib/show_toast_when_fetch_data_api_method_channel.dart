import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'show_toast_when_fetch_data_api_platform_interface.dart';

/// An implementation of [ShowToastWhenFetchDataApiPlatform] that uses method channels.
class MethodChannelShowToastWhenFetchDataApi extends ShowToastWhenFetchDataApiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('show_toast_when_fetch_data_api');

  @override
  Future<void> getDataApi() async {
    await methodChannel.invokeMethod<String>('getData');

  }
}
