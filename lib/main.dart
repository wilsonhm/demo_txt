import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exportar Datos a TXT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exportar Datos a TXT'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final directory = await getExternalStorageDirectory();
            final projectDirectory = Directory('${directory?.path}/NombreDelProyecto');

            if (projectDirectory != null) {
              await projectDirectory.create(recursive: true);
              final file = File('${projectDirectory.path}/datos.txt');
              await file.writeAsString('Estos son los datos que quiero exportar.');

              print('Archivo exportado exitosamente en: ${file.path}');

              // Leer el archivo
              final content = await file.readAsString();
              print('Contenido del archivo: $content');
            } else {
              print('No se pudo acceder al directorio externo.');
            }
          },
          child: Text('Exportar Datos'),
        ),
      ),
    );
  }
}
