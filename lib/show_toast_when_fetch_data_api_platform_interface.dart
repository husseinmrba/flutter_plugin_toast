import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'show_toast_when_fetch_data_api_method_channel.dart';

abstract class ShowToastWhenFetchDataApiPlatform extends PlatformInterface {
  /// Constructs a ShowToastWhenFetchDataApiPlatform.
  ShowToastWhenFetchDataApiPlatform() : super(token: _token);

  static final Object _token = Object();

  static ShowToastWhenFetchDataApiPlatform _instance = MethodChannelShowToastWhenFetchDataApi();

  /// The default instance of [ShowToastWhenFetchDataApiPlatform] to use.
  ///
  /// Defaults to [MethodChannelShowToastWhenFetchDataApi].
  static ShowToastWhenFetchDataApiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShowToastWhenFetchDataApiPlatform] when
  /// they register themselves.
  static set instance(ShowToastWhenFetchDataApiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> getDataApi() {
    throw UnimplementedError('getDataApi() has not been implemented.');
  }
}
