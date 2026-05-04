import 'package:flutter/material.dart';

class CodeBlock extends StatelessWidget {
  final String code;

  const CodeBlock(this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          code,
          style: const TextStyle(
            color: Color(0xFFA7F3D0),
            fontFamily: 'monospace',
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}