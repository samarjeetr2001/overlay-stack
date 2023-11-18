import 'package:flutter/material.dart';
import 'package:flutter_application/components/icon_with_background.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AnimatedExpansionTile extends StatefulWidget {
  final List<Widget> collapsedBody;
  final List<Widget> expandedBody;
  final String ctaLabel;

  /// isCollapsed will decide whether to show an expanded or collapsed state
  final bool isCollapsed;

  /// expandedHeight is max height of tile in expanded state
  final double expandedHeight;

  /// onExpansionChanged will be called when state of tile is changed
  final void Function(bool) onExpansionChanged;

  const AnimatedExpansionTile({
    super.key,
    required this.collapsedBody,
    required this.ctaLabel,
    required this.expandedBody,
    required this.onExpansionChanged,
    required this.expandedHeight,
    this.isCollapsed = true,
  });

  @override
  State<AnimatedExpansionTile> createState() => _AnimatedExpansionTileState();
}

class _AnimatedExpansionTileState extends State<AnimatedExpansionTile> {
  final duration = const Duration(milliseconds: 500);
  final borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );
  late bool showLoader;
  late bool isExpanded;
  late double height;

  @override
  void initState() {
    height = widget.expandedHeight;
    isExpanded = true;
    showLoader = false;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimatedExpansionTile oldWidget) {
    if (oldWidget.isCollapsed != widget.isCollapsed) {
      setState(
        () {
          isExpanded = !widget.isCollapsed;
          showLoader = true;
          height = isExpanded ? widget.expandedHeight : 100;
        },
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return AnimatedContainer(
      duration: duration,
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.8),
            offset: const Offset(0.0, -1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      onEnd: () {
        setState(() {
          showLoader = false;
        });
      },
      child: showLoader
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: LoadingAnimationWidget.stretchedDots(
                    color: colorScheme.onBackground,
                    size: 50,
                  ),
                ),
              ],
            )
          : isExpanded
              ? SizedBox(
                  width: double.infinity,
                  height: widget.expandedHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...widget.expandedBody,
                      GestureDetector(
                        onTap: _changeTileState,
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: borderRadius,
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              widget.ctaLabel,
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: colorScheme.onPrimary),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: _changeTileState,
                  child: _CollapsedWidget(
                    borderRadius: borderRadius,
                    child: widget.collapsedBody,
                  ),
                ),
    );
  }

  void _changeTileState() {
    widget.onExpansionChanged(isExpanded);
  }
}

class _CollapsedWidget extends StatelessWidget {
  final List<Widget> child;
  final BorderRadiusGeometry borderRadius;
  const _CollapsedWidget({required this.child, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: colorScheme.tertiaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: child,
            ),
          ),
          IconWithBackground.large(icon: Icons.arrow_drop_down_rounded),
        ],
      ),
    );
  }
}
