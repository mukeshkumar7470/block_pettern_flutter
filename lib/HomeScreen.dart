import 'package:block_pettern_flutter/blocks/internet_blocs/internet_state.dart';
import 'package:block_pettern_flutter/blocks/internet_blocs/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Internet Connected !");
            } else if (state is InternetLostState) {
              return const Text("Internet Disonnected !");
            } else {
              return const Text("Loading....");
            }
          },
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connected !"),
                backgroundColor: Colors.green,
              ),);
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet disconnected !"),
                backgroundColor: Colors.red,
              ),
              );
            }
          },
        ),
      )),
    );
  }
}
