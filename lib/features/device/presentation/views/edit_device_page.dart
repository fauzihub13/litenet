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
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/features/device/presentation/controllers/get_all_device_provider.dart';
import 'package:litenet/features/device/presentation/controllers/get_detail_device_provider.dart';
import 'package:litenet/features/device/presentation/controllers/update_device_provider.dart';
import 'package:litenet/routes/route_name.dart';

class EditDevicePage extends HookConsumerWidget {
  final String deviceId;
  final double? latitude;
  final double? longitude;
  final String? reqName;
  final String? redNodelink;
  final String? reqKitSerialNumber;
  final String? reqAddress;
  final bool? reqStatus;

  const EditDevicePage({
    super.key,
    required this.deviceId,
    this.latitude,
    this.longitude,
    this.reqName,
    this.redNodelink,
    this.reqKitSerialNumber,
    this.reqAddress,
    this.reqStatus,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final locationController = useTextEditingController();
    final addressController = useTextEditingController();
    final mapController = useMemoized(() => MapController());
    final currentLatLng = useState<LatLng>(const LatLng(-6.5971, 106.8060));
    final asyncDetailDevice = ref.watch(
      getDetailDeviceProvider(deviceId: deviceId),
    );
    final asyncUpdateDevice = ref.watch(updateDeviceProvider);
    final isActive = useState(true);

    useEffect(() {
      asyncDetailDevice.whenData((data) {
        nameController.text = data.data.name;
        addressController.text = data.data.address;
        addressController.text = data.data.address;
        final newPos = LatLng(data.data.latitude, data.data.longitude);
        currentLatLng.value = newPos;
        locationController.text =
            '${data.data.latitude}, ${data.data.longitude}';
        isActive.value = data.data.status == 'active';
      });
      if (latitude != null && longitude != null) {
        locationController.text = "$latitude, $longitude";
        nameController.text = reqName ?? '';
        addressController.text = reqAddress ?? '';
        final newReqPos = LatLng(latitude!, longitude!);
        currentLatLng.value = newReqPos;
        isActive.value = reqStatus ?? true;
      }
      return null;
    }, [asyncDetailDevice]);

    ref.listen(updateDeviceProvider, (previous, next) {
      next.when(
        data: (data) async {
          if (data != null) {
            ref.invalidate(getDetailDeviceProvider(deviceId: deviceId));
            ref.invalidate(getAllDeviceProvider);
            context.showSuccess(data.message);
            // context.pushReplacementNamed(RouteName.detailMonitoringPage);
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
      appBar: CustomAppbar(title: 'Edit Perangkat'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.vertical,
        ),
        child: asyncDetailDevice.when(
          data: (data) {
            return Form(
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
                    // Alamat
                    RowTitle(title: "Detail Alamat"),
                    const SizedBox(height: 8),
                    FormInput(
                      textController: addressController,
                      hintText: "Masukan detail alamat perangkat",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Detail alamat tidak boleh kosong';
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
                          initialCenter: currentLatLng.value,
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
                                point: currentLatLng.value,
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
                          context.pushReplacementNamed(
                            RouteName.deviceCoordinatePage,
                            extra: {
                              'reqName': nameController.text,
                              'redNodelink': data.data.nodelink,
                              'reqKitSerialNumber': data.data.kitSerialNumber,
                              'reqAddress': addressController.text,
                              'deviceId': deviceId,
                              'latitude': latitude ?? data.data.latitude,
                              'longitude': longitude ?? data.data.longitude,
                              'isEdit': true,
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Koordinat
                    RowTitle(title: "Status Perangkat"),
                    const SizedBox(height: 8),
                    Switch(
                      value: isActive.value,
                      activeThumbColor: DefaultColors.purple500,
                      activeTrackColor: DefaultColors.purple100,
                      inactiveThumbColor: DefaultColors.black200,
                      inactiveTrackColor: DefaultColors.purple50,
                      onChanged: (value) {
                        isActive.value = !isActive.value;
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, _) {
            String errorMessage =
                (error as Failure).message ?? 'Terjadi kesalahan';
            return EmptyState(message: errorMessage, isRefreshable: true);
          },
          loading: () {
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: asyncDetailDevice.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(PaddingSize.horizontal),
            child: Button(
              text: "Simpan",
              isDisabled: asyncUpdateDevice.isLoading,
              isLoading: asyncUpdateDevice.isLoading,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ref
                      .read(updateDeviceProvider.notifier)
                      .updateDevice(
                        deviceId: deviceId,
                        name: nameController.text,
                        address: addressController.text,
                        kitSerialNumber: data.data.kitSerialNumber,
                        nodelink: data.data.nodelink,
                        latitude: latitude ?? data.data.latitude,
                        longitude: longitude ?? data.data.longitude,
                        status: isActive.value,
                      );
                }
              },
            ),
          );
        },
        error: (err, _) {
          return SizedBox();
        },
        loading: () {
          return SizedBox();
        },
      ),
    );
  }
}
