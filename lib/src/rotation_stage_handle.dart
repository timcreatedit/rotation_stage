import 'package:flutter/material.dart';
import 'package:rotation_stage/src/model/rotation_stage_side.dart';
import 'package:rotation_stage/src/rotation_stage_labels.dart';

class RotationStageHandle extends StatelessWidget {
  const RotationStageHandle({
    super.key,
    required this.side,
    required this.active,
    required this.onTap,
    required this.backgroundTransparent,
  });

  final RotationStageSide side;
  final bool active;
  final bool backgroundTransparent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final labels = RotationStageLabels.of(context);
    final name = labels.getForSide(side);
    return Center(
      child: ChoiceChip(
        onSelected: (_) => onTap(),
        label: Text(
          name.toUpperCase(),
          style: Theme.of(context).textTheme.button?.copyWith(
                color: active
                    ? colorScheme.onSecondary
                    : colorScheme.onSecondaryContainer,
              ),
        ),
        selected: active,
        disabledColor: Colors.transparent,
        shadowColor:
            backgroundTransparent ? Colors.transparent : colorScheme.shadow,
        selectedShadowColor:
            backgroundTransparent ? Colors.transparent : colorScheme.primary,
        backgroundColor: backgroundTransparent
            ? Colors.transparent
            : colorScheme.primaryContainer,
        selectedColor:
            backgroundTransparent ? Colors.transparent : colorScheme.primary,
      ),
    );
  }
}
