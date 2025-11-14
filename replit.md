# Axmed555 Visuals - Minecraft 1.21.1 Forge Mod

## Overview

This is a Minecraft Forge mod for version **1.21.1** that adds customizable visual effects and cosmetic features to the game. The mod includes trail particles, enlarged hitbox rendering, hit effects, and cosmetic hat styles with **gradient color support** - all configurable through an in-game GUI with RGB color customization.

The mod is designed for players who want to enhance their visual experience in Minecraft with fully customizable effects.

## Recent Updates (November 12, 2025)

### **v3.0 RELEASE - Massive Feature Expansion** 🎉
- **8 Trail Particle Styles** with RGB customization:
  - Normal, Fire, Stars, Lightning, Magic, Hearts, Spiral, Ender
  - Each style uses unique particle types and effects
- **New Visual Effects**:
  - Jump Effects - circular particle waves on jump
  - Sprint Effects - smoke/cloud particles while running
  - Attack Effects - critical particles + flash on hit
  - Kill Effects - fireworks + explosion + totem particles on entity kill
- **Trajectory Visualization** (purely cosmetic):
  - Projectile trajectories (ender pearls, snowballs, arrows, eggs) with yellow particle arcs
  - Player jump trajectories with blue particles showing predicted landing path
  - Optimized with AABB bounding box (32-block radius) and tick throttling
- **4 Sky Effect Styles**:
  - Stars - twinkling blue stars around player
  - Shooting Stars - falling stars with trails
  - Aurora - rainbow northern lights with HSL gradients
  - Sparkling - magical sparkles + fireworks
- **Complete Russian Localization** for all GUI elements
- **Performance Optimizations**:
  - Efficient entity queries with getEntitiesOfClass + AABB
  - Trajectory throttling (every 2-3 ticks)
  - Particle spawn rate limits
  - Proper jump velocity caching to prevent arc flattening

### Major Version Upgrade: 1.16.5 → 1.21.1
- **Complete API rewrite** for Minecraft 1.21.1 + Forge 52.1.6
- Migrated from Java 8 to **Java 21** (required for 1.21.1)
- Updated ForgeGradle from 4.1.+ to **6.0.46**
- Updated Gradle wrapper from 6.9 to **8.5**
- Fixed all deprecated API calls:
  - `Component` (network.chat instead of deprecated paths)
  - `PoseStack` → `GuiGraphics` for rendering
  - `RedstoneParticleData` → `DustParticleOptions`
  - `InputEvent.Key` → `ClientTickEvent` for key handling
  - `KeyBinding` → `KeyMapping` with proper registration

### New Feature: Gradient Colors for Hats
- Each cosmetic hat now has **2 RGB colors** for gradient effects:
  - **Crown**: Gradient sparkling particles
  - **Aura**: Vertical gradient from ground to head
  - **Wings**: Left wing (color 1) and right wing (color 2)
  - **Halo**: Rainbow gradient around circle
- Config GUI updated with R1/G1/B1 and R2/G2/B2 sliders per hat

### Build System Improvements
- Updated settings.gradle with plugin management for ForgeGradle 6
- Added Foojay Toolchains Convention plugin for Java 21 management
- Increased network timeouts to 60 minutes for Russian users with blocked Forge repos
- Updated gradle.properties for Java 21 and Gradle 8 compatibility

### Web Application Enhancements
- Added dropdown menu with three download options:
  1. **Исходники мода** - Customizable project files generated from web interface
  2. **Готовый архив** - Ready-to-build archive (66 KB) with all necessary files
  3. **Инструкция** - Comprehensive Russian-language build guide
- Added informational alert on homepage with step-by-step instructions
- Translated UI elements to Russian for better accessibility

### Documentation
- Updated `ИНСТРУКЦИЯ-ПО-СБОРКЕ.md` for Minecraft 1.21.1:
  - **Java 21** installation and setup (Eclipse Temurin)
  - **VPN setup** required for Russian users (ProtonVPN or GoodbyeDPI)
  - Step-by-step build process
  - Gradient color feature explanation
  - Troubleshooting for network timeouts
  - Mod installation with Forge 52.1.6+

