import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PremiumCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double radius;
  final bool enableHover;

  const PremiumCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.only(bottom: 16),
    this.radius = 24,
    this.enableHover = true,
  });

  @override
  State<PremiumCard> createState() => _PremiumCardState();
}

class _PremiumCardState extends State<PremiumCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (widget.enableHover) setState(() => isHover = true);
      },
      onExit: (_) {
        if (widget.enableHover) setState(() => isHover = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: double.infinity,
        margin: widget.margin,
        padding: widget.padding,
        transform: Matrix4.translationValues(0, isHover ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(
            color: isHover
                ? AppColors.primary.withOpacity(0.22)
                : AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHover ? 0.10 : 0.05),
              blurRadius: isHover ? 28 : 18,
              offset: Offset(0, isHover ? 14 : 10),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}