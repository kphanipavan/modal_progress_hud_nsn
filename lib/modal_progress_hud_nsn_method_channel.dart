import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'modal_progress_hud_nsn_platform_interface.dart';

/// An implementation of [ModalProgressHudNsnPlatform] that uses method channels.
class MethodChannelModalProgressHudNsn extends ModalProgressHudNsnPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('modal_progress_hud_nsn');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
