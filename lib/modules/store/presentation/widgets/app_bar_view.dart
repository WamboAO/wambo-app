import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/text_field_widget.dart';
import 'package:wambo/modules/store/presentation/widgets/app_bar_view_model.dart';

class AppbarView extends StatelessWidget {
  const AppbarView(
      {Key? key,
      required this.controller,
      required this.focus,
      required this.onClear})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focus;
  final Function onClear;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppbarViewModel>.reactive(
      builder: (context, model, child) {
        return AppBar(
          elevation: 0,
          backgroundColor: kcWhite,
          title: SizedBox(
            height: screenHeightPercentage(context, percentage: 0.06),
            child: SearchTextField(
              controller: controller,
              focus: focus,
              hintText: 'Search',
              onClear: () => onClear(),
            ),
          ),
        );
      },
      viewModelBuilder: () => AppbarViewModel(),
    );
  }
}
