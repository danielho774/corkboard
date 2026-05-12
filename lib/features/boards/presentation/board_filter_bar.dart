import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider.dart';

class BoardFilterBar extends ConsumerWidget {
  final List<String> filters;

  const BoardFilterBar({super.key, required this.filters});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(filterProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) =>
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filter),
              showCheckmark: false,
              selected: selectedFilters.contains(filter),
              onSelected: (_) => ref.read(filterProvider.notifier).toggleFilter(filter),
            ),
          )
        ).toList(),
      ),
    );
  }
}