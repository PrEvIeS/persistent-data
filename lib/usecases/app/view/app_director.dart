import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/usecases/app/bloc/app_bloc.dart';
import 'package:flutter_template/usecases/home/view/home_page.dart';

class AppDirector extends StatelessWidget {
  const AppDirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return const HomePage();
      },
    );
  }
}
