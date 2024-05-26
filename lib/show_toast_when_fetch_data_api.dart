
import 'show_toast_when_fetch_data_api_platform_interface.dart';

class ShowToastWhenFetchDataApi {
  Future<void> getDataApi() {
    return ShowToastWhenFetchDataApiPlatform.instance.getDataApi();
  }
}
