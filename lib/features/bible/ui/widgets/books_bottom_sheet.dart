import 'package:bible_app/features/bible/bloc/bible_bloc.dart';
import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/ui/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

booksBottomSheet(BuildContext context, BibleState? bibleState, BibleBloc bloc) {
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Cancel', style: textButton),
                  ),
                  Text('Books', style: textButton),
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
                            ...bibleState!.bibleBooks!.map(
                              (e) => GestureDetector(
                                  onTap: () {
                                    bloc.getBibleBook(e.bibleId, e.bookId);
                                  },
                                  child: ListTile(
                                    title: Text(e.bookId.toString()),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.chevron_left),
                                      onPressed: () {},
                                    ),
                                  )),
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
