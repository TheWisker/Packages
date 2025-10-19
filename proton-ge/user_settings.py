#Settings here will take effect for all games run in this Proton version.

user_settings = {
    #By default, logs are saved to $HOME/steam-<STEAM_GAME_ID>.log, overwriting any previous log with that name.
    #Log directory can be overridden with $PROTON_LOG_DIR.

    # enable logging
    "PROTON_LOG": "1",
    # custom Wine debug logging
    #"WINEDEBUG": "+timestamp,+pid,+tid,+seh,+unwind,+threadname,+debugstr,+loaddll,+mscoree",
    # DXVK debug logging
    "DXVK_LOG_LEVEL": "warn",
    # DXVK-NVAPI debug logging
    "DXVK_NVAPI_LOG_LEVEL": "warn",
    # vkd3d debug logging
    "VKD3D_DEBUG": "warn",
    # vkd3d-shader debug logging
    "VKD3D_SHADER_DEBUG": "fixme",
    # wine-mono debug logging (Wine's .NET replacement)
    "WINE_MONO_TRACE": "E:System.NotImplementedException",
    #"MONO_LOG_LEVEL": "info",
    # general purpose media logging
    #"GST_DEBUG": "4",
    # or, verbose converter logging (may impact playback performance):
    #"GST_DEBUG": "4,WINE:7,protonmediaconverter:7",
    "GST_DEBUG_NO_COLOR": "1",
    # Enable DXVK's HUD
    #"DXVK_HUD": "devinfo,fps",
    # Use OpenGL-based wined3d for d3d11, d3d10, and d3d9 instead of Vulkan-based DXVK
    "PROTON_USE_WINED3D": "0",
    # Disable d3d11 entirely
    "PROTON_NO_D3D11": "0",
    # Disable eventfd-based in-process synchronization primitives
    "PROTON_NO_ESYNC": "0",
    # Disable futex-based in-process synchronization primitives
    "PROTON_NO_FSYNC": "0",
    # Enable large address aware flag
    "PROTON_FORCE_LARGE_ADDRESS_AWARE": "1",
    # Disable XIM (default)
    "PROTON_NO_XIM": "1",
    # Enable seccomp (default)
    "PROTON_USE_SECCOMP": "1",
    # Load the NVAPI library and emulate it
    "PROTON_ENABLE_NVAPI": "1",
    # Enable use of the ntsync kernel driver to improve performance and compatibility of Windows NT synchronization primitives.
    "PROTON_USE_NTSYNC": "1",
    # Enable WoW64 Mode For Wine Prefixes. Required for Ntsync use with 32-bit games
    "PROTON_USE_WOW64": "1",
    # Enable automatic upgrading of AMD FidelityFX Super Resolution (FSR) to FSR4.
    "PROTON_FSR4_UPGRADE": "1",
}