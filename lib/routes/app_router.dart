import 'package:auto_route/auto_route.dart';
import 'package:learning_reverpod/features/ai_chat/views/ai_chat_view.dart';
import 'package:learning_reverpod/features/home/views/home_view.dart';
import 'package:learning_reverpod/features/login/views/login_view.dart';
import 'package:learning_reverpod/features/product/views/product_view.dart';
import 'package:learning_reverpod/features/register/views/register_view.dart';
import 'package:learning_reverpod/features/user/views/user_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    // HomeScreen is generated as HomeRoute because
    // of the replaceInRouteName property
    // AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: UserRoute.page, path: '/user'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    // AutoRoute(page: LoginRoute.page, path: '/'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    AutoRoute(page: ProductRoute.page, path: '/product'),
    AutoRoute(page: AIChatRoute.page, path: '/', initial: true),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}
