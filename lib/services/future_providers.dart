/*
 * *
 *  * Created by NullByte08 in 2024.
 *
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodehash_assignment/services/repository.dart';

final topHeadlinesFutureProvider = FutureProvider((ref) {
  return RepositoryClass.getTopHeadlines();
});
