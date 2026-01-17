import 'package:flutter/material.dart';
import 'package:litenet/core/constants/theme.dart';
import 'package:litenet/core/widgets/button.dart';
import 'package:litenet/core/widgets/custom_appbar.dart';
import 'package:litenet/core/widgets/form_input.dart';

class CoordinateDevicePage extends StatefulWidget {
  const CoordinateDevicePage({super.key});

  @override
  State<CoordinateDevicePage> createState() => _CoordinateDevicePageState();
}

class _CoordinateDevicePageState extends State<CoordinateDevicePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _coordinatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Lokasi Perangkat'),
      body: Column(
        children: [
          // TODO:: GOOGLE MAPS VIEW
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                color: Colors.amber,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),

          // Bottom Card
          Container(
            padding: const EdgeInsets.all(PaddingSize.horizontal),
            decoration: BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Koordinat Lokasi',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: DefaultColors.purple500,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  // Coordinate
                  const SizedBox(height: 16),
                  FormInput(
                    textController: _coordinatController,
                    hintText: "Koordinat perangkat",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Koordinat tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Button(
                    text: "Simpan",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //  Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) {},
                        //     ),
                        //   );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
