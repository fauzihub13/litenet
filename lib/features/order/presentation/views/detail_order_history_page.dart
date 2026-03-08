import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/errors/failure.dart';
import 'package:litenet/core/extensions/datetime_context.ext.dart';
import 'package:litenet/core/extensions/num_context.ext.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_snackbar.dart';
import 'package:litenet/core/widgets/empty_state.dart';
import 'package:litenet/features/order/domain/entities/detail_transaction.dart';
import 'package:litenet/features/order/presentation/controllers/download_invoice_provider.dart';
import 'package:litenet/features/order/presentation/controllers/get_detail_transaction_provider.dart';
import 'package:litenet/gen/assets.gen.dart';
import 'package:litenet/routes/route_name.dart';
import 'package:open_filex/open_filex.dart';

class DetailOrderHistoryPage extends ConsumerWidget {
  final String orderId;
  const DetailOrderHistoryPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final asyncDetail = ref.watch(
      getDetailTransactionProvider(orderId: orderId),
    );
    final downloadState = ref.watch(downloadInvoiceProvider);

    ref.listen(downloadInvoiceProvider, (previous, next) {
      next.whenData((savePath) {
        if (savePath != null) {
          // context.showSuccess("Invoice berhasil diunduh");
          OpenFilex.open(savePath);
        }
      });

      next.whenOrNull(
        error: (err, _) {
          context.showError("Gagal mengunduh invoice");
        },
      );
    });

    return Scaffold(
      appBar: const CustomAppbar(title: 'Detail Pesanan', isRounded: false),
      body: asyncDetail.when(
        data: (data) {
          final detail = data.data;
          String statusTitle = 'Transaksi';
          String statusDescription = '';

          switch (detail.transactionStatus) {
            case 'settlement':
              statusTitle = 'Transaksi Berhasil';
              statusDescription =
                  'Pembayaran Anda telah diterima dan pesanan sedang diproses. '
                  'Mohon tunggu beberapa saat hingga kuota aktif pada perangkat Anda.';
              break;

            case 'expired':
              statusTitle = 'Transaksi Gagal';
              statusDescription =
                  'Transaksi Anda telah kedaluwarsa karena melewati batas waktu pembayaran. '
                  'Silakan lakukan pemesanan ulang jika masih ingin melanjutkan.';
              break;

            case 'pending':
              statusTitle = 'Transaksi Diproses';
              statusDescription =
                  'Pembayaran Anda sedang diverifikasi. '
                  'Proses ini biasanya memerlukan beberapa saat sebelum pesanan dapat diproses.';
              break;

            default:
              statusTitle = 'Status Tidak Dikenal';
              statusDescription =
                  'Terjadi kesalahan dalam membaca status transaksi. '
                  'Silakan hubungi layanan pelanggan untuk bantuan lebih lanjut.';
          }

          return Stack(
            children: [
              // Background Ungu
              Container(
                height: size.height * 0.2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: DefaultColors.purple500,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
              ),

              // Card
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSize.horizontal,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    // Kartu Putih Detail
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Icon
                          _buildIcon(status: detail.transactionStatus),
                          const SizedBox(height: 24),
                          Text(
                            statusTitle,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: DefaultColors.purple900,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            statusDescription,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: DefaultColors.black200),
                          ),
                          const SizedBox(height: 24),
                          const Divider(color: DefaultColors.black50),
                          const SizedBox(height: 24),

                          // Rincian Transaksi
                          _buildDetailRow(
                            context,
                            "Kode Transaksi",
                            detail.orderId,
                          ),
                          _buildDetailRow(
                            context,
                            "Tanggal",
                            detail.createdAt.toIndonesianDateString(),
                          ),
                          _buildDetailRow(
                            context,
                            "Nominal",
                            detail.grossAmount.toRupiah(),
                          ),
                          _buildDetailRow(context, "Kuota", detail.capacity),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // Tombol
                    _buildButton(
                      context: context,
                      detail: detail,
                      ref: ref,
                      downloadState: downloadState,
                    ),

                    const SizedBox(height: 12),
                    Button(
                      text: "Kembali",
                      buttonType: ButtonType.outlined,
                      backgroundColor: DefaultColors.purple50,
                      textColor: DefaultColors.purple500,
                      onPressed: () {
                        context.goNamed(RouteName.orderHistoryPage);
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
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
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required DetailTransactionDataEntity detail,
    required WidgetRef ref,
    required AsyncValue<String?> downloadState,
  }) {
    if (detail.transactionStatus == 'settlement') {
      return Button(
        text: "Unduh Invoice",
        buttonType: ButtonType.filled,
        isLoading: downloadState.isLoading,
        onPressed: () async {
          ref.read(downloadInvoiceProvider.notifier).executeDownload(orderId);
        },
      );
    } else if (detail.transactionStatus == 'pending') {
      return Button(
        text: "Bayar Pesanan",
        buttonType: ButtonType.filled,
        onPressed: () {
          context.pushReplacementNamed(
            RouteName.paymentPage,
            extra: {'orderId': detail.orderId},
          );
        },
      );
    } else {
      return Container();
    }
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: DefaultColors.black200),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: DefaultColors.black500,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildIcon({required String status}) {
  Color statusBackgroundColor = DefaultColors.black200;
  String iconAsset = Assets.icons.loading;

  switch (status) {
    case 'settlement':
      statusBackgroundColor = DefaultColors.purple500;
      iconAsset = Assets.icons.checklist;
      break;
    case 'expired':
      statusBackgroundColor = DefaultColors.lightRed;
      iconAsset = Assets.icons.cancel;
      break;
    case 'pending':
      statusBackgroundColor = DefaultColors.lightYellow;
      iconAsset = Assets.icons.loading;
      break;
  }

  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: statusBackgroundColor,
      shape: BoxShape.circle,
      border: Border.all(color: DefaultColors.purple50, width: 12),
    ),
    child: SvgPicture.asset(
      iconAsset,
      width: 40,
      height: 40,
      colorFilter: const ColorFilter.mode(DefaultColors.white, BlendMode.srcIn),
    ),
  );
}
