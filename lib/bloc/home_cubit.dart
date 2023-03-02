import 'package:api_call_with_bloc_pattern/bloc/home_state.dart';
import 'package:api_call_with_bloc_pattern/repo/home_screen_repo.dart';
import 'package:bloc/bloc.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  HomeDataCubit() : super(HomeDataInitial());

  final _repo = HomeScreenRepo();

  Future<void> getHomeData() async {
    try {
      emit(HomeDataLoading());
      final result = await _repo.getHomeData();
      result.fold(
        (l) => emit(HomeDataSuccess(l)),
        (r) => emit(HomeDataError(r)),
      );
    } on Exception catch (e) {
      emit(HomeDataError(e.toString()));
    }
  }
}
