import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/enum/bottom_nav_item.dart';

class BottomNavCubit extends Cubit<BottomNavItem> {
  BottomNavCubit() : super(BottomNavItem.homePage);

  void selectTab(BottomNavItem item) => emit(item);
}
