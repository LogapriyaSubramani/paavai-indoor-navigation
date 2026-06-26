import 'package:flutter/material.dart';

class RouteInfoCard extends StatelessWidget {
  final double distance;
  final int time;

  const RouteInfoCard({
    super.key,
    required this.distance,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Icon(Icons.route),
                const SizedBox(height: 5),
                Text(
                  "${distance.toStringAsFixed(0)} m",
                ),
              ],
            ),
            Column(
              children: [
                const Icon(Icons.directions_walk),
                const SizedBox(height: 5),
                Text("$time min"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}