### Known Issues & Solutions
- **Network blocks in Russia**: Forge Maven repositories blocked, **VPN required**
- Recommended: ProtonVPN (free) or GoodbyeDPI for bypassing blocks
- First build takes 10-30 minutes due to downloading ~200MB of dependencies
- Building on Replit still challenging; users should build locally with VPN

## User Preferences

Preferred communication style: Simple, everyday language (Russian and English).

## Mod Architecture

### Forge Mod Structure

**Main Files:**
- `AxmedVisuals.java` - Mod entry point, config registration, event setup
- `Config.java` - ForgeConfigSpec with all mod settings
- `ClientEventHandler.java` - Rendering engine for visual effects
- `ConfigScreen.java` - In-game configuration GUI

**Build System:**
- ForgeGradle 6.0.46 for Minecraft 1.21.1
- Java 21 source/target compatibility (required)
- Gradle 8.5 wrapper included
- Modern Forge build pipeline with NeoForge compatibility

**Mod Metadata:**
- modId: `axmed555_visuals`
- Version: 1.0.0
- Target: **Minecraft 1.21.1** with **Forge 52.1.6+**
- Requires Java 21 runtime

### Visual Effects System

**Trail Particles (8 Styles):**
- **Normal**: Classic DustParticleOptions with custom RGB
- **Fire**: FLAME particles with lava drips
- **Stars**: Enchantment table + note particles
- **Lightning**: Flame + end rod particles for electric effect
- **Magic**: Witch spell + dragon breath particles
- **Hearts**: Heart particles + cherry leaves
- **Spiral**: Portal + soul particles in spiral pattern
- **Ender**: Dragon breath + reverse portal particles
- All styles support custom RGB color configuration
- Selectable via config GUI with Russian labels

**Enlarged Hitbox Rendering:**
- Renders enlarged hitbox outline around player
- Custom RGB color for outline
- Fixed 1.5x size multiplier
- Uses LevelRenderer for line rendering (1.21.1 API)
- Toggle on/off via config

**Hit Effect Particles:**
- Custom RGB particles on entity damage
- Spawns burst of colored particles
- Uses DustParticleOptions for color customization
- Toggle on/off via config

**Jump Effects:**
- Circular particle waves on player jump
- Configurable RGB colors
- Multiple particle rings expanding outward
- Toggle on/off via config

**Sprint Effects:**
- Smoke/cloud particles while sprinting
- Spawns behind player when moving fast
- Configurable RGB colors
- Toggle on/off via config

**Attack Effects:**
- Critical hit particles on entity attack
- Flash effect with enchanted hit particles
- Configurable RGB colors
- Toggle on/off via config

**Kill Effects:**
- Firework explosions on entity kill
- Totem of Undying particles
- Large explosion particles
- Configurable RGB colors
- Toggle on/off via config

**Trajectory Visualization (Purely Cosmetic):**
- **Projectile Trajectories**: Yellow particle arcs showing predicted flight path
  - Supports ender pearls, snowballs, arrows, eggs
  - Accurate physics simulation with gravity and drag
  - Optimized with AABB (32-block radius) + tick throttling (every 2 ticks)
- **Jump Trajectories**: Blue particles showing predicted jump landing
  - Captures initial velocity on ground-to-air transition
  - Accurate arc simulation without double-drag application
  - Cached motion prevents arc flattening at apex
- Toggle on/off via config

**Sky Effects (4 Styles):**
- **Stars**: Twinkling blue stars in sphere around player
- **Shooting Stars**: Falling stars with END_ROD particle trails
- **Aurora**: Rainbow northern lights using HSL color gradients
- **Sparkling**: Magical sparkles + firework particles
- All styles use interval-based throttling for performance
- Selectable via config GUI
- Toggle on/off via config

**Cosmetic Hats:**
- Crown: Glowing particles above head
- Aura: Enchantment particles circling body
- Wings: Firework particles behind player
- Halo: Soul particles in circle above head
- Selectable via config GUI

### Configuration System

**ForgeConfigSpec:**
- Type: CLIENT config
- File: `.minecraft/config/axmed555_visuals-client.toml`
- Auto-saves when config screen closes

