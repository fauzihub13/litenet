import 'dart:io';

class TransactionLogger {
  static int _counter = 1;

  static DateTime? _startTime;
  static DateTime? _orderCreatedTime;
  static DateTime? _successTime;
  static String? _orderId;

  /// START (klik buat pesanan)
  static void start() {
    _startTime = DateTime.now();
  }

  /// ORDER CREATED
  static void orderCreated(String orderId) {
    _orderId = orderId;
    _orderCreatedTime = DateTime.now();
  }

  /// SUCCESS (kuota masuk)
  static Future<void> success() async {
    _successTime = DateTime.now();

    // final dir = await getDownloadsDirectory();
    final dir = Directory('/storage/emulated/0/Download');
    final file = File('${dir.path}/transaction_log.csv');

    final exists = await file.exists();

    if (!exists) {
      await file.writeAsString(
        "No,OrderID,StartTime,OrderCreatedTime,SuccessTime\n",
      );
    }

    final row =
        "$_counter,$_orderId,${_startTime?.toIso8601String()},${_orderCreatedTime?.toIso8601String()},${_successTime?.toIso8601String()}\n";

    await file.writeAsString(row, mode: FileMode.append);

    // reset untuk transaksi berikutnya
    _counter++;
    _startTime = null;
    _orderCreatedTime = null;
    _successTime = null;
    _orderId = null;
  }
}
