import 'package:flutter_test/flutter_test.dart';
import 'package:show_toast_when_fetch_data_api/show_toast_when_fetch_data_api.dart';
import 'package:show_toast_when_fetch_data_api/show_toast_when_fetch_data_api_platform_interface.dart';
import 'package:show_toast_when_fetch_data_api/show_toast_when_fetch_data_api_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShowToastWhenFetchDataApiPlatform
    with MockPlatformInterfaceMixin
    implements ShowToastWhenFetchDataApiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ShowToastWhenFetchDataApiPlatform initialPlatform = ShowToastWhenFetchDataApiPlatform.instance;

  test('$MethodChannelShowToastWhenFetchDataApi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShowToastWhenFetchDataApi>());
  });

  test('getPlatformVersion', () async {
    ShowToastWhenFetchDataApi showToastWhenFetchDataApiPlugin = ShowToastWhenFetchDataApi();
    MockShowToastWhenFetchDataApiPlatform fakePlatform = MockShowToastWhenFetchDataApiPlatform();
    ShowToastWhenFetchDataApiPlatform.instance = fakePlatform;

    expect(await showToastWhenFetchDataApiPlugin.getDataApi(), '42');
  });
}
