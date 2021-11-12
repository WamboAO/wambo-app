import 'package:flutter/material.dart';

import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({
    required this.icon,
    required this.label,
    required this.tooltip,
  });
  final IconData icon;
  final String label;
  final Tooltip tooltip;
}

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar(
      {Key? key,
      required this.items,
      required this.onTabSelected,
      required this.height,
      required this.selectedColor,
      required this.iconSize,
      required this.currentIndex,
      required this.color})
      : super(key: key);
  final List<FABBottomAppBarItem> items;
  final double height;
  final Color selectedColor;
  final Color color;
  final double iconSize;
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  late int _selectedIndex;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Icon(item.icon, color: color, size: widget.iconSize),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: kcBottomNav,
      child: Container(
        height: screenHeightPercentage(context, percentage: 0.08),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }
}
