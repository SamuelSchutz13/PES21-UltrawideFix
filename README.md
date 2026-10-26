# 🖥️ PES 2021 UltraWide Module

A [Sider](https://github.com/juce/sider) Lua module that removes the black bars (pillarboxing) from **eFootball PES 2021** matches on **UltraWide monitors** (21:9 and wider).

---

## ✨ Features

- 🏟️ Full-width UltraWide image during **matches**
- 🎬 Works in **in-match cutscenes** as well
- ⚡ Lightweight: a single memory patch applied once at startup
- 📝 Logs the patched address to the Sider log for easy troubleshooting

---

## 📋 Requirements

- eFootball PES 2021 (PC)
- [Sider 7](https://github.com/juce/sider) with Lua enabled
- An UltraWide monitor (21:9, 32:9, etc.)

> ⚠️ Use only with an UltraWide monitor. On a 16:9 screen this module does nothing useful.

---

## 🚀 Installation

1. Copy `ultrawide.lua` into your Sider `modules` folder:

   ```
   ...\Sider 7\modules\ultrawide.lua
   ```

2. Open `sider.ini` with any text editor and make sure Lua is enabled:

   ```ini
   lua.enabled = 1
   ```

3. Add the module line:

   ```ini
   lua.module = "ultrawide.lua"
   ```

4. In the PES 2021 `settings.exe`, set the resolution to your monitor's **native** resolution (e.g. `2560x1080` or `3440x1440`).

5. Launch Sider, then start the game.

---

## ⚙️ How it works

On startup, the module searches the game's memory for this instruction:

```
80 7B 7C 00 0F 28    cmp byte ptr [rbx+7C], 0
```

and changes the compared value from `0` to `1`:

```
80 7B 7C 01 0F 28    cmp byte ptr [rbx+7C], 1
```

This flips the game's internal check that forces the 16:9 pillarbox during matches, so the 3D scene is rendered across the full width of the screen.

If the instruction is not found (for example, on an unsupported game version), the module stops with the error `unable to find UltraWide_addr`.

---

## 🔍 Checking that it works

Open the Sider log (`sider.log`). When the module loads correctly you will see:

```
found UltraWide_addr min address at: 0x...
Set UltraWide
```

---

## ⚠️ Known limitations

- **Menus stay in 16:9.** The menus use a separate rendering path that this module does not touch, so they keep their black bars.
- **Some pre-match scenes** (such as the stadium presentation shot) may show small artifacts on the far left and right edges, because they use a different system inside the engine.

---

## 🛠️ Troubleshooting

| Problem | Solution |
|---|---|
| `unable to find UltraWide_addr` in the log | Make sure you are running PES 2021 PC with Sider 7 and that no other UltraWide mod has already patched the same address. |
| Thin borders still visible | Set the resolution in `settings.exe` to your monitor's exact native resolution. |
| Module not loading | Check that `lua.enabled = 1` is set and the `lua.module` line is spelled correctly in `sider.ini`. |

---

## 🙏 Credits

- **elijio876**: address search
- **Mohamed2746**: module
- **digitalfoxx (PESWEB), nesa24 & Zyraxz**: original GFX LOD module this is based on
- **juce & nesa24**: Sider
