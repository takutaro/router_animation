import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'page_controller.template.dart' as ng;
import 'main.template.dart' as self;

@GenerateInjector(
  routerProvidersHash,
)
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.PageControllerNgFactory, createInjector: injector);
}
