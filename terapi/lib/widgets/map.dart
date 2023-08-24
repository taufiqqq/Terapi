import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Adjust the height to fit your needs
      child: FlutterMap(
        options: MapOptions(
          center:
              LatLng(3.1390, 101.6869), // Kuala Lumpur's latitude and longitude
          zoom: 12.0,
        ),
        nonRotatedChildren: [
          GestureDetector(
            onTap: () async {
              const url = 'https://openstreetmap.org/copyright';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: RichText(
              text: TextSpan(
                text: 'OpenStreetMap contributors',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}
