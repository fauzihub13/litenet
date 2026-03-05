import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/features/device/presentation/controllers/claim_device_provider.dart';
import 'package:litenet/routes/route_name.dart';

class AddNewDevicePage extends HookConsumerWidget {
  final double? latitude;
  final double? longitude;
  final String? reqName;
  final String? redNodelink;
  final String? reqKitSerialNumber;
  final String? reqAddress;

  const AddNewDevicePage(
    this.latitude,
    this.longitude,
    this.reqName,
    this.redNodelink,
    this.reqKitSerialNumber,
    this.reqAddress, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final nodelinkController = useTextEditingController();
    final kitSerialNumberController = useTextEditingController();
    final locationController = useTextEditingController();
    final addressController = useTextEditingController();
    final mapController = useMemoized(() => MapController());
    LatLng currentLatLng = const LatLng(-6.5971, 106.8060);

    if (latitude != null && longitude != null) {
      currentLatLng = LatLng(latitude!, longitude!);
      locationController.text = "$latitude, $longitude";
      nameController.text = reqName ?? '';
      nodelinkController.text = redNodelink ?? '';
      kitSerialNumberController.text = reqKitSerialNumber ?? '';
      addressController.text = reqAddress ?? '';
    }

    final asyncClaimDevice = ref.watch(claimDeviceProvider);

    ref.listen(claimDeviceProvider, (previous, next) {
      next.when(
        data: (data) async {
          if (data != null) {
            context.showSuccess(data.message);
            context.goNamed(RouteName.monitoringPage);
          }
        },
        error: (err, _) {
          final error = err as Failure;
          context.showError(error.message ?? 'Terjadi kesalahan');
        },
        loading: () {},
      );
    });

    return Scaffold(
      appBar: CustomAppbar(title: 'Tambah Perangkat'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.vertical,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                RowTitle(title: "Nama Perangkat"),
                const SizedBox(height: 8),
                FormInput(
                  textController: nameController,
                  hintText: "Masukan nama perangkat",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Nodelink
                RowTitle(title: "Nodelink"),
                const SizedBox(height: 8),
                FormInput(
                  textController: nodelinkController,
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
                RowTitle(title: "Kit Serial Number Modem"),
                const SizedBox(height: 8),
                FormInput(
                  textController: kitSerialNumberController,
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
                  textController: addressController,
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
                  textController: locationController,
                  readOnly: true,
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
                    mapController: mapController,
                    options: MapOptions(
                      initialCenter: currentLatLng,
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
                            point: currentLatLng,
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
                      context.pushNamed(
                        RouteName.deviceCoordinatePage,
                        extra: {
                          'reqName': nameController.text,
                          'redNodelink': nodelinkController.text,
                          'reqKitSerialNumber': kitSerialNumberController.text,
                          'reqAddress': addressController.text,
                        },
                      );
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
          isDisabled: asyncClaimDevice.isLoading,
          isLoading: asyncClaimDevice.isLoading,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              ref
                  .read(claimDeviceProvider.notifier)
                  .claimDevice(
                    name: nameController.text,
                    address: addressController.text,
                    kitSerialNumber: kitSerialNumberController.text,
                    nodelink: nodelinkController.text,
                    latitude: latitude!,
                    longitude: longitude!,
                  );
            }
          },
        ),
      ),
    );
  }
}
