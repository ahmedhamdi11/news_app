import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/news_item.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, CubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.scienceData == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                separatorBuilder: ((context, index) => const Divider()),
                itemCount: cubit.scienceData!.length,
                itemBuilder: (context, index) => NewsItemBuilder(
                      index: index,
                      data: cubit.scienceData!,
                    ));
      },
    );
  }
}
