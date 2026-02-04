import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/form_input.dart';
import 'package:litenet/core/widgets/row_title.dart';
import 'package:litenet/routes/route_name.dart';

class DetailQuotaPage extends ConsumerStatefulWidget {
  const DetailQuotaPage({super.key});

  @override
  ConsumerState<DetailQuotaPage> createState() => _DetailQuotaPageState();
}

class _DetailQuotaPageState extends ConsumerState<DetailQuotaPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  String? _selectedDevice;
  final TextEditingController _promoCodeController = TextEditingController();
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // listen perubahan tab
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'Detail Kuota', isRounded: false),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // padding: const EdgeInsets.all(PaddingSize.horizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Header Banner
                  _buildHeaderBanner(context),
                  const SizedBox(height: 30),

                  _paddingColumn([
                    // 2. Dropdown Pilih Perangkat
                    RowTitle(title: "Perangkat"),
                    const SizedBox(height: 8),
                    _buildDeviceDropdown(),
                    const SizedBox(height: 20),

                    // 3. Input Kode Promo
                    RowTitle(title: "Kode Promo"),
                    const SizedBox(height: 8),
                    _buildPromoInput(),
                    const SizedBox(height: 30),

                    // 4. Tab Deskripsi & Syarat
                    TabBar(
                      controller: _tabController,
                      labelColor: DefaultColors.purple500,
                      unselectedLabelColor: DefaultColors.black100,
                      indicatorColor: DefaultColors.purple500,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.tab,
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      labelStyle: Theme.of(context).textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),

                      tabs: const [
                        Tab(text: "Deskripsi"),
                        Tab(text: "Syarat dan Ketentuan"),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // SizedBox(
                    //   height: 300,
                    //   child: TabBarView(
                    //     controller: _tabController,
                    //     children: [
                    //       _buildDescriptionText(
                    //         "Paket Kuota Satelit 10 GB adalah solusi terbaik bagi pengguna yang membutuhkan koneksi internet stabil di wilayah tanpa jangkauan seluler. Dengan jaringan satelit MyLinkSat, paket ini memungkinkan aktivitas komunikasi data, pemantauan perangkat, hingga akses layanan berbasis cloud.\n\nPaket ini memiliki masa aktif 30 hari sejak aktivasi dan dapat digunakan untuk berbagai kebutuhan seperti sistem monitoring lapangan, kapal laut, area tambang, serta lokasi terpencil lainnya.",
                    //       ),
                    //       _buildDescriptionText(
                    //         "Syarat dan ketentuan Paket Kuota Satelit 10 GB adalah solusi terbaik bagi pengguna yang membutuhkan koneksi internet stabil di wilayah tanpa jangkauan seluler. Dengan jaringan satelit MyLinkSat, paket ini memungkinkan aktivitas komunikasi data, pemantauan perangkat, hingga akses layanan berbasis cloud.\n\nPaket ini memiliki masa aktif 30 hari sejak aktivasi dan dapat digunakan untuk berbagai kebutuhan seperti sistem monitoring lapangan, kapal laut, area tambang, serta lokasi terpencil lainnya.",
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    IndexedStack(
                      index: _currentIndex,
                      children: [
                        _buildDescriptionText(
                          "AAA Paket Kuota Satelit 10 GB adalah solusi terbaik bagi pengguna yang membutuhkan koneksi internet stabil di wilayah tanpa jangkauan seluler. Dengan jaringan satelit MyLidigunakan untuk berbagai kebutuhan seperti sistem monitoring lapangan, kapal laut, area tambang, serta lokasi terpencil lainnya.",
                        ),
                        _buildDescriptionText(
                          "Syarat dan ketntuan Paket Kuota Satelit 10 GB adalah solusi terbaik bagi pengguna yang membutuhkan koneksi internet stabil di wilayah tanpa jangkauan seluler. Dengan jaringan satelit MyLinkSat, paket ini memungkinkan aktivitas komunikasi data, pemantauan perangkat, hingga akses layanan berbasis cloud.\n\nPaket ini memiliki masa aktif 30 hari sejak aktivasi dan dapat digunakan untuk berbagai kebutuhan seperti sistem monitoring lapangan, kapal laut, area tambang, serta lokasi terpencil lainnya.",
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ]),
                ],
              ),
            ),
          ),

          // 5. Sticky Bottom: Ringkasan Harga & Tombol
          // _buildBottomSummary(context),
        ],
      ),
      bottomNavigationBar: _buildBottomSummary(context),
    );
  }

  Widget _buildHeaderBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 0, bottom: 40),
      decoration: BoxDecoration(
        color: DefaultColors.purple500,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            "12GB ( 1 Bulan )",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Internet Satelit   |   Satu kali bayar",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _paddingColumn(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingSize.horizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildDeviceDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DefaultColors.black50),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          hint: Text(
            "Pilih perangkat",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: DefaultColors.purple900,
              fontSize: 14,
            ),
          ),
          isExpanded: true,
          value: _selectedDevice,
          items: ["Perangkat 1X", "Perangkat 2Y"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.purple900,
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          onChanged: (val) => setState(() => _selectedDevice = val),
        ),
      ),
    );
  }

  Widget _buildPromoInput() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: FormInput(
            textController: _promoCodeController,
            hintText: "Kode Promo",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kode tidak boleh kosong';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: Button(text: "Pakai", onPressed: () {}, height: 52),
        ),
      ],
    );
  }

  Widget _buildDescriptionText(String text) {
    return Text(
      textAlign: TextAlign.justify,
      text,
      style: TextStyle(color: DefaultColors.black200),
    );
  }

  Widget _buildBottomSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle Bar / Button untuk klik minimize/maximize
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  height: 24,
                  child: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: DefaultColors.purple500,
                  ),
                ),

                // const SizedBox(height: 5),
                // Bagian yang selalu muncul (Total Harga)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total harga",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Rp 300.000",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: DefaultColors.purple500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bagian yang bisa di-minimize/expand
          AnimatedCrossFade(
            firstChild: const SizedBox(height: 0, width: double.infinity),
            secondChild: Column(
              children: [
                const SizedBox(height: 8),
                const Divider(color: DefaultColors.purple50),
                const SizedBox(height: 8),
                _buildPriceRow("Harga", "Rp 350.000"),
                _buildPriceRow("Potongan", "-Rp 50.000"),
              ],
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),

          const SizedBox(height: 14),
          Button(
            text: "Pilih Metode Pembayaran",
            onPressed: () {
              context.goNamed(RouteName.paymentMethodPage);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String price, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isTotal ? 18 : 14,
              color: isTotal ? DefaultColors.purple500 : DefaultColors.black500,
            ),
          ),
        ],
      ),
    );
  }
}
