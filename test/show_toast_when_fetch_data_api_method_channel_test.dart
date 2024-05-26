import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:show_toast_when_fetch_data_api/show_toast_when_fetch_data_api_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelShowToastWhenFetchDataApi platform = MethodChannelShowToastWhenFetchDataApi();
  const MethodChannel channel = MethodChannel('show_toast_when_fetch_data_api');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getDataApi(), '42');
  });
}
