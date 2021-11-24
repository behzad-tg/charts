import 'package:flutter/material.dart';
import 'package:project8/consts.dart';

// Side TabBar
class SideTabBar extends StatefulWidget {
  final int selectedIndex;
  final List<SideTabBarItem> items;
  final ValueChanged<int> onTap;
  final Color? selectedItemColor;
  final Widget screen;
  const SideTabBar(
      {Key? key,
      required this.items,
      required this.selectedIndex,
      required this.onTap,
      this.selectedItemColor,
      required this.screen})
      : super(key: key);
  @override
  _SideTabBarState createState() => _SideTabBarState();
  static _SideTabBarState of(BuildContext context) =>
      context.findAncestorStateOfType<_SideTabBarState>()!;
}

class _SideTabBarState extends State<SideTabBar> {
  double width = 60.0;
  updateWidth() {
    setState(() {
      width == 200.0 ? width = 60.0 : width = 200.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.screen,
        
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                width: width,
                decoration: BoxDecoration(
                  color: boxColor,
                  boxShadow: [
                    BoxShadow(
                        color: width == 200.0
                            ? Colors.black12
                            : Colors.transparent,
                        blurRadius: 6,
                        offset: const Offset(10, 0))
                  ],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: _generateItems(),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () => updateWidth(),
                          icon: const Icon(Icons.menu, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        
      ],
    );
  }

  List<Widget> _generateItems() {
    List<Widget> _items = widget.items
        .asMap()
        .entries
        .map<SideTabBarItemTitle>((MapEntry<int, SideTabBarItem> entry) {
      return SideTabBarItemTitle(
        index: entry.key,
        onTap: widget.onTap,
        icon: entry.value.icon,
        text: entry.value.text,
        color: _validateSelectedItemColor(),
      );
    }).toList();
    return _items;
  }

  Color _validateSelectedItemColor() {
    final Color? color;
    if (widget.selectedItemColor == null) {
      color = primaryColor;
    } else {
      color = widget.selectedItemColor!;
    }
    return color;
  }
}

// Side Drawer Item title
class SideTabBarItemTitle extends StatefulWidget {
  final IconData icon;
  final String text;
  final Color color;
  final ValueChanged<int> onTap;
  final int index;
  const SideTabBarItemTitle(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.onTap,
      required this.index})
      : super(key: key);
  @override
  _SideTabBarItemTitleState createState() => _SideTabBarItemTitleState();
}

class _SideTabBarItemTitleState extends State<SideTabBarItemTitle> {
  @override
  Widget build(BuildContext context) {
    final List<SideTabBarItem> barItems = SideTabBar.of(context).widget.items;
    final int selectedIndex = SideTabBar.of(context).widget.selectedIndex;
    final bool isSelected = isTileSelected(barItems, selectedIndex);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => widget.onTap(widget.index),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: getTileColor(isSelected),
              size: 30,
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: getTileColor(isSelected), fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isTileSelected(final List<SideTabBarItem> items, final int index) {
    for (final SideTabBarItem item in items) {
      if (item.text == widget.text && index == widget.index) {
        return true;
      }
    }
    return false;
  }

  Color getTileColor(final bool isSelected) {
    return isSelected
        ? widget.color
        : (Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.grey);
  }
}

// Side Drawer Item
class SideTabBarItem {
  final IconData icon;
  final String text;

  const SideTabBarItem({required this.icon, required this.text});
}
