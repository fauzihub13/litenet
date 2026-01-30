import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_badge.dart';
import 'package:litenet/gen/assets.gen.dart';

class DetailDevicePage extends StatefulWidget {
  const DetailDevicePage({super.key});

  @override
  State<DetailDevicePage> createState() => _DetailDevicePageState();
}

class _DetailDevicePageState extends State<DetailDevicePage> {
  final MapController _mapController = MapController();
  LatLng _currentLatLng = const LatLng(-6.5971, 106.8060);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Detail Perangkat', isLeading: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CustomBadge(
                text: 'Online',
                backgroundColor: DefaultColors.purple500,
                textColor: DefaultColors.purple50,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                paddingHorizontal: 10,
                paddingVertical: 4,
                borderRadius: 10,
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
                    'Perangkat 1',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.purple700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "Jl. Sholeh Iskandar No 5, Kota Bogor, Jawa Barat",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: DefaultColors.black200,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 16),

              // Detail Device
              _buildQuotaMonitorCard(context),
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
              _buildTechnicalDetail(context, 'Pemilik', 'Tonal Drump'),
              _buildTechnicalDetail(context, 'Nodelink', '5678998'),
              _buildTechnicalDetail(
                context,
                'Serial Number Modem',
                'KIT02984735',
              ),
              _buildTechnicalDetail(context, 'Aktif Sejak', '20 Agustus 2025'),
              _buildTechnicalDetail(context, 'Latitude', '-6.572596310698561'),
              _buildTechnicalDetail(context, 'Longitude', '106.80774260648441'),

              // TODO: GOOGLE MAPS PREVIEW
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: 10,
        ),
        child: Button(
          text: "Beli Kuota",
          onPressed: () {
            //  Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) {},
            //     ),
            //   );
          },
        ),
      ),
    );
  }
}

Widget _buildQuotaMonitorCard(BuildContext context) {
  return Container(
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
                child: const LinearProgressIndicator(
                  value: 0.8, // 28/30
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
                    TextSpan(text: "28 GB"),
                    TextSpan(
                      text: "/30 GB",
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
