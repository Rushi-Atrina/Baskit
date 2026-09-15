---
name: glassmorphism
description: Apply glassmorphism (frosted-glass) visual styling to Flutter screens/widgets in this app — blurred translucent panels, subtle borders, soft shadows, vivid gradient backdrop. Use when asked to restyle UI to glassmorphism, add glass/frosted-glass effects, or keep the app's design consistent with the glass theme when adding new screens/widgets. Visual-only: never change widget logic, state, navigation, or behavior — only decoration/appearance.
---

# Glassmorphism styling for Baskit

Visual language: frosted-glass panels floating over a colorful, blurred
gradient backdrop. Defining traits — all four must be present for a surface
to read as "glass":

1. **Translucency** — background color at low opacity (~0.15–0.35 alpha),
   never fully opaque.
2. **Backdrop blur** — `BackdropFilter` + `ImageFilter.blur(sigmaX: 15-20,
   sigmaY: 15-20)` behind the translucent layer. Without blur it's just a
   transparent card, not glass.
3. **Thin bright border** — 1–1.5px, white/light at low-medium opacity
   (~0.3–0.5), to catch a simulated light edge.
4. **Soft, diffuse shadow** — low opacity, large blur radius, small
   offset — never a hard/dark drop shadow.

A vivid or gradient backdrop is required behind glass panels — glass over a
flat white/gray background barely reads as glass. Keep content legible:
never place low-contrast text directly on blurred glass without checking
contrast against the busiest part of the backdrop.

## How this project implements it

- `lib/shared/widgets/glass_container.dart` — `GlassContainer` widget.
  Wraps `ClipRRect(BackdropFilter(... ImageFilter.blur ...))` with a
  translucent `Container` (gradient or solid fill), rounded corners, thin
  light border, soft shadow. Configurable: `borderRadius`, `blurSigma`,
  `opacity`, `padding`, `margin`, `color`, `borderColor`, `boxShadow`.
  Use this instead of `Card`/opaque `Container` for any surface that should
  read as glass (cards, app bars, bottom nav, bottom sheets, dialogs,
  chips, buttons where appropriate).
- `lib/app/theme/app_theme.dart` — `AppColors.heroGradient` (and any
  background gradient) is the backdrop glass sits on. Keep it colorful;
  don't flatten it to a single pale color or the effect disappears.
  Existing semantic colors (`primary`, `error`, `success`, `textPrimary`,
  etc.) keep their **names and roles** — only surface/background colors
  change to translucent variants so other code that references
  `AppColors.*` by name keeps compiling and keeps correct meaning.

## Rules when applying this skill

- **Visual-only.** Do not add, remove, or rename widgets' functional props,
  controllers, callbacks, routes, or business logic. Only change
  `decoration`/`color`/wrapping-in-GlassContainer/theme values.
- Prefer editing shared widgets (`ProductCard`, theme, a shared
  `GlassContainer`) over duplicating glass decoration inline in every
  screen — keeps the look consistent and easy to tune later.
- Every screen needs the gradient backdrop behind its Scaffold body (or a
  shared app-level background) for the glass panels to have something to
  blur — check `Scaffold.backgroundColor` / `extendBodyBehindAppBar` when
  restyling a screen.
- Keep tap targets, spacing, and layout untouched — only restyle the
  decoration layer.
- Verify with `flutter analyze` after changes; do not introduce new
  dependencies unless the user asks — `dart:ui`'s `ImageFilter.blur` and
  `BackdropFilter` (Flutter SDK, no package) are sufficient for glass
  effects.
