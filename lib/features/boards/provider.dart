import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'data/filter_notifier.dart';

final filterProvider = NotifierProvider<FilterNotifier, List<String>>(
  FilterNotifier.new,
);
