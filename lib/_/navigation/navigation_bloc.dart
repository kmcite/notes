// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notes/main.dart';

// class NavigationRepository {
//   final key = GlobalKey<NavigatorState>();

//   NavigatorState get state => key.currentState!;
//   BuildContext get context => key.currentContext!;
//   Future<T?> to<T extends Object?>(Widget page) {
//     return state.push(MaterialPageRoute(builder: (_) => page));
//   }

//   void back<T extends Object?>([T? result]) {
//     return state.pop(result);
//   }
// }

// class NavigationBloc extends Cubit<int> {
//   NavigationBloc() : super(0);
//   late final back = navigator.back;
//   GlobalKey<NavigatorState> get key => navigator.key;
//   late final to = navigator.to;
// }
