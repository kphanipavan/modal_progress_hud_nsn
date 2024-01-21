library modal_progress_hud_nsn;

import "package:flutter/material.dart";
import "dart:ui";

///
/// Wrap around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// HUD=Heads Up Display
///
class ModalProgressHUD extends StatelessWidget {
  /// A required [bool] to toggle the modal overlay.
  final bool inAsyncCall;

  /// A [double] specifying the opacity of the modal overlay, defaults to 0.3
  final double opacity;

  /// A [Color] object which is assigned to the loading barrier, defaults to grey
  final Color color;

  /// A [Widget] which is shown at the center of the modal overlay,
  /// defaults to the standard android spinner animation.
  final Widget progressIndicator;

  /// An [Offset] object which is applied to the [progressIndicator] when specified.
  final Offset? offset;

  /// A [bool] which controls whether the modal overlay can be dismissible when interated.
  final bool dismissible;

  /// A [Widget] over which the modal overlay is activated.
  final Widget child;

  /// A [double] value specifying the amount of background blur when progress hud is active.
  final double blur;

  const ModalProgressHUD({
    super.key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
    this.blur = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: progressIndicator,
      );
    }

    return Stack(
      children: [
        child,
        if (inAsyncCall) ...[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Opacity(
              opacity: opacity,
              child: ModalBarrier(dismissible: dismissible, color: color),
            ),
          ),
          layOutProgressIndicator,
        ],
      ],
    );
  }
}
