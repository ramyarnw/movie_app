//import 'package:built_collection/src/list.dart';
import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/app_state.dart';
import 'package:movie_app/models/auth_user.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/view_model/app_view_model.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';
import 'movie_detail_screen.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage>
    with TickerProviderStateMixin {
  late TabController tabController;
  var loading = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    await context.read<AppViewModel>().getPopularMovie();
    await context.read<AppViewModel>().getUpcoming();
    await context.read<AppViewModel>().getTopRatedMovie();
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BuiltList<Movie> popular =
        context.watch<AppState>().popularMovie ?? BuiltList();
    BuiltList<Movie> upcoming =
        context.watch<AppState>().upcomingMovie ?? BuiltList();
    BuiltList<Movie> topRated =
        context.watch<AppState>().topRatedMovie ?? BuiltList();
    AuthUser? user = context.watch<AppState>().currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.black,
          onPressed: () {},
        ),
        title: const Text(
          'Book Movie',
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_3),
            color: Colors.black,
            onPressed: () {},
          ),
          user == null
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const LoginScreen();
                    }));
                  },
                  child: const Text('Login'))
              : CircleAvatar(
                  child: user.profile?.isNotEmpty ?? false
                      ? Image.network(user.profile!)
                      : Text(user.name.toString()),
                )
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: TabBar(
            controller: tabController,
            dividerColor: Colors.transparent,
            tabs: const <Widget>[
              Tab(
                text: 'Popular',
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: 'Top Rated',
                icon: Icon(Icons.star_rate),
              ),
              Tab(
                text: 'Explore',
                icon: Icon(Icons.upcoming),
              ),
            ],
          ),
        ),
      ),
      body: loading
          ? const CircularProgressIndicator()
          : TabBarView(
              controller: tabController,
              children: <Widget>[
                GridView.builder(
                  itemCount: popular.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    var p = popular[index];

                    return MovieTile(
                      movie: p,
                    ); /*Image.network(
                  images[index], semanticLabel: movieTitle[index]);*/
                  },
                ),
                GridView.builder(
                  itemCount: upcoming.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    var p = upcoming[index];
                    //final image = images[index];
                    // final title = movieTitle[index];
                    return MovieTile(
                      movie: p,
                      // title: title,
                      // image: image,
                    ); /* Image.network(
                  images[index], semanticLabel: movieTitle[index]);*/
                  },
                ),
                GridView.builder(
                  itemCount: topRated.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    var p = topRated[index];
                    return MovieTile(
                      movie: p,
                    );
                    //Image.network(images[index],semanticLabel: movieTitle[index]);
                  },
                ),
              ],
            ),
    );
  }
}

//COMPONENT MOVIETILE
class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return MovieDetailScreen(
                id: movie.id,
              );
            }));
          },
          child: Image.network(
            movie.posterImage,
            //image,
            width: 80,
          ),
        ),
        Text(movie.title),
        //Text(title),
      ],
    );
  }
}
