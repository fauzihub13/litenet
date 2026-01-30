import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http; // Import http
import 'package:latlong2/latlong.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/form_input.dart';

class CoordinateDevicePage extends StatefulWidget {
  const CoordinateDevicePage({super.key});

  @override
  State<CoordinateDevicePage> createState() => _CoordinateDevicePageState();
}

class _CoordinateDevicePageState extends State<CoordinateDevicePage> {
  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _coordinatController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final MapController _mapController =
      MapController(); // Controller untuk gerakin peta

  LatLng _currentLatLng = const LatLng(-6.5971, 106.8060);
  bool _isSearching = false;

  // Fungsi Pencarian menggunakan Nominatim OSM
  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) return;

    setState(() => _isSearching = true);

    try {
      final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1',
      );
      final response = await http.get(
        url,
        headers: {
          'User-Agent': 'LiteNet_App', // Penting agar tidak diblokir OSM
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        if (data.isNotEmpty) {
          final lat = double.parse(data[0]['lat']);
          final lon = double.parse(data[0]['lon']);
          final newPos = LatLng(lat, lon);

          setState(() {
            _currentLatLng = newPos;
            _coordinatController.text = "$lat, $lon";
          });

          // Gerakkan kamera peta ke lokasi baru
          _mapController.move(newPos, 15.0);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Lokasi tidak ditemukan")),
          );
        }
      }
    } catch (e) {
      print("⚠️ Error search: $e");
    } finally {
      setState(() => _isSearching = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Lokasi Perangkat', isRounded: false),
      body: Stack(
        children: [
          // 1. MAP VIEW
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLatLng,
              initialZoom: 15.0,
              onTap: (tapPosition, point) {
                setState(() {
                  _currentLatLng = point;
                  _coordinatController.text =
                      "${point.latitude}, ${point.longitude}";
                });
              },
              interactionOptions: const InteractionOptions(
                flags:
                    InteractiveFlag.doubleTapZoom |
                    InteractiveFlag.drag |
                    InteractiveFlag.pinchZoom,
              ),
            ),
            children: [
              // TileLayer(
              //   urlTemplate:
              //       'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
              //   subdomains: const ['a', 'b', 'c', 'd'],
              //   userAgentPackageName: 'com.litenet.app',
              // ),
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.litenet.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _currentLatLng,
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_on,
                      color: DefaultColors.purple500,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // 2. SEARCH BAR (Melayang di atas)
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: FormInput(
                textController: _searchController,
                hintText: "Cari lokasi",
                suffixIcon: _isSearching
                    ? Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(strokeWidth: 1),
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: DefaultColors.purple500,
                        ),
                        onPressed: () =>
                            _searchLocation(_searchController.text),
                      ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lokasi tidak boleh kosong';
                  }
                  _searchLocation(value);

                  return null;
                },
              ),
              // TextField(
              //   controller: _searchController,
              //   decoration: InputDecoration(
              //     hintText: "Cari lokasi atau alamat...",
              //     border: InputBorder.none,
              //     contentPadding: const EdgeInsets.symmetric(
              //       horizontal: 16,
              //       vertical: 14,
              //     ),
              //     suffixIcon: _isSearching
              //         ? const Padding(
              //             padding: EdgeInsets.all(12.0),
              //             child: CircularProgressIndicator(strokeWidth: 2),
              //           )
              //         : IconButton(
              //             icon: const Icon(
              //               Icons.search,
              //               color: DefaultColors.purple500,
              //             ),
              //             onPressed: () =>
              //                 _searchLocation(_searchController.text),
              //           ),
              //   ),
              //   onSubmitted: (value) => _searchLocation(value),
              // ),
            ),
          ),

          // 3. BOTTOM CARD (Input Koordinat)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(PaddingSize.horizontal),
              decoration: const BoxDecoration(
                color: DefaultColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Koordinat Lokasi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: DefaultColors.purple500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormInput(
                    textController: _coordinatController,
                    hintText: "Koordinat akan muncul di sini",
                    readOnly: true, // Agar user hanya input lewat peta/search
                  ),
                  const SizedBox(height: 20),
                  Button(
                    text: "Simpan Lokasi",
                    onPressed: () {
                      if (_coordinatController.text.isNotEmpty) {
                        // Aksi Simpan
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
