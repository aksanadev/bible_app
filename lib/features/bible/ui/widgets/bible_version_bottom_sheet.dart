import 'package:bible_app/features/bible/bloc/bible_bloc.dart';
import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/ui/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bibleVersionBottomSheet(
    BuildContext context, BibleState? bibleState, BibleBloc bloc) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18))),
        child: FractionallySizedBox(
          heightFactor: .93,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Done', style: textButton),
                  ),
                  Column(
                    children: [
                      Text('Versions', style: defaultStyle),
                      Text('2,917 Versions in 1,942 Languages',
                          style: smallText)
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
                            ...bibleState!.bibleVersions!.map(
                              (e) => GestureDetector(
                                onTap: () {
                                  // bloc.getBibleVersion(e.bibleId);
                                  context.pop();
                                },
                                child: ListTile(
                                  title: Text(e.bibleVersion.toString()),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.chevron_left),
                                    onPressed: () {},
                                  ),
                                ),
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
        ),
      );
    },
  );
}
