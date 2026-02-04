import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/routes/route_name.dart';

class AddNewDevicePage extends ConsumerStatefulWidget {
  const AddNewDevicePage({super.key});

  @override
  ConsumerState<AddNewDevicePage> createState() => _AddNewDevicePageState();
}

class _AddNewDevicePageState extends ConsumerState<AddNewDevicePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final MapController _mapController = MapController();
  LatLng _currentLatLng = const LatLng(-6.5971, 106.8060);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Tambah Perangkat'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.vertical,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nodelink
                RowTitle(title: "Nodelink"),
                const SizedBox(height: 8),
                FormInput(
                  textController: _nameController,
                  hintText: "Masukan nodelink perangkat",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nodelink tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Serial Number Model
                RowTitle(title: "Serial Number Modem"),
                const SizedBox(height: 8),
                FormInput(
                  textController: _emailController,
                  hintText: "Masukan serial number modem",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Serial number modem tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Alamat
                RowTitle(title: "Alamat"),
                const SizedBox(height: 8),
                FormInput(
                  textController: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  hintText: "Masukan alamat perangkat",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Koordinat
                RowTitle(title: "Koordinat Lokasi"),
                const SizedBox(height: 8),
                FormInput(
                  textController: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  hintText: "Masukan koordinat perangkat",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Koordinat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.amber,
                  ),
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: _currentLatLng,
                      initialZoom: 15.0,
                      onTap: (tapPosition, point) {},
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Button(
                    text: "Tandai Lokasi",
                    height: 44,
                    width: MediaQuery.of(context).size.width * 0.5,
                    onPressed: () {
                      context.goNamed(RouteName.deviceCoordinatePage);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(PaddingSize.horizontal),
        child: Button(
          text: "Simpan",
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // context.goNamed(RouteName.);
            }
          },
        ),
      ),
    );
  }
}
