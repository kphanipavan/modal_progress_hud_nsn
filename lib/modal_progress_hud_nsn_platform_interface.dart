import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'modal_progress_hud_nsn_method_channel.dart';

abstract class ModalProgressHudNsnPlatform extends PlatformInterface {
  /// Constructs a ModalProgressHudNsnPlatform.
  ModalProgressHudNsnPlatform() : super(token: _token);

  static final Object _token = Object();

  static ModalProgressHudNsnPlatform _instance = MethodChannelModalProgressHudNsn();

  /// The default instance of [ModalProgressHudNsnPlatform] to use.
  ///
  /// Defaults to [MethodChannelModalProgressHudNsn].
  static ModalProgressHudNsnPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ModalProgressHudNsnPlatform] when
  /// they register themselves.
  static set instance(ModalProgressHudNsnPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
