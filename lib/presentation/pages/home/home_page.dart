import 'package:flutter/material.dart';
import 'package:game_app/presentation/pages/home/bloc/home_bloc.dart';
import 'package:game_app/presentation/pages/home/bloc/home_event.dart';
import 'package:game_app/presentation/pages/home/bloc/home_state.dart';
import 'package:game_app/presentation/widgets/list_games_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetGamesEvent('playstation5'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 32, top: 32),
              child: Text(
                'Playstation 5 games',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is GetGamesSuccess) {
                  return ListGamesWidget(state.games);
                } else if (state is GetGamesInProgress) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(child: Text((state as GetGamesFailure).error));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
