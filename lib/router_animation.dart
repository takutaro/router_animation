library router_animation;

import 'dart:html';
import 'dart:async';
import 'package:angular_router/angular_router.dart';

class RouterAnimationOperator implements OnActivate, CanDeactivate {
  @override
  Future<bool> canDeactivate(RouterState current, RouterState next) async {
    if (current?.path == next.path) return false;
    if (_animInProgress()) return false;
    var _class = next.queryParameters['current'] ?? null;
    _pointer_events(disable: true);
    if (_class != null) await _animation(_class);
    return true;
  }

  @override
  Future<Null> onActivate(RouterState previous, RouterState current) async {
    var _class = current.queryParameters['next'] ?? null;
    if (_class != null) await _animation(_class, clear: true);
    _pointer_events(disable: false);
  }

  int _aminCount = 0;
  bool _animInProgress() => _aminCount > 0;
  void _animTerminated(Event ev) => _aminCount--;

  Future<Null> _animation(String animation_class, {clear = false}) async {
    ElementList<Element> _animElms = querySelectorAll('.router_animation');
    _aminCount = _animElms.length;
    _animElms.forEach((el) {
      el.addEventListener('animationend', _animTerminated);
      el.classes.add(animation_class); // animation trigger
    });
    while (_animInProgress()) {
      await Future.delayed(Duration(milliseconds: 100));
    }
    _animElms.forEach((el) {
      el.removeEventListener('animationend', _animTerminated);
      if (clear) el.classes.remove(animation_class);
    });
  }

  void _pointer_events({disable = false}) {
    BodyElement _body = querySelector('body');
    if (disable)
      _body.style.pointerEvents = 'none';
    else
      _body.style.pointerEvents = null;
  }
}

// 泥臭いコードですみましぇん
