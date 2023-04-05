#include "include/modal_progress_hud_nsn/modal_progress_hud_nsn_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "modal_progress_hud_nsn_plugin.h"

void ModalProgressHudNsnPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  modal_progress_hud_nsn::ModalProgressHudNsnPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
