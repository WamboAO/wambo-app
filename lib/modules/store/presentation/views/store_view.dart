import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/store/presentation/views/store_view_model.dart';
import 'package:wambo/modules/store/presentation/widgets/app_bar_view.dart';

class StoreView extends HookWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = useTextEditingController();
    final focus = useFocusNode();
    return ViewModelBuilder<StoreViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF1F1F1),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  screenHeightPercentage(context, percentage: 0.09)),
              child: AppbarView(
                controller: search,
                focus: focus,
                onClear: ()=> model.onClear(),
              )),
          body: Column(
            children: [
              if (!model.dataReady) ...[],
              if (model.dataReady) ...[
                if (model.data!.status == Status.loading) ...[],
                if (model.data!.status == Status.completed) ...[],
                if (model.data!.status == Status.error) ...[],
              ]
            ],
          ),
        );
      },
      viewModelBuilder: () => StoreViewModel(),
    );
  }
}
