import 'package:flutter/material.dart';
import 'package:iottive_pract/common/app_text_field.dart';
import 'package:iottive_pract/config/app_colors.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String)? onChanged;

  const SearchBarWidget({super.key, this.onChanged});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AppTextField(
          controller: _controller,
          fillColor: AppColors.grayShade,
          isFilled: true,
          hintText: 'Search here',
          prefixWidget: Icon(Icons.search, color: AppColors.grayDark),
          // suffixWidget: ValueListenableBuilder(
          //   valueListenable: _controller,
          //   builder: (context, value, child) {
          //     return value.text.isNotEmpty
          //         ? IconButton(
          //           icon: Icon(Icons.clear, color: AppColors.grayDark),
          //           onPressed: () {
          //             _controller.clear();
          //             widget.onChanged?.call('');
          //           },
          //         )
          //         : const SizedBox.shrink();
          //   },
          // ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
