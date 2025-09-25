import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final picker = ImagePicker();
  final List<String> _imagePaths = [];

  Future<void> addImageFromGallery() async {
    if (_imagePaths.length >= 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Você atingiu o limite de 6 imagens.'),
        ),
      );
      return;
    }
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _imagePaths.add(file.path);
      });
    }
  }

  void addImageFromCamera() async {
    if (_imagePaths.length >= 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Você atingiu o limite de 6 imagens.'),
        ),
      );
      return;
    }
    final file = await Navigator.push<File>(
      context,
      MaterialPageRoute(
        builder: (context) => CameraCamera(
          onFile: (file) {
            Navigator.pop(context, file); // Isso garante que o arquivo seja retornado para este ponto após a captura
          },
        ),
      ),
    );

    // Verifique se recebemos um arquivo de volta
    if (file != null && _imagePaths.length < 6) {
      setState(() {
        _imagePaths.add(file.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao capturar imagem.'),
        ),
      );
    }
  }

  void removeImage(int index) {
    setState(() {
      _imagePaths.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envie seu comprovante'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.file(
                        File(_imagePaths[index]),
                        fit: BoxFit.cover,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeImage(index),
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Tirar foto'),
              ),
              onPressed: addImageFromCamera,
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('OU'),
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.attach_file),
              label: const Text('Selecione um arquivo'),
              onPressed: addImageFromGallery,
            ),
          ],
        ),
      ),
    );
  }
}
