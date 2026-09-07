# vrftoprs

Authorized compatibility package for running the exported **T** football tools in **Kick Off**.

## Included

- Seven tool families: Clear, Dribble, Long, Pass, Shoot, Tackle, and TI.
- 67 tool modules and seven controller scripts from `ServerStorage.Assets.Tools`.
- Supporting client modules, including the requested T physics source.
- 265 animation paths and asset IDs.
- 148 default keybind values exported from `ServerScriptService.Firebase.DefaultSettings.Keybinds`.
- T curve, spin, stopper, ground, and knuckle-ball physics.
- T's exact `ClientReact` BodyVelocity applier.
- A Kick Off adapter for `OwnershipEvent`, the local `Kick` sound, and `ReplicatedSounds/BallHit`.
- F4 shutdown and cleanup.

All Humanoid `WalkSpeed` and `JumpPower` assignments were removed. The original speed controller was replaced by a no-op compatibility shim.

## Load

The repository must be publicly readable for the raw GitHub URL below to work without embedding a GitHub token:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/SwaggasDeCatas/vrftoprs/main/dist/vrftoprs.lua"))()
```

Press **F4** to stop the package and remove the runtime-created tools and physics movers.

## Keybind overrides

Set overrides before running the loader. Keys use paths relative to `DefaultSettings.Keybinds`:

```lua
_G.VRFToPRSKeybinds = {
    ["Dribble.BackheelFlickUp"] = "H",
    ["Shoot.Volley"] = "E",
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/SwaggasDeCatas/vrftoprs/main/dist/vrftoprs.lua"))()
```

The complete template is in [`src/config/Keybinds.lua`](src/config/Keybinds.lua). Animation IDs are in [`src/config/Animations.lua`](src/config/Animations.lua).

## Rebuild

```powershell
node scripts/build.mjs
```

This regenerates `dist/vrftoprs.lua` from the repository sources and manifest.

## Notes

- The runtime creates only missing PlayerData/keybind and animation containers on the client.
- Existing Kick Off tools keep their names; colliding imported tools are prefixed with `T_`.
- The raw exports are retained under `src/tools` and `src/support` for auditing.
