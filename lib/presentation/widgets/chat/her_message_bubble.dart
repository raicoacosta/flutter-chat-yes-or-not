import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color.secondary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      _ImageBobble(message.imageUrl!),
      const SizedBox(height: 10),
    ]);
  }
}

class _ImageBobble extends StatelessWidget {
  final String _imageBobble;
  const _ImageBobble(this._imageBobble);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        _imageBobble,
        height: 150,
        width: size.width * 0.7,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: 150,
            width: size.width * 0.7,
          );
        },
      ),
    );
  }
}
