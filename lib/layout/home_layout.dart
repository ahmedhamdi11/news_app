import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/moduls/search_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitStates>(
      listener: (context, state) {},
      builder: ((context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: const Text('News App'), actions: [
            IconButton(
                onPressed: () {
                  cubit.changeTheme();
                },
                icon: const Icon(Icons.brightness_4_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                icon: const Icon(Icons.search)),
            const SizedBox(
              width: 15,
            )
          ]),
          body: cubit.screensList[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.navBarTaped(index);
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    label: 'Business', icon: Icon(Icons.business_center)),
                BottomNavigationBarItem(
                    label: 'science', icon: Icon(Icons.science)),
                BottomNavigationBarItem(
                    label: 'sports', icon: Icon(Icons.sports)),
              ]),
        );
      }),
    );
  }
}
