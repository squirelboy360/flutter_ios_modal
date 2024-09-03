import 'package:flutter/material.dart';
import 'package:flutter_ios_modal/flutter_ios_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter iOS Modal Example')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Show Modal'),
            onPressed: () {
              FlutterIOSModal.showModalSheet(
                viewPath: '/modal_content',
                hasHeader: true,
                headerHeight: 50.0,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ModalContent extends StatelessWidget {
  const ModalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('This is the modal content'),
      ),
    );
  }
}