**Settings:**
- RGB colors (0-255) for Trail, Hitbox, Hit Effects, Jump, Sprint, Attack, Kill
- Boolean toggles for all visual effects:
  - SHOW_TRAIL, SHOW_HITBOX, SHOW_HIT_EFFECTS
  - SHOW_JUMP_EFFECTS, SHOW_SPRINT_EFFECTS
  - SHOW_ATTACK_EFFECTS, SHOW_KILL_EFFECTS
  - SHOW_TRAJECTORIES (projectiles + jumps)
  - SHOW_SKY_EFFECTS
- Enum values:
  - TRAIL_STYLE (NORMAL, FIRE, STARS, LIGHTNING, MAGIC, HEARTS, SPIRAL, ENDER)
  - HAT_STYLE (NONE, CROWN, AURA, WINGS, HALO)
  - SKY_STYLE (STARS, SHOOTING_STARS, AURORA, SPARKLING)
- Hat gradient colors (R1/G1/B1 and R2/G2/B2 for each hat)
- String values for BIND_MESSAGE_1 through BIND_MESSAGE_4 (keybind messages)

**Config GUI:**
- Accessible via Mods → Axmed555 Visuals → Config or Right Shift key (configurable)
- Interactive Forge sliders for RGB values
- Toggle buttons for on/off settings
- Hat style selector buttons
- Text input fields for message binds (NumPad 1-4)
- Shows current keybind configuration at bottom
- Saves automatically on screen close via `removed()` override

### Keybind System

**Registered Keys:**
- `openGuiKey` (Right Shift) - Opens configuration GUI
- `bind1Key` (NumPad 1) - Sends BIND_MESSAGE_1
- `bind2Key` (NumPad 2) - Sends BIND_MESSAGE_2
- `bind3Key` (NumPad 3) - Sends BIND_MESSAGE_3
- `bind4Key` (NumPad 4) - Sends BIND_MESSAGE_4

**Message Sending:**
- Supports both chat messages and commands (starting with /)
- Uses `sendChatMessage()` API for 1.16.5 compatibility
- Empty messages are ignored

**Localization:**
- English (en_us.json) and Russian (ru_ru.json) key names
- Keys appear in Minecraft Controls settings

### Event System

**Client Events:**
- `RenderWorldLastEvent` - Main rendering loop for particles, hitbox, hats
- `LivingHurtEvent` - Triggers hit effect particles on damage
- `KeyInputEvent` - Handles keybind inputs for GUI and message binds

**Event Registration:**
- ClientEventHandler and KeyInputHandler registered in `clientSetup()` via MinecraftForge.EVENT_BUS

### Build and Distribution

**Building the Mod:**
```bash
cd minecraft-mod
./gradlew build    # Linux/Mac
gradlew.bat build  # Windows
```

**Output:**
- JAR file: `build/libs/axmed555-visuals-1.0.0.jar`
- Install to: `.minecraft/mods/`

**Requirements:**
- Java Development Kit 8+
- Minecraft Forge 1.16.5 (version 36.2.39+)

### Project Structure

```
minecraft-mod/
├── src/main/
│   ├── java/com/axmed555/visuals/
│   │   ├── AxmedVisuals.java
│   │   ├── Config.java
│   │   ├── ClientEventHandler.java
│   │   ├── KeyInputHandler.java
│   │   └── gui/ConfigScreen.java
│   └── resources/
│       ├── META-INF/mods.toml
│       └── assets/axmed555_visuals/lang/
│           ├── en_us.json
│           └── ru_ru.json
├── build.gradle
├── gradle.properties
├── settings.gradle
├── gradlew / gradlew.bat
├── README.md
└── INSTALL-RU.md
```

### Technical Implementation Details

**Particle System:**
- Uses `RedstoneParticleData(r, g, b, size)` for custom colors
- Values converted from 0-255 int to 0.0-1.0 float range
- Particles spawned via `level.addParticle()`

**Hitbox Rendering:**
- Uses `WorldRenderer.renderLineBox()` for outline
- RenderType.LINES for proper rendering
- Matrix stack transformations for camera offset
- Blend mode and depth testing toggled for visibility

**Config Persistence:**
- ModConfig reference stored in AxmedVisuals
- `clientConfig.save()` called from ConfigScreen.removed()
- Covers all exit paths (Done button, ESC key)
- ForgeConfigSpec handles file I/O automatically