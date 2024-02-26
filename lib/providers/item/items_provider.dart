import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../../data/data.dart';

final itemsProvider = StateNotifierProvider<ItemNotifier, ItemState>((ref) {
  final repository = ref.watch(itemsRepositoryProvider);
  final data = ref.watch(fireBaseAuthProvider);
  return ItemNotifier(repository, "${data.currentUser?.email}");
});
