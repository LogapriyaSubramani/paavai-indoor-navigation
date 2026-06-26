import '../models/graph_edge.dart';

class PathFinder {
  final List<GraphEdge> edges;

  PathFinder(this.edges);

  List<String> findShortestPath(String start, String end) {
    final graph = <String, List<GraphEdge>>{};

    for (final edge in edges) {
      graph.putIfAbsent(edge.from, () => []);
      graph.putIfAbsent(edge.to, () => []);

      graph[edge.from]!.add(edge);

      graph[edge.to]!.add(
        GraphEdge(
          from: edge.to,
          to: edge.from,
          distance: edge.distance,
        ),
      );
    }

    final distances = <String, double>{};
    final previous = <String, String?>{};
    final visited = <String>{};

    for (final node in graph.keys) {
      distances[node] = double.infinity;
      previous[node] = null;
    }

    distances[start] = 0;

    while (visited.length < graph.length) {
      String? current;
      double minDistance = double.infinity;

      distances.forEach((node, distance) {
        if (!visited.contains(node) && distance < minDistance) {
          minDistance = distance;
          current = node;
        }
      });

      if (current == null) break;

      visited.add(current!);

      for (final edge in graph[current]!) {
        final newDistance = distances[current]! + edge.distance;

        if (newDistance < distances[edge.to]!) {
          distances[edge.to] = newDistance;
          previous[edge.to] = current;
        }
      }
    }

    final path = <String>[];
    String? step = end;

    while (step != null) {
      path.insert(0, step);
      step = previous[step];
    }

    return path;
  }

  double calculateDistance(List<String> path) {
    double total = 0;

    for (int i = 0; i < path.length - 1; i++) {
      for (final edge in edges) {
        if ((edge.from == path[i] && edge.to == path[i + 1]) ||
            (edge.to == path[i] && edge.from == path[i + 1])) {
          total += edge.distance;
        }
      }
    }

    return total;
  }

  int walkingTime(double distance) {
    return (distance / 70).round();
  }
}