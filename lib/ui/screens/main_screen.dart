import 'package:exam_6_month/bloc/screen_bloc/screen_bloc.dart';
import 'package:exam_6_month/bloc/screen_bloc/screen_bloc_state.dart';
import 'package:exam_6_month/ui/screens/home/home_screen.dart';
import 'package:exam_6_month/ui/screens/statistics/stattistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    StattisticScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ScreenBloc, ScreenBlocState>(
        builder: (context, state) {
          if (state is LoadedScreenScreenBlocState) {
            return screens[state.index];
          }

          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart),label: "Statistics",),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.green,
        onTap: (value){
          context.read<ScreenBloc>().newScreen(value);
        },
      ),
    );
  }
}
