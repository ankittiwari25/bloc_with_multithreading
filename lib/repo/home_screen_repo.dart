import 'package:api_call_with_bloc_pattern/model/home_model.dart';
import 'package:api_call_with_bloc_pattern/services/home_services.dart';
import 'package:dartz/dartz.dart';

class HomeScreenRepo {
  static final HomeScreenRepo _singleton = HomeScreenRepo._internal();

  factory HomeScreenRepo() {
    return _singleton;
  }

  HomeScreenRepo._internal();

  final _service = HomeServices();

  Future<Either<List<HomeModel>, String>> getHomeData() => _service.getHomeDataInBackGround();
}
