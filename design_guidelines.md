# Design Guidelines: Minecraft Mod Development Tool

## Design Approach

**System-Based Approach**: Drawing from VS Code, GitHub, and Linear's productivity-focused interfaces. This is a developer tool prioritizing efficiency, clarity, and functional density.

**Key Design Principles**:
- Information density over whitespace
- Instant visual feedback for all interactions
- Clear hierarchy between code, tools, and outputs
- Professional developer aesthetic

---

## Core Design Elements

### A. Typography

**Font Families**:
- **UI Text**: Inter or system fonts (`-apple-system, BlinkMacSystemFont, "Segoe UI"`)
- **Code**: JetBrains Mono or Fira Code (monospace with ligatures)

**Hierarchy**:
- Page titles: text-2xl font-semibold
- Section headers: text-lg font-medium
- Body text: text-sm
- Code: text-sm font-mono
- Labels: text-xs font-medium uppercase tracking-wide
- Buttons: text-sm font-medium

### B. Layout System

**Spacing Primitives**: Use Tailwind units of 2, 3, 4, 6, 8 for consistency
- Component padding: p-4, p-6
- Section gaps: gap-4, gap-6
- Margins: m-2, m-4
- Icon sizes: h-4 w-4, h-5 w-5, h-6 w-6

**Grid Structure**:
- Main layout: Three-column grid with resizable panels
- Left sidebar (250px-300px): File tree and project structure
- Center panel (flex-1): Code editor and generators
- Right sidebar (300px-350px): Configuration preview and color pickers

---

## C. Component Library

### Navigation & Structure

**Top Header Bar** (h-14):
- Logo/title on left
- Active file/section indicator in center
- Action buttons (Download, Export) on right
- Subtle bottom border for separation

**Sidebar File Tree**:
- Collapsible folder structure
- File icons with syntax highlighting indicators
- Hover states show full path
- Active file highlighted with subtle background

**Tab Navigation** (for multiple open files):
- Horizontal tabs with close buttons
- Modified indicator (dot) for unsaved changes
- Drag-to-reorder capability

### Code Editor Components

**Java Code Editor**:
- Full-height panel with line numbers
- Syntax highlighting zones (keywords, strings, comments)
- Minimap on right edge (optional based on content length)
- Status bar at bottom showing line/column

**Generator Panels**:
- Clear section headers with icons
- Form inputs with labels positioned above
- Generate button prominently placed
- Output area with copy-to-clipboard action

### Interactive Tools

**Color Picker Interface**:
- Large color swatch preview (h-20 w-20)
- Hex input field with validation
- RGB sliders for fine-tuning
- Preset color palette (Minecraft-themed colors)
- Live preview of selected color in context

**Configuration Preview Panel**:
- Visual representation of settings
- Color swatches showing TRAIL_COLOR, HITBOX_COLOR, HIT_EFFECT_COLOR
- Toggle switches for boolean settings
- Slider for HITBOX_MULTIPLIER with numerical display
- Hat style selector with icon previews

### Forms & Inputs

**Text Inputs**:
- Border style with focus ring
- Helper text below inputs
- Error states with red accent
- Monospace font for code-related inputs

**Sliders**:
- Custom styled range inputs
- Value display integrated
- Snap-to-increment option for multipliers

**Checkboxes/Toggles**:
- Toggle switches for boolean configs
- Checkbox groups for multi-select options
- Clear active/inactive states

**Buttons**:
- Primary: Solid background for main actions (Generate, Download)
- Secondary: Outlined style for auxiliary actions
- Icon buttons: Square aspect ratio for toolbar actions
- Size variants: text-sm px-4 py-2 for standard, px-6 py-3 for primary

### Data Display

**File Structure Tree**:
- Indentation: pl-4 per level
- Folder/file icons from Heroicons
- Expandable/collapsible with smooth transitions
- Right-click context menu for actions

**Code Output Areas**:
- Monospace text with syntax highlighting
- Copy button in top-right corner
- Line numbers on left
- Max height with scroll for long outputs

**Status Indicators**:
- Generation progress bars
- Success/error toast notifications
- File save status indicators

### Overlays & Modals

**Download Modal**:
- Centered modal (max-w-2xl)
- Checklist of files to include
- Download format selector (ZIP/Individual files)
- Large download button at bottom

**Help/Documentation Tooltips**:
- Positioned near relevant UI elements
- Dark background with light text
- Small arrow pointing to trigger element

---

## Layout Specifications

**Main Application Layout**:
```
┌─────────────────────────────────────────────────────┐
│ Header (h-14)                                       │
├──────────┬────────────────────────┬─────────────────┤
│ Sidebar  │   Code/Generator       │  Config Panel   │
│ (w-64)   │   (flex-1)             │  (w-80)         │
│          │                        │                 │
│ Files    │   Editor Area          │  Color Picker   │
│ Tree     │   with Tabs            │  Previews       │
│          │                        │  Settings       │
│          │   ┌──────────────┐     │                 │
│          │   │ Output Area  │     │                 │
│          │   └──────────────┘     │                 │
└──────────┴────────────────────────┴─────────────────┘
```

**Responsive Behavior**:
- Desktop (lg+): Three-column layout
- Tablet (md): Collapsible sidebar, two-column main area
- Mobile: Single column with drawer navigation

---

## Visual Hierarchy & Spacing

**Section Separation**:
- Major sections: border-b with py-6
- Sub-sections: py-4
- Component groups: gap-6

**Vertical Rhythm**:
- Headers: mb-4
- Form groups: space-y-4
- Button groups: gap-3

**Panel Padding**:
- Main panels: p-6
- Nested panels: p-4
- Compact areas: p-3

---

## Icons

**Icon Library**: Heroicons (outlined for navigation, solid for actions)

**Key Icons**:
- File icons: DocumentTextIcon, FolderIcon
- Actions: DownloadIcon, ClipboardCopyIcon, AdjustmentsIcon
- Status: CheckCircleIcon, ExclamationCircleIcon
- Tools: ColorSwatchIcon, CodeBracketIcon, CogIcon

**Icon Sizing**: h-5 w-5 for most UI, h-4 w-4 for compact areas

---

## Functional Notes

- **No hero section** - This is a tool, not marketing
- **Dense information layout** - maximize screen real estate
- **Minimal animations** - focus on instant feedback over decorative motion
- **Professional aesthetic** - dark mode friendly, high contrast
- **Clear action hierarchy** - primary actions always visible and accessible

This tool prioritizes **developer productivity** with efficient layouts, clear visual hierarchy, and functional density appropriate for a code editing and generation interface.