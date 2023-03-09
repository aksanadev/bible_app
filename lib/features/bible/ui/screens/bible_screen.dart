import 'dart:developer';

import 'package:bible_app/features/bible/bloc/bible_bloc.dart';
import 'package:bible_app/features/bible/bloc/bible_state.dart';
import 'package:flutter/material.dart';
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
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Bible Screen'),
                      const SizedBox(height: 20),
                      // listed data
                      ...bibleState!.bibles.map(
                        (e) => Card(
                          child: Text('Bible: ${e.name.toString()}'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bible Screen'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await bloc.getAllBibles();
                        log('got data!');
                      } catch (e) {
                        log('failed to get data');
                      }
                    },
                    child: const Text('Get All Bibles'), // initialize bibles
                  ),
                  // ...bibleState!.bibles.map((e) => Card(
                  //       child: Text('Bible: ${e.name.toString()}'),
                  //     )),
                  // OMIT THIS^
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
