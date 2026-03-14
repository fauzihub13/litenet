// Custom Painter untuk Menggambar Donut Chart
import 'dart:math' as math;

import 'package:flutter/material.dart';

class DonutChartPainter extends CustomPainter {
  final int online;
  final int offline;
  final int inactive;

  DonutChartPainter({
    required this.online,
    required this.offline,
    required this.inactive,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final int total = online + offline + inactive;
    if (total == 0) return; // Mencegah pembagian dengan nol

    final double center = size.width / 2;
    final Offset offsetCenter = Offset(center, center);
    final double radius = center - 5; // Dikurangi setengah dari strokeWidth

    // Konfigurasi kuas (Paint)
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth =
          10 // Ketebalan garis donat
      ..strokeCap = StrokeCap.round; // Ujung melengkung agar terlihat premium

    double startAngle = -math.pi / 2; // Mulai dari arah jam 12 atas

    // Helper function untuk menggambar arc (busur)
    void drawSegment(int value, Color color) {
      if (value == 0) return;
      final double sweepAngle = (value / total) * 2 * math.pi;

      paint.color = color;
      canvas.drawArc(
        Rect.fromCircle(center: offsetCenter, radius: radius),
        startAngle,
        // Dikurangi sedikit (0.1 radian) agar ada jarak/gap antar warna
        sweepAngle > 0.1 ? sweepAngle - 0.1 : sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }

    // Gambar segmen secara berurutan
    drawSegment(online, const Color(0xFF10B981)); // Hijau
    drawSegment(offline, const Color(0xFFEF4444)); // Merah
    drawSegment(inactive, const Color(0xFFD1D5DB)); // Abu-abu
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
