import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/news_item.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Search')),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              TextFormField(
                style: cubit.isDarkTheme
                    ? const TextStyle(color: Colors.white)
                    : const TextStyle(color: Colors.black),
                onChanged: (search) {
                  cubit.getSearchData(search: search);
                },
                decoration: const InputDecoration(
                  label: Text('Search'),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              if (state is GetSearchDataLoadingState)
                const LinearProgressIndicator(),
              if (state is GetSearchDataLoadingState)
                const SizedBox(
                  height: 8.0,
                ),
              cubit.searchData == null
                  ? const Center(
                      child: Text('Explore the world\'s hot news'),
                    )
                  : Expanded(
                      child: ListView.separated(
                          separatorBuilder: ((context, index) =>
                              const Divider()),
                          itemCount: cubit.searchData!.length,
                          itemBuilder: (context, index) => NewsItemBuilder(
                                index: index,
                                data: cubit.searchData!,
                              )),
                    )
            ]),
          ),
        );
      },
    );
  }
}
