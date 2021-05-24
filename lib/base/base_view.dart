import 'package:basic_app/base/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final T model;
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  const BaseView({Key? key, required this.model, required this.builder})
      : super(key: key);

  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  late T currentModel;

  void initState() {
    super.initState();
    currentModel = widget.model;
    currentModel.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<T>(
        create: (_) => widget.model,
        child: Consumer<T>(builder: widget.builder));
  }
}
