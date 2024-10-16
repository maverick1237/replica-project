import 'package:alnair/src/utils/styles.dart';
import 'package:alnair/src/utils/utilities.dart';
import 'package:flutter/material.dart';

class FilterPill extends StatefulWidget {
  final String title;
  final List<String> listOptions;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;

  const FilterPill({
    super.key,
    required this.title,
    required this.listOptions,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  State<FilterPill> createState() => _FilterPillState();
}

class _FilterPillState extends State<FilterPill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: widget.selectedOption == null
          ? PillStyles.pillNonActive
          : PillStyles.pillActive,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.selectedOption != null) ...[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 24,
                height: 24,
                child: GestureDetector(
                  onTap: () {
                    widget.onChanged(null);
                  },
                  child: const Icon(Icons.clear, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
          GestureDetector(
            onTap: () {
              openBottomFilterSheet(
                  context, widget.title, widget.listOptions, widget.onChanged);
            },
            child: Row(
              children: [
                Text(
                  widget.selectedOption ?? widget.title,
                  style: TextStyle(
                    color: widget.selectedOption == null
                        ? Colors.black54
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: widget.selectedOption == null
                      ? const Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.black54,
                        )
                      : const Icon(
                          Icons.arrow_downward_outlined,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
