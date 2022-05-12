import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_app/cubit/cubit.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_application_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  //const Search({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(
                        Icons.search_outlined,
                      ),
                      border: OutlineInputBorder()),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
