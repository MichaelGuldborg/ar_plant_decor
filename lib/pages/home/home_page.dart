import 'package:ar_plant_decor/models/plant.dart';
import 'package:ar_plant_decor/pages/home/camera_view.dart';
import 'package:ar_plant_decor/pages/home/interaction_layer.dart';
import 'package:ar_plant_decor/pages/home/panel_view.dart';
import 'package:ar_plant_decor/pages/home/plant_picker.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cameraIndex = 0;
  Plant plant = Plant.placeholder();
  bool showPanel = false;

  flipCamera() {
    setState(() => cameraIndex = (cameraIndex + 1) % 2);
  }

  togglePanel() {
    setState(() => showPanel = !showPanel);
  }

  plantPicked(Plant plant) {
    setState(() {
      this.showPanel = false;
      this.plant = plant;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CameraView(
            cameraIndex: cameraIndex,
//            disabled: true,
          ),
          PhotoView(
            imageProvider: AssetImage(plant.image),
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
            enableRotation: true,
          ),
          InteractionLayer(
            onFlipPress: flipCamera,
            onTextPress: togglePanel,
          ),
          PanelView(
            visible: showPanel,
            child: PlantPicker(onPick: plantPicked),
          ),
        ],
      ),
    );
  }
}
