// import 'package:notes/main.dart';
// import 'package:notes/notes/news/news_bloc.dart';

// class NewsPage extends UI {
//   const NewsPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       appBar: AppBar(
//         title: Text('News'),
//       ),
//       body: ListView.builder(
//         itemCount: newsBloc.news.length,
//         itemBuilder: (context, index) {
//           final newNote = newsBloc.news.elementAt(index);
//           return Card(
//             margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             child: ListTile(
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               title: Text(
//                 newNote.title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 8),
//                   Text(
//                     newNote.details,
//                     style: TextStyle(
//                       color: Theme.of(context).textTheme.bodyMedium?.color,
//                       height: 1.3,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.access_time,
//                         size: 16,
//                         color: Theme.of(context).textTheme.bodySmall?.color,
//                       ),
//                       SizedBox(width: 4),
//                       Text(
//                         newsBloc.timeAgo(newNote.timeCreated),
//                         style: TextStyle(
//                           color: Theme.of(context).textTheme.bodySmall?.color,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               trailing: Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () {
//                 navigationBloc.navigateToNotePage(newNote.id);
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {},
//       ),
//     );
//   }
// }
