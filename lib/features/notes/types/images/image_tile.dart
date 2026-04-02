// import 'package:flutter/material.dart';
// import 'package:forui/forui.dart';
// import 'package:notes/main.dart';

// import '../../../../domain/models/note.dart';
// import 'image/image_page.dart';

// class ImageNoteTile extends StatelessWidget {
//   final Note note;
//   const ImageNoteTile({super.key, required this.note});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             FAvatar.raw(),
//           ],
//         ).pad(),
//         FButton.icon(
//           onPress: () {
//             navigator.to(ImageNoteView(note: note));
//           },
//           child: Text('Show image'),
//         )
//       ],
//     );
//   }
// }
