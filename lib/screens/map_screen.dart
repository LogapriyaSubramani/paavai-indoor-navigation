import 'package:flutter/material.dart';

import '../models/location_model.dart';
import '../services/navigation_service.dart';
import '../widgets/map_painter.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LocationModel? source;
  LocationModel? destination;

  final TransformationController _controller =
      TransformationController();

  double _zoom = 1.0;

  bool showRoute = false;

  bool darkMode = false;

  bool showMarkers = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void zoomIn() {
    setState(() {
      _zoom += 0.2;
      _controller.value = Matrix4.identity()
        ..scale(_zoom);
    });
  }

  void zoomOut() {
    if (_zoom <= 1) return;

    setState(() {
      _zoom -= 0.2;
      _controller.value = Matrix4.identity()
        ..scale(_zoom);
    });
  }

  void resetNavigation() {
    setState(() {
      source = null;
      destination = null;
      showRoute = false;
    });
  }

  void startNavigation() {
    if (source == null ||
        destination == null) {
      return;
    }

    setState(() {
      showRoute = true;
    });
  }

  String getDistance() {
    if (source == null ||
        destination == null) {
      return "";
    }

    return NavigationService.getDistanceText(
      source!.x,
      source!.y,
      destination!.x,
      destination!.y,
    );
  }

  String getWalkingTime() {
    if (source == null ||
        destination == null) {
      return "";
    }

    return NavigationService.getWalkingTime(
      source!.x,
      source!.y,
      destination!.x,
      destination!.y,
    );
  }

  void showBuilding(LocationModel location) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(location.name),
          content: Text(
            "Coordinates\nX : ${location.x}\nY : ${location.y}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            )
          ],
        );
      },
    );
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      darkMode ? Colors.grey.shade900 : Colors.white,
      appBar: AppBar(
        backgroundColor:
          darkMode ? Colors.black : Colors.blue,
         foregroundColor: Colors.white,   
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "Paavai Indoor Navigation",
        ),

        actions: [

          IconButton(
            icon: Icon(
              darkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              setState(() {
                darkMode = !darkMode;
              });
            },
          ),

          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetNavigation,
          ),

        ],
      ),

      drawer: Drawer(

        child: ListView(

          children: [

            const DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.blue,
              ),

              child: Center(

                child: Text(
                  "Paavai Navigation",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),

            ),

            ListTile(
              leading: const Icon(Icons.map),
              title: const Text("Campus Map"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Locations"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {},
            ),

          ],

        ),

      ),

      body: SafeArea(

        child: Column(

          children: [

            const SizedBox(height: 10),

            Padding(

              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),

              child: DropdownButtonFormField<LocationModel>(

                value: source,

                decoration: const InputDecoration(

                  labelText: "Select Source",

                  border: OutlineInputBorder(),

                  prefixIcon: Icon(Icons.trip_origin),

                ),

                items: campusLocations
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),

                onChanged: (value) {

                  setState(() {

                    source = value;

                  });

                },

              ),

            ),

            const SizedBox(height: 12),

            Padding(

              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),

              child: DropdownButtonFormField<LocationModel>(

                value: destination,

                decoration: const InputDecoration(

                  labelText: "Select Destination",

                  border: OutlineInputBorder(),

                  prefixIcon: Icon(Icons.flag),

                ),

                items: campusLocations
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),

                onChanged: (value) {

                  setState(() {

                    destination = value;

                  });

                },

              ),

            ),

            const SizedBox(height: 15),
                        Row(
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.route),
                      label: const Text("Find Route"),
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size.fromHeight(50),
                      ),
                      onPressed: startNavigation,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 12),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.clear),
                      label: const Text("Reset"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        minimumSize:
                            const Size.fromHeight(50),
                      ),
                      onPressed: resetNavigation,
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 15),

            if (showRoute)

              Card(

                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),

                elevation: 5,

                child: Padding(

                  padding: const EdgeInsets.all(15),

                  child: Row(

                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,

                    children: [

                      Column(

                        children: [

                          const Icon(
                            Icons.straighten,
                            color: Colors.blue,
                          ),

                          const SizedBox(height: 5),

                          Text(
                            getDistance(),
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                        ],

                      ),

                      Column(

                        children: [

                          const Icon(
                            Icons.directions_walk,
                            color: Colors.green,
                          ),

                          const SizedBox(height: 5),

                          Text(
                            getWalkingTime(),
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                        ],

                      ),

                    ],

                  ),

                ),

              ),

            const SizedBox(height: 12),

            Expanded(

              child: InteractiveViewer(

                transformationController:
                    _controller,

                minScale: 0.5,

                maxScale: 5,

                child: Stack(

                  children: [
                    SizedBox(
                      width: 1000,
                      height: 800,
                      child: Image.asset(
                      "assets/paavai_map.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                    if (showRoute &&
                        source != null &&
                        destination != null)

                      Positioned.fill(

                        child: IgnorePointer(

                          child: CustomPaint(
                            size: const Size(1000, 800),
                            painter: MapPainter(

                              source: source!,

                              destination:
                                  destination!,

                            ),

                          ),

                        ),

                      ),
                                          if (showMarkers)

                      ...campusLocations.map(

                        (location) {

                          return Positioned(

                            left: location.x - 12,

                            top: location.y - 30,

                            child: GestureDetector(

                              onTap: () {

                                showBuilding(location);

                              },

                              child: Column(

                                children: [

                                  Icon(

                                    location == source
                                        ? Icons.trip_origin
                                        : location == destination
                                            ? Icons.flag
                                            : Icons.location_on,

                                    color: location == source
                                        ? Colors.green
                                        : location == destination
                                            ? Colors.red
                                            : Colors.orange,

                                    size: 28,

                                  ),

                                  Container(

                                    padding:
                                        const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 2,
                                    ),

                                    decoration: BoxDecoration(

                                      color: Colors.white,

                                      borderRadius:
                                          BorderRadius.circular(5),

                                    ),

                                    child: Text(

                                      location.name,

                                      style: const TextStyle(

                                        fontSize: 11,

                                        fontWeight:
                                            FontWeight.bold,

                                      ),

                                    ),

                                  ),

                                ],

                              ),

                            ),

                          );

                        },

                      ).toList(),

                    Positioned(

                      left:source?.x ?? 55,

                      top:source?.y ?? 520,

                      child: Container(

                        width: 18,

                        height: 18,

                        decoration: BoxDecoration(

                          color: Colors.blue,

                          borderRadius:
                              BorderRadius.circular(50),

                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),

                        ),

                      ),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),

      floatingActionButton: Column(

        mainAxisAlignment:
            MainAxisAlignment.end,

        children: [

          FloatingActionButton(

            heroTag: "zoom_in",

            mini: true,

            onPressed: zoomIn,

            child: const Icon(Icons.add),

          ),

          const SizedBox(height: 10),

          FloatingActionButton(

            heroTag: "zoom_out",

            mini: true,

            onPressed: zoomOut,

            child: const Icon(Icons.remove),

          ),

          const SizedBox(height: 10),

          FloatingActionButton(

            heroTag: "gps",

            onPressed: () {

              _controller.value = Matrix4.identity()
               ..translate(
                  -source!.x + 250,
                  -source!.y + 250,
                )
                ..scale(2);

            },

            child: const Icon(
              Icons.my_location,
            ),

          ),

        ],

      ),

    );

  }

}
