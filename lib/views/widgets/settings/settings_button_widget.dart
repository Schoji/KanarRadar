import 'package:flutter/material.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget({
    super.key,
    required this.title,
    required this.icon,
    this.chevron,
    this.color,
    this.rightText,
  });

  final String title;
  final IconData icon;
  final Color? color;
  final bool? chevron;
  final String? rightText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              Icon(icon, color: color,),
              Expanded(child: Text(title)),
              if (chevron != false) 
                  Icon(Icons.chevron_right),
              if (rightText != null) 
                Text(rightText!)
            ],
          ),
        ),
      ),
    );
  }
}
