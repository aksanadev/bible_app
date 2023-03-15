import 'package:bible_app/features/bible/bloc/bible_bloc.dart';
import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:bible_app/features/bible/ui/helpers/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BibleBloc>(context);

    return StreamBuilder<BibleState>(
      stream: bloc.bibleStateStream,
      builder: (context, snapshot) {
        final bibleState = snapshot.data;
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Bible App'),
              actions: [
                IconButton(
                  onPressed: () {
                    _showBottomSheet(context, bibleState);
                  },
                  icon: const Icon(Icons.book),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Bible Screen'),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  _showBottomSheet(BuildContext context, bibleState) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: .9,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
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
                        style: defaultStyle,
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
                Column(
                  children: [
                    Container(
                      color: const Color.fromRGBO(238, 238, 238, 1),
                      child: Column(
                        children: [
                          ...bibleState!.bibles.map(
                            (e) => ListTile(
                              title: Text(
                                e.name.toString(),
                              ),
                              trailing: const Icon(Icons.chevron_left),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
