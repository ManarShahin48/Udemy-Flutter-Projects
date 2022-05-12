import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  @required double width, // = double.infinity,
  @required Color backgroud,
  @required Function function,
  @required String text, //= Colors.blue
}) =>
    Container(
      width: width,
      color: backgroud,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

//////////////////////////////
// Widget buildTaskItem(Map model, context) => Dismissible(
//       key: Key(model['id'].toString()),
//       onDismissed: (direction) {
//         AppCubit.get(context).deleteDate(id: model['id']);
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 33,
//               child: Text(
//                 '${model['time']}',
//                 style: TextStyle(
//                   fontSize: 15
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${model['title']}',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   Text(
//                     '${model['date']}',
//                     style: TextStyle(color: Colors.grey, fontSize: 11),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             IconButton(
//                 onPressed: () {
//                   AppCubit.get(context)
//                       .updateDate(status: 'done', id: model['id']);
//                 },
//                 icon: Icon(
//                   Icons.check_box,
//                   color: Color(0xFFF9AD6A),
//                 )),
//             SizedBox(
//               width: 5,
//             ),
//             IconButton(
//                 onPressed: () {
//                   AppCubit.get(context)
//                       .updateDate(status: 'achieved', id: model['id']);
//                 },
//                 icon: Icon(
//                   Icons.archive,
//                   color: Color(0xFF4397BD),
//                 )),
//             SizedBox(
//               width: 5,
//             ),
//             IconButton(
//                 onPressed: () {
//                   AppCubit.get(context)
//                       .deleteDate(id: model['id']);
//                 },
//                 icon: Icon(
//                   Icons.delete_forever,
//                   color: Colors.red,
//                 )),
//           ],
//         ),
//       ),
//     );

////////////////
// Widget taskBuilder(@required List<Map> tasks) => ConditionalBuilder(
//       condition: tasks.length > 0,
//       builder: (context) {
//         return ListView.separated(
//             itemBuilder: (context, index) =>
//                 buildTaskItem(tasks[index], context),
//             separatorBuilder: (context, index) => myDivider(),
//             itemCount: tasks.length);
//       },
//       fallback: (context) {
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.menu,
//                 color: Color(0xFFD46C4E),
//                 size: 90,
//               ),
//               Text(
//                 'Not Tasks yet, please add some tasks.....',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFD46C4E),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );

/////////////
// Widget buildArticleItem(article, context) => InkWell(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                       image: NetworkImage('${article['urlToImage']}'),
//                       fit: BoxFit.cover)),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//                         style: Theme.of(context).textTheme.bodyText1,
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: TextStyle(color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       onTap: () {
//         navigateTo(context, WebViewScreen(article['url']));
//       },
//     );

///////////
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );
////////////////////

// Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//       condition: list.length > 0,
//       builder: (context) => ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: 10,
//       ),
//       fallback: (context) => isSearch
//           ? Container()
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );

////////////////////

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

////////////////////

void navigateAndReplacement(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget),
        // (Route<dynamic> route) => false,
        (route){
          return false;
        }
    );
