import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  static const valueKey = ValueKey("CameraPage");
  final List<CameraDescription>? cameras;

  const CameraPage(
      {Key? key,
      required this.title,
      required this.updateRoute,
      required this.cameras})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final VoidCallback updateRoute;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the DetailsPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        child: CameraPreview(controller),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Center(
  //           child: SizedBox(
  //             height: 400,
  //             width: 400,
  //             child: CameraPreview(controller),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: ElevatedButton(
  //           onPressed: () async {
  //             pictureFile = await controller.takePicture();
  //             setState(() {});
  //           },
  //           child: const Text('Capture Image'),
  //         ),
  //       ),
  //       if (pictureFile != null)
  //         Image.network(
  //           pictureFile!.path,
  //           height: 200,
  //         )
  //       //Android/iOS
  //       // Image.file(File(pictureFile!.path)))
  //     ],
  //   );
  // }
}
