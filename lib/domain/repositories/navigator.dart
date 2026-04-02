import 'package:flutter/material.dart';

final navigator = GlobalKey<NavigatorState>();

void push(Widget page) {
  navigator.currentState!.push(MaterialPageRoute(builder: (context) => page));
}

void pop() {
  navigator.currentState!.pop();
}

void pushDialog(Widget page) {
  showDialog(
    context: navigator.currentContext!,
    builder: (context) => page,
  );
}
