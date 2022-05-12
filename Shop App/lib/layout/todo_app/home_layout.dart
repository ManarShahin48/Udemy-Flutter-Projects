import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_application_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {
  //const HomeLayout({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
                condition: state is! AppGetDatabaseLoadingState,
                builder: (context) => cubit.screens[cubit.currentIndex],
                fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    )),
            floatingActionButton: FloatingActionButton(
              child: Icon(cubit.fabIcon,),
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState.validate()) {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                    titleController.clear();
                    dateController.clear();
                    timeController.clear();
                  }
                } else {
                  scaffoldKey.currentState
                      .showBottomSheet(
                          (context) => Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(20),
                                child: Form(
                                  key: formKey,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: titleController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              labelText: 'Task Title',
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(3.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF9AD6A),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(3.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4397BD),
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.title),
                                              border: OutlineInputBorder()),
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'Title must not be empty';
                                            }
                                            return null;
                                          },
                                          onTap: () {},

                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextFormField(
                                          controller: timeController,
                                          decoration: InputDecoration(
                                              labelText: 'Task Time',
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(3.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF9AD6A),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(3.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4397BD),
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.timelapse),
                                              border: OutlineInputBorder()),
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'Time must not be empty';
                                            }
                                            return null;
                                          },
                                          onTap: () {
                                            showTimePicker(
                                                    context: context,
                                                    initialTime: TimeOfDay.now())
                                                .then((value) {
                                              timeController.text = value
                                                  .format(context)
                                                  .toString();
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.datetime,
                                          controller: dateController,
                                          decoration: InputDecoration(
                                              labelText: 'Task Date',
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(3.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFF9AD6A),
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(3.0),
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4397BD),
                                                ),
                                              ),
                                              prefixIcon:
                                                  Icon(Icons.date_range_outlined),
                                              border: OutlineInputBorder()),
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'Date must not be empty';
                                            }
                                            return null;
                                          },
                                          onTap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime.parse(
                                                        '2030-12-05'))
                                                .then((value) {
                                              dateController.text = DateFormat.yMMMd().format(value);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          elevation: 20)
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });

                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xFF264D59),
              elevation: 20,
              unselectedItemColor: Color(0xFFFFFFFF),
              selectedItemColor: Color(0xFFF9AD6A),
              selectedFontSize: 15,
              iconSize: 30,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
                // currentIndex = index;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_box),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
