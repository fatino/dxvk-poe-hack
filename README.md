# THIS IS OBSOLETE
Since dxvk commit c3b542878c99b701f8f52e9e7a6b9a340421ba84 this patch isn't needed. You can just use config option dxvk.useAsyncPipeCompiler in official builds (0.72+) for the exact same thing.

# What?
A hack for dxvk to not stall the rendering thread when compiling shaders. This "solves" shader compilation stutter, with the downside of graphical glitches. Depends heavily on what the game does with the shaders: could work on some games fine and others will be horribly broken.

Enabled by default for Path of Exile.

### Games tested
* Path of Exile: seems fine. Atlas may be buggy first, but toggling display mode (e.g. fullscreen to windowed fullscreen and back) or running a map should fix it.

### Instructions

* Patch dxvk with pipeline.patch
* If trying it for other games, set dxvk.useAsyncPipeCompiler and dxvk.dontWaitForShaders to true in [config](https://github.com/doitsujin/dxvk/wiki/Configuration)