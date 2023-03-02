import 'package:api_call_with_bloc_pattern/api_services/api_services.dart';
import 'package:api_call_with_bloc_pattern/model/home_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class HomeServices {
  Future<Either<List<HomeModel>, String>> getHomeData(List<dynamic> dummy) async {
    try {
      final response = await ApiService.instance.get("https://jsonplaceholder.typicode.com/todos");
      List<dynamic> data=response;
      final List<HomeModel> homeData = data.map((e) => HomeModel.fromJson(e)).toList();
      return Left(homeData);
    } catch (error) {
      return Right(error.toString());
    }
  }
  Future<Either<List<HomeModel>, String>> getHomeDataInBackGround() async {
    return await compute(getHomeData,[]);
  }
}
