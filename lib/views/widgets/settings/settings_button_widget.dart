import 'package:flutter/material.dart';
import 'package:kontrole/data/notifiers.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget({
    super.key,
    required this.title,
    this.icon,
    this.chevron,
    this.color,
    this.rightText,
    this.onTap,
  });

  final String title;
  final IconData? icon;
  final Color? color;
  final bool? chevron;
  final String? rightText;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    Color secondaryTextColor = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.6);
    return InkWell(
      
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              if (icon != null)
              Icon(icon, color: color ?? accentColor.value),
              Expanded(child: Text(title)),
              if (rightText != null) 
                Text(rightText!, style: TextStyle(color: secondaryTextColor)),
              if (chevron != false) 
                  Icon(Icons.chevron_right, color: secondaryTextColor),
            ],
          ),
        ),
      ),
    );
  }
}
