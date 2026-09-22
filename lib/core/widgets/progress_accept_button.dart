import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

class ProgressAcceptButton extends StatefulWidget {
  final VoidCallback onAccept;
  final Duration duration;
  final bool autoStart;
  final String label;

  const ProgressAcceptButton({
    super.key,
    required this.onAccept,
    this.duration = const Duration(seconds: 10),
    this.autoStart = true,
    this.label = AppStrings.accept,
  });

  @override
  State<ProgressAcceptButton> createState() => _ProgressAcceptButtonState();
}

class _ProgressAcceptButtonState extends State<ProgressAcceptButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    if (widget.autoStart) {
      _controller.forward();
    }
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_completed) {
        _completed = true;
        widget.onAccept();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_completed) return;
    _completed = true;
    _controller.stop();
    widget.onAccept();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Material(
              color: AppColors.primary,
              child: InkWell(
                onTap: _handleTap,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: _controller.value,
                        heightFactor: 1,
                        child: Container(color: AppColors.primaryDark),
                      ),
                    ),
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
