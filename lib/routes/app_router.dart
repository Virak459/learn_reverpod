import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:learning_reverpod/features/home/views/home_view.dart';
import 'package:learning_reverpod/features/user/views/user_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    // HomeScreen is generated as HomeRoute because
    // of the replaceInRouteName property
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: UserRoute.page, path: '/user'),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
