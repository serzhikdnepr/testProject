import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'datasource.dart';

final itemDatasourceProvider = Provider<ItemsDatasource>((ref) {
  return ItemsDatasource();
});
