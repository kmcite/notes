// import 'package:flutter/material.dart';
// import 'package:forui/assets.dart';
// import 'package:notes/domain/repositories/notes_repository.dart';
// import 'package:notes/features/notes/note/note.dart';
// import 'package:notes/main.dart';

// import '../../../domain/models/note.dart';

// String timeAgo(DateTime dateTime) {
//   final now = DateTime.now();
//   final difference = now.difference(dateTime);

//   if (difference.inSeconds < 60) {
//     return 'Just now';
//   } else if (difference.inMinutes < 60) {
//     return '${difference.inMinutes}m ago';
//   } else if (difference.inHours < 24) {
//     if (dateTime.day == now.day) {
//       return 'Today at ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//     }
//     return '${difference.inHours}h ago';
//   } else if (difference.inDays < 7) {
//     if (difference.inDays == 1) {
//       return 'Yesterday at ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//     }
//     return '${difference.inDays}d ago';
//   } else if (difference.inDays < 30) {
//     final weeks = (difference.inDays / 7).floor();
//     return '${weeks}w ago';
//   } else if (difference.inDays < 365) {
//     final months = (difference.inDays / 30).floor();
//     return '${months}mo ago';
//   } else {
//     return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//   }
// }

// class NewsBloc extends Cubit<Iterable<Note>> {
//   late NotesRepository notesRepository = of();

//   @override
//   Future<Iterable<Note>> init() async {
//     notesRepository.stream.listen(
//       (_) => emit(notesRepository.news),
//     );
//     return notesRepository.news;
//   }
// }

// class NewsPage extends Feature<NewsBloc> {
//   const NewsPage({super.key});

//   @override
//   create() => NewsBloc();

//   @override
//   build(BuildContext context, NewsBloc controller) {
//     final newsAvailable = controller().isNotEmpty;
//     if (newsAvailable) {
//       return ListView.builder(
//         itemCount: controller().length,
//         itemBuilder: (context, index) {
//           final newNote = controller().elementAt(index);
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
//                         timeAgo(newNote.timeCreated),
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
//                 navigator.to(
//                   NoteView(note: newNote),
//                 );
//               },
//             ),
//           );
//         },
//       );
//     }

//     return Icon(
//       FIcons.newspaper,
//       size: 96,
//     );
//   }
// }
