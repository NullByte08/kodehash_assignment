import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodehash_assignment/models/new_api_response_model.dart';
import 'package:kodehash_assignment/screens/details_screen.dart';
import 'package:kodehash_assignment/services/future_providers.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    var topHeadlinesFuture = ref.watch(topHeadlinesFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Headlines"),
        elevation: 10,
        scrolledUnderElevation: 10,
      ),
      body: topHeadlinesFuture.when(
        data: (listOfTopHeadlines) {
          return ListView.builder(
            itemCount: listOfTopHeadlines.articles.length,
            itemBuilder: (context, index) {
              return NewsCard(
                articleModel: listOfTopHeadlines.articles[index],
              );
            },
          );
        },
        error: (e, s) {
          print("Error: $e, Stack: $s");
          return const Center(
            child: Text("Some error occurred while fetching. Maybe network issue!"),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(articleModel)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              offset: const Offset(2, 2),
              blurRadius: 6,
            )
          ],
        ),
        child: Column(
          children: [
            Text(
              articleModel.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              articleModel.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
