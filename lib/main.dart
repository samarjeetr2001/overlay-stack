import 'package:flutter/material.dart';
import 'package:flutter_application/module/bloc/emi_selection_bloc.dart';
import 'package:flutter_application/module/data/emi_selection_repository.dart';
import 'package:flutter_application/module/view/emi_selection_view.dart';
import 'package:flutter_application/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: CustomTheme.colorScheme,
        textTheme: CustomTheme.textTheme,
      ),
      home: RepositoryProvider(
        create: (context) => EmiSelectionRepository(),
        child: BlocProvider(
          create: (context) => EmiSelectionBloc(
            context.read<EmiSelectionRepository>(),
          ),
          child: const EmiSelectionScreen(),
        ),
      ),
    );
  }
}
