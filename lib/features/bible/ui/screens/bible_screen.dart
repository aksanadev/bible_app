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
    return StreamBuilder<BibleState>(
      initialData: BibleState(loadingState: LoadingState(isLoading: false)),
      stream: bloc.bibleStateStream,
      builder: (context, snapshot) {
        final bibleState = snapshot.data;
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            print('>>>>> ${bibleState!.loadingState!.isLoading}');
          }
        }

        return ElevatedButton(
            onPressed: () async {
              await bloc.getBibleVersions();
            },
            child: const Text('get all versions'));

        // if (bibleState?.loadingState != null) {
        //   if (bibleState!.loadingState!.isLoading) {
        //     print('>>>>> is loading');
        //   } else if (!bibleState.loadingState!.isLoading) {
        //     print('>>>>> is NOT loading');
        //   }
        // }
      },
    );
  }
}
