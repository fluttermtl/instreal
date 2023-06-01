import 'dart:convert';

import 'content_model.dart';

class InstrealService {
  Future<List<Content>> get() async {
    final rawContents = jsonDecode(mockDate);
    if (rawContents case {'data': List contents}) {
      return [for (final content in contents) Content.fromJson(content)];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}
