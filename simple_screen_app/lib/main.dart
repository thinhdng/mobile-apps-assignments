import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleScreenApp());
}

bool switch1 = false;
bool switch3 = false;

class SimpleScreenApp extends StatelessWidget {
  const SimpleScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          //implement done button and 3 sliders
          children: [TextInput(), FourSwitches(), ThreeSliders()],
        ),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput({super.key});

  @override
  State<TextInput> createState() => _TextInputImplementation();
}

class FourSwitches extends StatefulWidget {
  const FourSwitches({super.key});

  @override
  State<FourSwitches> createState() => _SwitchesImplementation();
}

class ThreeSliders extends StatefulWidget {
  const ThreeSliders({super.key});

  @override
  State<ThreeSliders> createState() => _ThreeSlidersImplementation();
}

class _TextInputImplementation extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: UnderlineInputBorder(), labelText: "Your Name"),
    );
  }
}

class _ThreeSlidersImplementation extends State<ThreeSliders> {
  double slider1Value = 0;
  double slider2Value = 0;
  double slider3Value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Column(
          children: [
            Text("Slider 1"),
            Expanded(
                child: Slider(
                    value: slider1Value,
                    onChanged: (double value) {
                      setState(() {
                        slider1Value = value;
                      });
                    }))
          ],
        ),
        Row(
          children: [],
        ),
        Row(
          children: [],
        )
      ],
    ));
  }
}

class _SwitchesImplementation extends State<FourSwitches> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SwitchListTile(
          title: const Text('Switch 1'),
          activeColor: Colors.red,
          activeTrackColor: Colors.blue,
          inactiveThumbColor: Colors.blueGrey,
          inactiveTrackColor: Colors.grey,
          value: switch1,
          onChanged: (bool value) {
            setState(() {
              switch1 = true;
              switch1 = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Switch 2'),
          activeColor: Colors.red,
          activeTrackColor: Colors.blue,
          inactiveThumbColor: Colors.blueGrey,
          inactiveTrackColor: Colors.grey,
          value: switch2,
          onChanged: (bool value) {
            setState(() {
              switch2 = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Switch 3'),
          activeColor: Colors.red,
          activeTrackColor: Colors.blue,
          inactiveThumbColor: Colors.blueGrey,
          inactiveTrackColor: Colors.grey,
          value: switch3,
          onChanged: (bool value) {
            setState(() {
              switch3 = true;
              switch3 = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Switch 4'),
          activeColor: Colors.red,
          activeTrackColor: Colors.blue,
          inactiveThumbColor: Colors.blueGrey,
          inactiveTrackColor: Colors.grey,
          value: switch4,
          onChanged: (bool value) {
            setState(() {
              switch4 = value;
            });
          },
        ),
      ]),
    );
  }
}
