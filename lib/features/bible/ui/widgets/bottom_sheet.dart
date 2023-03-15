  import 'package:bible_app/features/bible/ui/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

showBibleBottomSheet(BuildContext context, bibleState) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
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
                  physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            ...bibleState!.bibles.map(
                              (e) => ListTile(
                                title: Text(
                                  e.name.toString(),
                                  style: defaultStyle,
                                ),
                                trailing: const Icon(Icons.chevron_left),
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