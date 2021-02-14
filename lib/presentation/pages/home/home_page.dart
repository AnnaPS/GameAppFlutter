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
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetGamesSuccess) {
                  return ListGamesWidget(state.games);
                } else if (state is GetGamesInProgress) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Text((state as GetGamesFailure).error);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
