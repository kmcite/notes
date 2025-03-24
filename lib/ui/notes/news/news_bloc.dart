// import '../../main.dart';

// final NewsBloc newsBloc = NewsBloc();

// class NewsBloc {
//   bool get newsAvailable => news.isNotEmpty;
//   Iterable<Note> get news =>
//       notesRM.allNotes.where((any) => any.noteType == NoteType.New);

//   String timeAgo(DateTime dateTime) {
//     final now = DateTime.now();
//     final difference = now.difference(dateTime);

//     if (difference.inSeconds < 60) {
//       return 'Just now';
//     } else if (difference.inMinutes < 60) {
//       return '${difference.inMinutes}m ago';
//     } else if (difference.inHours < 24) {
//       if (dateTime.day == now.day) {
//         return 'Today at ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//       }
//       return '${difference.inHours}h ago';
//     } else if (difference.inDays < 7) {
//       if (difference.inDays == 1) {
//         return 'Yesterday at ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//       }
//       return '${difference.inDays}d ago';
//     } else if (difference.inDays < 30) {
//       final weeks = (difference.inDays / 7).floor();
//       return '${weeks}w ago';
//     } else if (difference.inDays < 365) {
//       final months = (difference.inDays / 30).floor();
//       return '${months}mo ago';
//     } else {
//       return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//     }
//   }
// }
