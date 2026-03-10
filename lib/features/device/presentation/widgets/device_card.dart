import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/extensions/datetime_context.ext.dart';
import 'package:litenet/core/extensions/string_context.ext.dart';
import 'package:litenet/features/device/domain/entities/device.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';

class DeviceCard extends ConsumerWidget {
  final DeviceDataEntity device;
  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.detailMonitoringPage,
          extra: {'deviceId': device.deviceId},
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: DefaultColors.purple100),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // Konten Utama Atas
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.quota,
                            width: 18,
                            height: 18,
                            colorFilter: const ColorFilter.mode(
                              DefaultColors.purple500,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Kuota",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: DefaultColors.purple800,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sisa Kuota",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: DefaultColors.black200,
                                  fontSize: 12,
                                ),
                          ),
                          Text(
                            "${device.quotaLeft / 1024} GB/${device.quotaTotal / 1024} GB",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: DefaultColors.purple700,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Linear Progress Bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: device.quotaTotal == 0
                              ? 0
                              : device.quotaLeft / device.quotaTotal,
                          minHeight: 8,
                          backgroundColor: DefaultColors.purple50,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            DefaultColors.purple500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Badge Online (Kanan Atas)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: const BoxDecoration(
                      color: DefaultColors.purple500,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      device.status.firstWordCapitalize(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Footer Biru Aktif Sejak
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: const BoxDecoration(
                color: DefaultColors.purple500,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              child: Text(
                "Aktif sejak ${device.activeSince.toIndonesianDateString()}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: DefaultColors.purple50,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
