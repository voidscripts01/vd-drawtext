# vd-drawtext

**vd-drawtext** is a standalone, lightweight, and modern DrawText script for FiveM that uses NUI to display clean and animated UI prompts.

Created by KITSO.

## Features

* **Modern UI:** Replaces the default FiveM DrawText with a clean NUI interface.
* **Animated:** Features a smooth slide-in/out animation and a spinning key icon.
* **Easy to Use:** Simple exports allow for easy integration into any of your other scripts.
* **Customizable:** All colors, fonts, and positions can be easily changed at the top of the `html/style.css` file.
* **Standalone:** No framework (like ESX or QBCore) is required.

## Installation

1.  Download the `vd-drawtext` resource from this repository.
2.  Place the folder in your server's `resources` directory.
3.  Add `ensure vd-drawtext` to your `server.cfg` file.

## Usage

You can trigger the UI from any other client-side script using these exports.

### ShowText
Displays the DrawText UI.

```lua
-- exports["vd-drawtext"]:ShowText(key, message)

-- Example:
exports["vd-drawtext"]:ShowText("E", "Press E to open Blackmarket")
```

### HideText
Hides the DrawText UI.

```lua
-- Example:
exports["vd-drawtext"]:HideText()
