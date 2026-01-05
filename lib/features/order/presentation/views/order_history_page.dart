import 'package:flutter/material.dart';
import 'package:litenet/core/constants/enum.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/custom_search_bar.dart';
import 'package:litenet/features/order/presentation/views/detail_order_history_page.dart';
import 'package:litenet/features/order/presentation/widgets/order_history_card.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  String _selectedStatus = "Selesai";
  final List<String> _categories = ["Selesai", "Diproses", "Gagal"];

  final List<OrderHistory> _orders = [
    OrderHistory(
      trxId: "TRX-12312312",
      date: "Senin, 10 Januari 2025",
      quota: "12GB",
      price: "Rp 120.000",
      status: TransactionStatus.selesai,
    ),
    OrderHistory(
      trxId: "TRX-12312312",
      date: "Senin, 10 Januari 2025",
      quota: "12GB",
      price: "Rp 120.000",
      status: TransactionStatus.gagal,
    ),
    OrderHistory(
      trxId: "TRX-12312312",
      date: "Senin, 10 Januari 2025",
      quota: "12GB",
      price: "Rp 120.000",
      status: TransactionStatus.diproses,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: const CustomAppbar(title: "Riwayat Pesanan", isLeading: false),
      body: Column(
        children: [
          // 1. Search Bar Reusable
          CustomSearchBar(title: "Riwayat Pesanan"),

          // 2. Filter Status (Chips)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: _categories
                  .map((cat) => _buildFilterChip(cat))
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),

          // 3. List Riwayat
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                return OrderHistoryCard(
                  order: _orders[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  DetailOrderPage(status: _orders[index].status),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedStatus == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedStatus = label),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? DefaultColors.purple500 : DefaultColors.purple50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: isSelected ? Colors.white : DefaultColors.purple200,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}



class OrderHistory {
  final String trxId;
  final String date;
  final String quota;
  final String price;
  final TransactionStatus status;

  OrderHistory({
    required this.trxId,
    required this.date,
    required this.quota,
    required this.price,
    required this.status,
  });
}
