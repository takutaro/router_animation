import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'page_controler.dart';
import 'main.template.dart' as ng;

void main() {
  bootstrapStatic(PageControler, [routerProvidersHash], ng.initReflector);
}
