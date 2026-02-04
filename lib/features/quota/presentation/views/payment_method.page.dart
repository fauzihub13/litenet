import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/routes/route_name.dart';

class PaymentMethodPage extends ConsumerStatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  ConsumerState<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends ConsumerState<PaymentMethodPage> {
  String _selectedPaymentId = "bca";

  final List<PaymentMethod> _methods = [
    PaymentMethod(
      id: "bca",
      name: "BCA",
      logoAsset:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Bank_Central_Asia.svg/1200px-Bank_Central_Asia.svg.png",
    ),
    PaymentMethod(
      id: "bri",
      name: "BRI",
      logoAsset:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/BRI_Logo.svg/1200px-BRI_Logo.svg.png",
    ),
    PaymentMethod(
      id: "bni",
      name: "BNI",
      logoAsset:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/BNI_logo.svg/1200px-BNI_logo.svg.png",
    ),
    PaymentMethod(
      id: "mandiri",
      name: "Mandiri",
      logoAsset:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Bank_Mandiri_logo_2016.svg/1200px-Bank_Mandiri_logo_2016.svg.png",
    ),
    PaymentMethod(
      id: "btn",
      name: "BTN",
      logoAsset:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Logo_Bank_BTN.svg/1200px-Logo_Bank_BTN.svg.png",
    ),
    PaymentMethod(
      id: "cimb",
      name: "CIMB Niaga",
      logoAsset:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/CIMB_Niaga_logo.svg/1200px-CIMB_Niaga_logo.svg.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Metode Pembayaran'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.vertical,
        ),
        child: ListView.builder(
          itemCount: _methods.length,
          itemBuilder: (context, index) {
            return _buildPaymentCard(_methods[index]);
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSize.horizontal,
          vertical: PaddingSize.horizontal,
        ),
        child: Button(
          text: "Lanjutkan Pembayaran",
          onPressed: () {
            if (_selectedPaymentId.isNotEmpty) {
              // print(_selectedPaymentId);
              context.goNamed(RouteName.paymentPage);
            }
          },
        ),
      ),
    );
  }

  Widget _buildPaymentCard(PaymentMethod method) {
    bool isSelected = _selectedPaymentId == method.id;

    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentId = method.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: DefaultColors.black50.withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? DefaultColors.purple500 : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Logo Bank
            Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.network(
                method.logoAsset,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.monetization_on,
                    color: DefaultColors.purple200,
                    size: 20,
                  );
                },
              ),
            ),
            const SizedBox(width: 16),

            // Nama Bank
            Expanded(
              child: Text(
                method.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: DefaultColors.purple900,
                ),
              ),
            ),

            // Custom Radio Indicator
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? DefaultColors.purple500
                      : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: DefaultColors.purple500,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final String logoAsset;
  final String id;

  PaymentMethod({
    required this.name,
    required this.logoAsset,
    required this.id,
  });
}
