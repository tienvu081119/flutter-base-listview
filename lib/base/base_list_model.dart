import 'package:basic_app/base/base_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseListModel extends BaseModel {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh();

  void onLoading();
}
