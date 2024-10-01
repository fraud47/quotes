import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes/presentation/MainScreen.dart';

import 'ThemeCubit.dart';
import 'dark_theme.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
  );
  WidgetsFlutterBinding.ensureInitialized();

  runApp(


      MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ThemeCubit())
          ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit,ThemeMode>(
        builder: (context,mode) => MaterialApp(
            theme: AppTheme.darkMode,
            darkTheme: AppTheme.darkMode,
            themeMode: mode,
            debugShowCheckedModeBanner: false,
            home: MainScreen()
        ),

    );
  }
}

