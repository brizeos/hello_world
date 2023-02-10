import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hello_world/system/router_config.dart';

class CustomRouter{

  static final CustomRouter _singleton = CustomRouter._internal();

  factory CustomRouter() {
    return _singleton;
  }

  CustomRouter._internal();

  GoRouter? _router;

  GoRouter routes(){
    if(_router == null) _addRoutes();
    return _router!;
  }

  _addRoutes(){
    List<GoRoute> sub = [];
    CustomRouterConfiguration.getRoutes().forEach((key, value) {
      sub.add(
          GoRoute(
              path: value['path'] as String,
              builder: value['builder'] as Widget Function(BuildContext, GoRouterState),
              name : key as String,
              pageBuilder : value['pageBuilder'] as Page<dynamic> Function(BuildContext, GoRouterState)?,
              parentNavigatorKey: value['parentNavigatorKey'] as GlobalKey<NavigatorState>?,
              redirect : value['redirect'] as FutureOr<String?> Function(BuildContext, GoRouterState)?,
          )
      );
    });

    _router = GoRouter(routes: sub);
  }




}