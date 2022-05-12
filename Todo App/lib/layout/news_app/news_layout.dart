// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/layout/news_app/cubit/cubit.dart';
// import 'package:flutter_application_1/layout/news_app/cubit/states.dart';
// import 'package:flutter_application_1/shared/components/components.dart';
// import 'package:flutter_application_1/shared/cubit/cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NewsLayout extends StatelessWidget {
//   //const NewsLayout({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NewsCubit, NewStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = NewsCubit.get(context);
//         return Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'News App',
//               ),
//               actions: [
//                 IconButton(
//                     onPressed: () {
//                       navigateTo(context, Search());
//                     }, icon: Icon(Icons.search_outlined)),
//                 IconButton(
//                     onPressed: () {
//                       AppCubit.get(context).changeAppMode();
//                     },
//                     icon: Icon(Icons.brightness_4_outlined))
//               ],
//             ),
//             body: cubit.screens[cubit.currentIndex],
//             bottomNavigationBar: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               onTap: (index) {
//                 cubit.changeBottomNavIndex(index);
//               },
//               items: cubit.bottomItems,
//               currentIndex: cubit.currentIndex,
//             ));
//       },
//     );
//   }
// }
