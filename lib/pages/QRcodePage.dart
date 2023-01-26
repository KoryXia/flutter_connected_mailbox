import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_connected_mailbox/pages/BlankPage.dart';
import 'package:flutter_connected_mailbox/pages/MainPage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   }else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildQrView(context),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.green,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea,
          ),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: IconButton(
            padding: const EdgeInsets.all(35),
            icon: FutureBuilder(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Icon(
                    snapshot.data.toString() == 'true'
                        ? Icons.flashlight_on
                        : Icons.flashlight_off,
                    color: Colors.white,
                    size: 35,
                  );
                } else {
                  return const Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                  );
                }
              },
            ),
            color: Colors.white,
            onPressed: () async {
              await controller?.toggleFlash();
              setState(() {});
            },
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 35,
            ),
            color: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      this.controller!.resumeCamera();
    });
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      controller.pauseCamera();
      Get.defaultDialog(
          title: 'success'.tr,
          middleText: 'success'.tr,
          confirm: ElevatedButton(
            child: Text('confirm'.tr),
            onPressed: () => Get.to(() => const MainPage()),
          ));
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
