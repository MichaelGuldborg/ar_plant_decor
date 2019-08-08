import 'package:ar_plant_decor/components/text_button.dart';
import 'package:ar_plant_decor/models/plant.dart';
import 'package:flutter/material.dart';

// Server json response
final List<Map<String, String>> jsonResponse = [
  {'name': 'Monstera Deleciasa', 'image': 'assets/images/banyan-green-bamboo-potted.png'},
  {'name': 'Areca catechu', 'image': 'assets/images/flowerpot-image-illus.png'}
];

class PlantPicker extends StatefulWidget {
  final Function(Plant) onPick;

  const PlantPicker({
    Key key,
    this.onPick,
  }) : super(key: key);

  _PlantPickerState createState() => _PlantPickerState();
}

class _PlantPickerState extends State<PlantPicker> {
  final plants = jsonResponse.map((plant) => Plant.fromJSON(plant)).toList();
  int plantIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 64,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.lightGreen.shade400.withAlpha(200),
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10),
                    bottomEnd: Radius.circular(10),
                  ),
                ),
              ),
              TextButton(
                onTap: () {},
              ),
              Text(
                "We've found 12 plants that would thrive in your environment.",
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        this.plantIndex = 0;
                      });
                    },
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        plants[plantIndex].image,
                        width: 220,
                        height: 320,
                      ),
                      Text(
                        plants[plantIndex].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        this.plantIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          alignment: Alignment.center,
          color: Colors.green.shade400,
          child: TextButton(
            text: "PLACE ENVIRONMENT",
            color: Colors.white,
            onTap: () {
              widget.onPick(plants[plantIndex]);
            },
          ),
        ),
      ],
    );
  }
}
