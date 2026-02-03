import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/helper/permission.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/form_input.dart';

class CoordinateDevicePage extends StatefulWidget {
  const CoordinateDevicePage({super.key});

  @override
  State<CoordinateDevicePage> createState() => _CoordinateDevicePageState();
}

class _CoordinateDevicePageState extends State<CoordinateDevicePage>
    with TickerProviderStateMixin {
  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Ambil posisi kamera saat ini
    final latTween = Tween<double>(
      begin: _mapController.camera.center.latitude,
      end: destLocation.latitude,
    );
    final lngTween = Tween<double>(
      begin: _mapController.camera.center.longitude,
      end: destLocation.longitude,
    );
    final zoomTween = Tween<double>(
      begin: _mapController.camera.zoom,
      end: destZoom,
    );

    // Buat AnimationController
    final controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Tentukan kurva animasi (misal: fastOutSlowIn agar terlihat natural)
    final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );

    controller.addListener(() {
      _mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
      );
    });

    // Hapus controller setelah selesai
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  final TextEditingController _coordinatController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final MapController _mapController = MapController();
  Timer? _debounce;

  LatLng? _currentLatLng;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    final latLng = await LocationHelper.initLocation();

    if (latLng != null) {
      setState(() {
        _currentLatLng = latLng;
        // Update juga controller koordinat jika ada
        _coordinatController.text = "${latLng.latitude}, ${latLng.longitude}";
      });

      // Gunakan latLng langsung agar lebih instan dan aman
      // _mapController.move(latLng, 15.0);
      await Future.delayed(const Duration(milliseconds: 1000));
      _animatedMapMove(latLng, 15.0);
    } else {
      if (mounted) {
        // Cek mounted agar tidak error jika user sudah pindah page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Izin lokasi ditolak atau GPS tidak aktif"),
          ),
        );
      }
    }
  }

  // Variabel baru untuk menampung hasil saran pencarian
  List<dynamic> _searchResults = [];
  bool _showSuggestions = false;

  // Fungsi untuk mendapatkan daftar saran lokasi saat mengetik
  Future<void> _getSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _showSuggestions = false;
      });
      return;
    }

    setState(() => _isSearching = true);

    try {
      // Kita ambil limit 5 agar tidak terlalu panjang
      final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5&addressdetails=1',
      );
      final response = await http.get(
        url,
        headers: {'User-Agent': 'LiteNet_App'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _searchResults = data;
          _showSuggestions = data.isNotEmpty;
        });
      }
    } catch (e) {
      debugPrint("⚠️ Error suggestions: $e");
    } finally {
      setState(() => _isSearching = false);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel(); // Batalkan timer jika ada
    _searchController.dispose();
    _coordinatController.dispose();
    super.dispose();
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
              initialCenter: _currentLatLng ?? const LatLng(-2.5489, 118.0149),
              initialZoom: _currentLatLng == null ? 4.0 : 15.0,
              onTap: (tapPosition, point) {
                setState(() {
                  _currentLatLng = point;
                  _coordinatController.text =
                      "${point.latitude}, ${point.longitude}";
                  _showSuggestions =
                      false; // Sembunyikan saran jika peta di-tap
                });
                FocusScope.of(context).unfocus();
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.litenet.app',
              ),
              MarkerLayer(
                markers: _currentLatLng == null
                    ? []
                    : [
                        Marker(
                          point: _currentLatLng!,
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

          // 2. SEARCH BAR & SUGGESTIONS
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
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
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();

                      // Mulai timer baru
                      _debounce = Timer(const Duration(milliseconds: 500), () {
                        if (value.isNotEmpty) {
                          _getSuggestions(value);
                        } else {
                          setState(() {
                            _searchResults = [];
                            _showSuggestions = false;
                          });
                        }
                      });
                    }, // Cari saat mengetik
                    suffixIcon: _isSearching
                        ? Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.all(10.0),
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          )
                        : IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: DefaultColors.purple500,
                            ),
                            onPressed: () =>
                                _getSuggestions(_searchController.text),
                          ),
                  ),
                ),

                // DAFTAR SARAN (MUNCUL JIKA ADA HASIL)
                if (_showSuggestions)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    constraints: const BoxConstraints(maxHeight: 250),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ],
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: _searchResults.length,
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final place = _searchResults[index];
                        return ListTile(
                          leading: const Icon(
                            Icons.location_on_outlined,
                            color: DefaultColors.purple500,
                          ),
                          title: Text(
                            place['display_name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13),
                          ),
                          onTap: () {
                            final lat = double.parse(place['lat']);
                            final lon = double.parse(place['lon']);
                            final newPos = LatLng(lat, lon);

                            setState(() {
                              _currentLatLng = newPos;
                              _coordinatController.text = "$lat, $lon";
                              _searchController.text = place['display_name'];
                              _showSuggestions = false;
                            });

                            _mapController.move(newPos, 15.0);
                            FocusScope.of(context).unfocus();
                          },
                        );
                      },
                    ),
                  ),
              ],
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
                    readOnly: true,
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
