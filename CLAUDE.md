# Baskit — Product Catalog App

Flutter app: Google SSO + offline-first product catalog (GetX + Drift). Assignment brief: [docs/requirements.md](docs/requirements.md).

## Docs
- [docs/requirements.md](docs/requirements.md) — assignment spec (source of truth)
- [docs/architecture.md](docs/architecture.md) — layered architecture, folder structure, Drift schema, data flow
- [docs/plan.md](docs/plan.md) — phased implementation plan

## Non-negotiable rules
- Data flow is **API → Repository → Drift → GetX Controller → UI**. Only Repositories call the API (during initial sync / explicit refresh). Controllers/UI never call the API directly — they read Drift via `watch...()` streams.
- State/DI/Routing: GetX. Local DB: Drift. Auth: `google_sign_in`.
- Project is not yet scaffolded — no `pubspec.yaml`/`lib/` yet. See docs/plan.md Phase 0.

## Commands (once scaffolded)
- `flutter pub get`
- `dart run build_runner build --delete-conflicting-outputs` (after editing Drift tables)
- `flutter analyze`
- `flutter test`
- `flutter run`
