# modal_progress_hud_nsn
[![pub package](https://img.shields.io/pub/v/modal_progress_hud_nsn.svg)](https://pub.dartlang.org/packages/modal_progress_hud_nsn)


A simple widget wrapper to enable modal progress HUD (a modal progress indicator, HUD = Heads Up Display)


A fork of [the original modal_progress_hud by mmcc007](https://github.com/mmcc007/modal_progress_hud) with Null Safety and additional features.

## Usage

Add the `modal_progress_hud_nsn` to dependencies in `pubspec.yaml`.

```yml
dependencies:
    modal_progress_hud_nsn: ^0.5.0
```

Next, import the library into your app.

```dart
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
```

Now, wrap your widget as a child of `ModalProgressHUD`, typically a form, together with a boolean variable that is maintained in local state.

```dart
...
bool _saving = false
...

@override
Widget build(BuildContext context) {
  return Scaffold(
     body: ModalProgressHUD(child: Container(
       Form(...)
     ), inAsyncCall: _saving),
  );
}
```

## Options

Below parameters can be customised accordingly.

```dart
ModalProgressHUD(
  @required inAsyncCall: bool,
  @required child: Widget,
  opacity: double,
  color: Color,
  progressIndicator: CircularProgressIndicator,
  offset: double
  dismissible: bool,
  blur: double,
);
```

## Example

An example app that demonstrates the usage.

1. On initial load, `_saving` defaults to false which causes your child widget to display.
2. When the form is submitted, `_saving` is set to true, which will display the modal.
3. Once the async call is complete, `_saving` is set back to false, hiding the modal.

<details>
<summary>Example Code </summary>

```dart
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _saving = false;

  void _submit() {

    setState(() {
      _saving = true;
    });

    //Simulate a service call
    print('submitting to backend...');
    new Future.delayed(new Duration(seconds: 4), () {
      setState(() {
        _saving = false;
      });
    });
  }

  Widget _buildWidget() {
    return new Form(
      child: new Column(
        children: [
          new SwitchListTile(
            title: const Text('Bedroom'),
            value: _bedroom,
            onChanged: (bool value) {
              setState(() {
                _bedroom = value;
              });
            },
            secondary: const Icon(Icons.hotel),
          ),
          new RaisedButton(
            onPressed: _submit,
            child: new Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Progress Indicator Demo'),
        backgroundColor: Colors.blue,
      ),
      body: ModalProgressHUD(child: _buildWidget(), inAsyncCall: _saving),
    );
  }
}
```
</details>

## Similar Alternatives

* [modal_progress_hud](https://pub.dev/packages/modal_progress_hud) : Original
* [modal_progress_hud_alt](https://pub.dev/packages/modal_progress_hud_alt) : Alternative
* [blurry_modal_progress_hud](https://pub.dev/packages/blurry_modal_progress_hud) : With blur
* [flutter_progress_hud](https://pub.dev/packages/flutter_progress_hud) : Light weight and with fade
* [loading_overlay](https://pub.dev/packages/loading_overlay) : Another fork of original with fade



## Useful Resources

 See this [article](https://medium.com/@nocnoc/the-secret-to-async-validation-on-flutter-forms-4b273c667c03) on Medium about async form validation

See the [example application](https://github.com/kphanipavan/modal_progress_hud_nsn/tree/master/example) source
for a complete sample app using the modal progress HUD. Included in the
example is a method for using a form's validators while making async
calls (see [flutter/issues/9688](https://github.com/flutter/flutter/issues/9688) for details).

## Issues and feedback

Please file [issues](https://github.com/kphanipavan/modal_progress_hud_nsn/issues/new)
to send feedback or report a bug. Thank you!
