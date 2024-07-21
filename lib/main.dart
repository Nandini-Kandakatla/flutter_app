import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const FlutterWidgetsApp());

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home:FlutterWidgets(),
    );
  }
}

class FlutterWidgets extends StatefulWidget {
  const FlutterWidgets({super.key});

  @override
  State<FlutterWidgets> createState() => _CombinedExampleState();
}

class _CombinedExampleState extends State<FlutterWidgets> {
  SingingCharacter? _character = SingingCharacter.Justinbieber;
  bool airplaneMode = false;
  double _volume = 0.0;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    super.dispose();
  }
// alert dialog
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('WIDGETS'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text('Cupertino Radio '),
              CupertinoListSection(
                children: <Widget>[
                  CupertinoListTile(
                    title: const Text('Justinbieber'),
                    leading: CupertinoRadio<SingingCharacter>(
                      value: SingingCharacter.Justinbieber,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  CupertinoListTile(
                    title: const Text('Thomas Jefferson'),
                    leading: CupertinoRadio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Cupertino FormRow '),
              CupertinoFormSection(
                header: const Text('Connectivity'),
                children: <Widget>[
                  CupertinoFormRow(
                    prefix: const PrefixWidget(
                      icon: CupertinoIcons.airplane,
                      title: 'Airplane Mode',
                      color: CupertinoColors.systemOrange,
                    ),
                    child: CupertinoSwitch(
                      value: airplaneMode,
                      onChanged: (bool value) {
                        setState(() {
                          airplaneMode = value;
                        });
                      },
                    ),
                  ),
                  const CupertinoFormRow(
                    prefix: PrefixWidget(
                      icon: CupertinoIcons.wifi,
                      title: 'Wi-Fi',
                      color: CupertinoColors.systemBlue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Stanford_Public Uni'),
                        SizedBox(width: 5),
                        Icon(CupertinoIcons.forward)
                      ],
                    ),
                  ),
                  const CupertinoFormRow(
                    prefix: PrefixWidget(
                      icon: CupertinoIcons.bluetooth,
                      title: 'Bluetooth',
                      color: CupertinoColors.activeBlue,
                    ),
                    helper: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Headphone'),
                          Text('Connected'),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('On'),
                        SizedBox(width: 5),
                        Icon(CupertinoIcons.forward),
                      ],
                    ),
                  ),
                  const CupertinoFormRow(
                    prefix: PrefixWidget(
                      icon: CupertinoIcons.bluetooth,
                      title: 'Mobile Data',
                      color: CupertinoColors.systemGreen,
                    ),
                    child: Icon(CupertinoIcons.forward),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text('Cupertino Button'),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CupertinoButton(
                    onPressed: null,
                    child: Text('Disabled'),
                  ),
                  const SizedBox(height: 30),
                  const CupertinoButton.filled(
                    onPressed: null,
                    child: Text('Disabled'),
                  ),
                  const SizedBox(height: 30),
                  CupertinoButton(
                    onPressed: () {},
                    child: const Text('Enabled'),
                  ),
                  const SizedBox(height: 30),
                  CupertinoButton.filled(
                    onPressed: () {},
                    child: const Text('Enabled'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Icon Button'),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {
                      setState(() {
                        _volume += 10;
                      });
                    },
                  ),
                  Text('Volume : $_volume'),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Cupertino AlertDialog'),
              CupertinoButton(
                onPressed: () => _showAlertDialog(context),
                child: const Text('Show Alert'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

enum SingingCharacter { Justinbieber, jefferson }

class PrefixWidget extends StatelessWidget {
  const PrefixWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Icon(icon, color: CupertinoColors.white),
        ),
        const SizedBox(width: 15),
        Text(title)
      ],
    );
  }
}
