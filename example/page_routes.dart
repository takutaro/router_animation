import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import './pages/001/page.template.dart' as p001;
import './pages/002/page.template.dart' as p002;
import './pages/003/page.template.dart' as p003;

@Injectable()
class PageRoutes {
  final List<RouteDefinition> all = [
    RouteDefinition(path: 'p001', component: p001.P001ComponentNgFactory, useAsDefault: true),
    RouteDefinition(path: 'p002', component: p002.P002ComponentNgFactory),
    RouteDefinition(path: 'p003', component: p003.P003ComponentNgFactory),
  ];
}
