import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/extensions/datetime_context.ext.dart';
import 'package:litenet/core/extensions/string_context.ext.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_badge.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/features/device/presentation/controllers/get_detail_device_provider.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class DetailDevicePage extends HookConsumerWidget {
  final String deviceId;
  const DetailDevicePage({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useMemoized(() => MapController());
    final currentLatLng = useState(const LatLng(0, 0));
    final asyncDetailDevice = ref.watch(
      getDetailDeviceProvider(deviceId: deviceId),
    );

    ref.listen(getDetailDeviceProvider(deviceId: deviceId), (previous, next) {
      next.when(
        data: (data) {
          currentLatLng.value = LatLng(data.data.latitude, data.data.longitude);
        },
        error: (_, __) {},
        loading: () {},
      );
    });

    return Scaffold(
      appBar: CustomAppbar(title: 'Detail Perangkat', isLeading: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(getDetailDeviceProvider(deviceId: deviceId));
          },
          child: asyncDetailDevice.when(
            data: (data) {
              DeviceDataEntity device = data.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBadge(
                          text: device.status.firstWordCapitalize(),
                          backgroundColor: DefaultColors.purple500,
                          textColor: DefaultColors.purple50,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          paddingHorizontal: 10,
                          paddingVertical: 4,
                          borderRadius: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              RouteName.historyDevicePage,
                              extra: {'deviceId': deviceId},
                            );
                          },
                          child: Wrap(
                            spacing: 4,
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "Riwayat Perangkat",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: DefaultColors.purple500,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Transform.flip(
                                flipX: true,
                                child: SvgPicture.asset(
                                  height: 16,
                                  Assets.icons.arrowBack,
                                  colorFilter: const ColorFilter.mode(
                                    DefaultColors.purple500,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.device,
                          colorFilter: const ColorFilter.mode(
                            DefaultColors.purple500,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          device.name,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: DefaultColors.purple700,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      device.address,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DefaultColors.black200,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Detail Device
                    _buildQuotaMonitorCard(context: context, device: device),
                    const SizedBox(height: 16),
                    Text(
                      "Detail Perangkat",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: DefaultColors.purple500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildTechnicalDetail(context, 'Pemilik', device.userName),
                    _buildTechnicalDetail(context, 'Nodelink', device.nodelink),
                    _buildTechnicalDetail(
                      context,
                      'Serial Number Modem',
                      device.kitSerialNumber,
                    ),
                    _buildTechnicalDetail(
                      context,
                      'Aktif Sejak',
                      device.activeSince.toIndonesianDateString(),
                    ),
                    _buildTechnicalDetail(
                      context,
                      'Latitude',
                      device.latitude.toString(),
                    ),
                    _buildTechnicalDetail(
                      context,
                      'Longitude',
                      device.longitude.toString(),
                    ),

                    Text(
                      'Preview Lokasi',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DefaultColors.purple500,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.only(bottom: 20),
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
                  ],
                ),
              );
            },
            error: (error, _) {
              String errorMessage =
                  (error as Failure).message ?? 'Terjadi kesalahan';
              return EmptyState(message: errorMessage, isRefreshable: true);
            },
            loading: () {
              return Expanded(
                child: Center(child: const CircularProgressIndicator()),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSize.horizontal,
            // vertical: 10,
          ),
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: Button(
                  text: "Edit",
                  textColor: DefaultColors.purple600,
                  borderColor: Colors.transparent,
                  backgroundColor: DefaultColors.purple50,
                  onPressed: () {
                    context.pushNamed(
                      RouteName.editDevicePage,
                      extra: {'deviceId': deviceId},
                    );
                  },
                ),
              ),
              Expanded(
                child: Button(
                  text: "Beli Kuota",
                  onPressed: () {
                    context.pushNamed(RouteName.productPage);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildQuotaMonitorCard({
  required BuildContext context,
  required DeviceDataEntity device,
}) {
  return GestureDetector(
    onTap: () {
      context.pushNamed(
        RouteName.topupHistoryDevicePage,
        extra: {'deviceId': device.deviceId},
      );
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          left: BorderSide(color: DefaultColors.purple500, width: 6.0),
        ),
        boxShadow: [
          BoxShadow(
            color: DefaultColors.purple100.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: DefaultColors.purple50,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.language,
              color: DefaultColors.purple500,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sisa Kuota",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: DefaultColors.purple500,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: device.quotaTotal == 0
                        ? 0
                        : device.quotaLeft / device.quotaTotal,
                    minHeight: 10,
                    backgroundColor: DefaultColors.purple50,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      DefaultColors.purple500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DefaultColors.purple500,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(text: "${device.quotaLeft / 1024} GB"),
                      TextSpan(
                        text: "/${device.quotaTotal / 1024} GB",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DefaultColors.black200,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTechnicalDetail(BuildContext context, String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: DefaultColors.purple500,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(color: DefaultColors.black200, fontSize: 14),
        ),
      ],
    ),
  );
}
