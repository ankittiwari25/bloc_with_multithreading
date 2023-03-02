import 'package:api_call_with_bloc_pattern/bloc/home_cubit.dart';
import 'package:api_call_with_bloc_pattern/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeDataCubit>().getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeDataCubit, HomeDataState>(
        listener: (context, state) {
          if (state is HomeDataSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Data fetched"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeDataSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${state.homeModel[index].title}"),
                  subtitle: const Divider(thickness: 2),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Text("${state.homeModel[index].id}", maxLines: 1, overflow: TextOverflow.fade),
                  ),
                );
              },
              itemCount: state.homeModel.length,
            );
          } else if (state is HomeDataError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            if (state is HomeDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text("Something went wrong...."));
            }
          }
        },
      ),
    );
  }
}
