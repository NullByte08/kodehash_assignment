/*
 * *
 *  * Created by NullByte08 in 2024.
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kodehash_assignment/models/new_api_response_model.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen(this.articleModel, {Key? key}) : super(key: key);

  final ArticleModel articleModel;

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              widget.articleModel.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Author: ${widget.articleModel.author}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Published at: ${widget.articleModel.publishedAt != null ? DateFormat("dd/MM/yyy HH:mm:ss").format(DateTime.parse(widget.articleModel.publishedAt!)) : "-"}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Description: ${widget.articleModel.description}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
