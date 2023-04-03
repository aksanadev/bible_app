import 'dart:developer';

import 'package:bible_app/features/bible/bloc/bible_bloc.dart';
import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/ui/widgets/books_bottom_sheet.dart';
import 'package:bible_app/utils/app/bloc/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bible_app/features/bible/ui/widgets/bible_version_bottom_sheet.dart';

class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BibleBloc>(context);

    return StreamBuilder(
      initialData: BibleState(loadingState: LoadingState(isLoading: false)),
      stream: bloc.bibleStateStream,
      builder: (context, snapshot) {
        final bibleState = snapshot.data;
        if (snapshot.hasData) {
          if (bibleState != null) {
            log(bibleState.loadingState!.isLoading.toString());
          }
        }
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('get all versions'),
              ),
            ],
          )),
        );
      },
    );
  }
}

// class BibleScreen extends StatelessWidget {
//   const BibleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<BibleBloc>(context);

//     return StreamBuilder<BibleState>(
//       initialData: BibleState(loadingState: LoadingState(isLoading: false)),
//       stream: bloc.bibleStateStream,
//       builder: (context, snapshot) {
//         final bibleState = snapshot.data;
//         if (snapshot.hasData) {
//           if (snapshot.data != null) {
//             return Scaffold(
//               appBar: AppBar(
//                 // backgroundColor: Colors.blueGrey,
//                 automaticallyImplyLeading: false,
//                 title: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: Row(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () async {
//                           await bloc.getBibleBooks(
//                               bibleId: 'de4e12af7f28f599-01');
//                           // booksBottomSheet(context, bibleState, bloc);
//                           bibleState!.bibleBooks!.map((e) => Text(e.toString()));
//                         },
//                         style: ButtonStyle(
//                           shape: MaterialStateProperty.all(
//                             const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(18),
//                                   bottomLeft: Radius.circular(18)),
//                             ),
//                           ),
//                         ),
//                         child: const Text(
//                           '1 John 4',
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 2,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           bibleVersionBottomSheet(context, bibleState, bloc);
//                         },
//                         style: ButtonStyle(
//                           shape: MaterialStateProperty.all(
//                             const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(18),
//                                   bottomRight: Radius.circular(18)),
//                             ),
//                           ),
//                         ),
//                         child: const Text(
//                           'NKJV',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.search),
//                   )
//                 ],
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Center(
//                   child: SingleChildScrollView(
//                     physics: const AlwaysScrollableScrollPhysics(
//                       parent: BouncingScrollPhysics(),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text('Bible Screen'),
//                         SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         } else {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
