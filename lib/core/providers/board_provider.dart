import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../features/boards/data/filter_notifier.dart';

final filterProvider = NotifierProvider.autoDispose<FilterNotifier, List<String>>(
  FilterNotifier.new,
);
