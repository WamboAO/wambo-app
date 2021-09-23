// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:gira_mais/core/shared/ui/gira_icons_icons.dart';
// import 'package:gira_mais/core/shared/widgets/page_navigation_widget.dart';
// enum NavChoice { schedule, map, routes, config }

// extension NavChoiceExtension on NavChoice {
//   BottomNavigationBarItem navChoiceItem() {
//     BottomNavigationBarItem item;

//     switch (this) {
//       case NavChoice.schedule:
//         item = BottomNavigationBarItem(
//           icon: const Icon(GiraIcons.notebook),
//           label: "",
//           tooltip: navTitle(),
//         );
//         break;
//       case NavChoice.map:
//         item = BottomNavigationBarItem(
//           icon: const Icon(GiraIcons.mapMarked),
//           label: "",
//           tooltip: navTitle(),
//         );

//         break;
//       case NavChoice.routes:
//         item = BottomNavigationBarItem(
//           icon: const Icon(GiraIcons.busStation),
//           label: "",
//           tooltip: navTitle(),
//         );
//         break;
//       case NavChoice.config:
//         item = BottomNavigationBarItem(
//           icon: const Icon(GiraIcons.settings),
//           label: "",
//           tooltip: navTitle(),
//         );
//         break;
//     }
//     return item;
//   }

//   String navTitle() {
//     String selectedText;

//     switch (this) {
//       case NavChoice.schedule:
//         selectedText = 'schedule';
//         break;
//       case NavChoice.map:
//         selectedText = 'map';
//         break;
//       case NavChoice.routes:
//         selectedText = 'routes';
//         break;
//       case NavChoice.config:
//         selectedText = 'config';
//         break;
//     }

//     return selectedText;
//   }

//   String initialPageRoute() {
//     String selectedText;

//     switch (this) {
//       case NavChoice.schedule:
//         selectedText = scheduleRoute;
//         break;
//       case NavChoice.map:
//         selectedText = mapRoute;
//         break;
//       case NavChoice.routes:
//         selectedText = routesRoute;
//         break;
//       case NavChoice.config:
//         selectedText = configRoute;
//         break;
//     }

//     return selectedText;
//   }

//   int nestedKeyValue() {
//     int value;

//     switch (this) {
//       case NavChoice.schedule:
//         value = 0;
//         break;
//       case NavChoice.map:
//         value = 1;
//         break;
//       case NavChoice.routes:
//         value = 2;
//         break;
//       case NavChoice.config:
//         value = 3;
//         break;
//     }

//     return value;
//   }

//   PageStorageKey? pageStorageKey() {
//     return _pageStorageKeys[this];
//   }

//   static final Map<NavChoice, PageStorageKey> _pageStorageKeys = {
//     NavChoice.schedule: PageStorageKey(NavChoice.schedule.navTitle()),
//     NavChoice.map: PageStorageKey(NavChoice.map.navTitle()),
//     NavChoice.routes: PageStorageKey(NavChoice.routes.navTitle()),
//     NavChoice.config: PageStorageKey(NavChoice.config.navTitle()),
//   };
// }
