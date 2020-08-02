import 'package:box_office_clean_arch/features/di/injection_container.dart';
import 'package:box_office_clean_arch/features/domain/entities/movie_entity.dart';
import 'package:box_office_clean_arch/features/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';

class MoviesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MoviesListView');
    final bloc = sl<DashboardBloc>();
    bloc.fetchPopularMovies();

    return buildList(bloc);
  }

  Widget buildList(DashboardBloc bloc) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies DB')),
      body: StreamBuilder(
        stream: bloc.popularMovies,
        builder:
            (BuildContext context, AsyncSnapshot<List<MovieEntity>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return moviesListTile(snapshot.data[index]);
              });
        },
      ),
    );
  }

  Widget moviesListTile(MovieEntity item) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            print("movie title : ${item.title}");
          },
          title: Text(item.title),
          subtitle: Text('${item.popularity} populers'),
          trailing: Column(
            children: <Widget>[
              Icon(Icons.star),
              Text(item.voteCount.toString())
            ],
          ),
        ),
        Divider(
          height: 8.0,
        )
      ],
    );
  }
}
