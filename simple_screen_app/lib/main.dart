import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleScreenApp());
}

bool switch1 = false;
bool switch2 = false;
bool switch3 = false;
bool switch4 = false;
double slider1value = 0;
double slider2value = 0;
double slider3value = 0;
var text = '';

class SimpleScreenApp extends StatelessWidget {
  const SimpleScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            //implement done button and 3 sliders
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //implement done button and 3 sliders
            children: [
              TextInput(),
              FourSwitches(),
              ThreeSliders(),
              DoneButton(),
            ],
          ),
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
  State<ThreeSliders> createState() => _SlidersImplementation();
}

class DoneButton extends StatefulWidget {
  const DoneButton({super.key});

  @override
  State<DoneButton> createState() => _DoneButtonImplementation();
}

class _DoneButtonImplementation extends State<DoneButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => displayAlert(context),
      style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
      child: const Text("Done!"),
    );
  }

  Future<void> displayAlert(BuildContext context) {
    if (switch1 != true ||
        switch3 != true ||
        slider1value != 30 ||
        slider2value != 70 ||
        slider3value != 50 ||
        text.isEmpty) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              'Requirements not met',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('All Done'),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class _SlidersImplementation extends State<ThreeSliders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: const FractionalOffset(0.02, 0.2),
          child: Text("Slider 1",
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 1.2)),
        ),
        Slider(
          value: slider1value,
          max: 100,
          divisions: 10,
          label: slider1value.round().toString(),
          onChanged: (double value) {
            setState(() {
              slider1value = value;
            });
          },
        ),
        Align(
          alignment: const FractionalOffset(0.02, 0.2),
          child: Text("Slider 2",
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 1.2)),
        ),
        Slider(
          value: slider2value,
          max: 100,
          divisions: 10,
          label: slider2value.round().toString(),
          onChanged: (double value) {
            setState(() {
              slider2value = value;
            });
          },
        ),
        Align(
          alignment: const FractionalOffset(0.02, 0.2),
          child: Text("Slider 3",
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 1.2)),
        ),
        Slider(
          value: slider3value,
          max: 100,
          divisions: 10,
          label: slider3value.round().toString(),
          onChanged: (double value) {
            setState(() {
              slider3value = value;
            });
          },
        ),
      ],
    );
  }
}

class _TextInputImplementation extends State<TextInput> {
  final controller = TextEditingController();
  String? get errorText {
    text = controller.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    // return null if the text is valid
    return null;
  }

  final _text = '';
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: "Enter Your Name",
          errorText: errorText),
      onChanged: (text) => setState(() => _text),
    );
  }
}

class _SwitchesImplementation extends State<FourSwitches> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SwitchListTile(
        title: const Text('Switch 1'),
        activeColor: Colors.red,
        activeTrackColor: Colors.blue,
        inactiveThumbColor: Colors.blueGrey,
        inactiveTrackColor: Colors.grey,
        value: switch1,
        onChanged: (bool value) {
          setState(() {
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
    ]);
  }
}
