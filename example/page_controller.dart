import 'dart:html' as ht;
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'page_routes.dart';

@Component(
  selector: 'page-controller',
  templateUrl: 'page_controller.html',
  directives: [routerDirectives],
  providers: [PageRoutes],
)
class PageController {
  final PageRoutes routes;
  final Router router;
  PageController(this.routes, this.router);

  arrowRight(ht.MouseEvent ev) {
    const nextpage = {'': 'p002', 'p001': 'p002', 'p002': 'p003', 'p003': 'p001'};
    var nvp = NavigationParams(queryParameters: {'current': 'nextout', 'next': 'nextin'});
    router.navigate(nextpage[router.current.path], nvp);
  }

  arrowLeft(ht.MouseEvent ev) {
    const backpage = {'': 'p003', 'p001': 'p003', 'p002': 'p001', 'p003': 'p002'};
    var nvp = NavigationParams(queryParameters: {'current': 'backout', 'next': 'backin'});
    router.navigate(backpage[router.current.path], nvp);
  }
}
