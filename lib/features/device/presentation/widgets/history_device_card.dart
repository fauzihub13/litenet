import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/extensions/datetime_context.ext.dart';
import 'package:litenet/features/device/domain/entities/history_device.dart';
import 'package:litenet/gen/assets.gen.dart';

class HistoryDeviceCard extends StatelessWidget {
  final HistoryDeviceDataEntity history;
  const HistoryDeviceCard({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DefaultColors.purple50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: DefaultColors.purple50.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: DefaultColors.purple50),
                ),
                child: SvgPicture.asset(
                  Assets.icons.device,
                  width: 32,
                  height: 32,
                  colorFilter: const ColorFilter.mode(
                    DefaultColors.purple100,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      history.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Lat: ${history.latitude}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DefaultColors.black200,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Long: ${history.longitude}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: DefaultColors.black200,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: DefaultColors.purple50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Diubah pada ${history.updatedAt.toIndonesianDateTimeStringPlus7()}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: DefaultColors.purple500,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
