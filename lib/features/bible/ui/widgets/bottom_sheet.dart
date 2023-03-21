import 'package:bible_app/features/bible/bloc/bible_bloc.dart';
import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/ui/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

showBibleBottomSheet(
  BuildContext context,
  BibleState bibleState,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      final bloc = Provider.of<BibleBloc>(context, listen: false);
      return FractionallySizedBox(
        heightFactor: .9,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Done',
                    style: textButton,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Versions',
                      style: defaultStyle,
                    ),
                    Text(
                      '2,917 Versions in 1,942 Languages',
                      style: smallText,
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.black,
                )
              ],
            ),
            Flexible(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          ...bibleState.bibleVersions!.map(
                            (e) => ExpansionTile(
                              title: GestureDetector(
                                onTap: () {
                                  bloc.getVersion(e.bibleId);
                                },
                                child: Text(
                                  e.bibleVersion.toString(),
                                  style: defaultStyle,
                                ),
                              ),
                              trailing: const Icon(Icons.chevron_left),
                              children: [
                                Text(bibleState.bibleVersions!.length
                                    .toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
