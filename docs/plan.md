# Implementation Plan — Baskit

Execution order for [architecture.md](./architecture.md), derived from [requirements.md](./requirements.md). Project is not yet scaffolded (no `pubspec.yaml`) — Phase 0 creates it.

## Phase 0 — Project Setup
- `flutter create` in repo root (org id, app name `baskit`).
- Add dependencies: `get`, `drift`, `sqlite3_flutter_libs`, `path_provider`, `path`, `google_sign_in`, `dio`, `connectivity_plus`, `cached_network_image`; dev: `drift_dev`, `build_runner`.
- Create the `lib/` folder tree from architecture.md §2.
- Configure Google Sign-In (Android `google-services.json`, iOS `GoogleService-Info.plist` / URL scheme) — **needs your Google Cloud / Firebase project credentials**.

## Phase 1 — Data Layer
- Define Drift tables (Users, Categories, Products, Favourites, Cart, SyncMeta) + DAOs with `watch...()` streams.
- Run `build_runner` to generate `database.g.dart`.
- Write repository interfaces + implementations (empty/stub logic first, unit-testable).

## Phase 2 — Remote Layer
- `ApiClient` (Dio, base URL `https://dummyjson.com`, error interceptor).
- `DummyJsonApi.getCategories()`, `getProducts(limit: 200)` with DTOs.

## Phase 3 — Auth
- `GoogleAuthService` wrapping `google_sign_in`.
- Auth screen + controller; persist session + user row in Drift `Users`.
- Splash screen routing logic (session check → Dashboard/Sync/Auth).

## Phase 4 — Initial Sync
- `SyncRepository.syncAll()`: categories → products (with progress stream), write `SyncMeta`.
- Non-dismissible Sync screen/dialog rendering per-step progress + `%`.
- No Internet / API failure states with Retry (per architecture.md §6).

## Phase 5 — Dashboard
- Profile, counts, last sync date — all from Drift.
- Refresh Data (re-trigger sync), Logout (clear session; decide whether to wipe local data).

## Phase 6 — Categories & Products
- Categories screen (Grid/List/Chips) from Drift.
- Products-by-category: search, sort (price/rating), pull-to-refresh, empty states.

## Phase 7 — Product Details, Favourites, Cart
- Product Details: image carousel, full info, Add to Favourite, Add to Cart.
- Favourites: list + remove.
- Cart: quantity update, delete, subtotal/discount/grand total, empty state.

## Phase 8 — Polish & Error States
- Wire `AppError`/`ErrorStateWidget` across all screens per architecture.md §6.
- Verify offline scenario end-to-end (airplane mode after first sync).

## Phase 9 — Submission Deliverables
- [ ] README.md (setup, architecture summary, how to run, known limitations)
- [ ] Export `docs/architecture-diagram.png` from the Mermaid diagram
- [ ] Screenshots of each screen → `docs/screenshots/`
- [ ] Build APK (`flutter build apk`) and IPA (`flutter build ipa`)
- [ ] Push to GitHub repository

## Open Items Needing Your Input
- Google OAuth client (Android SHA-1 / iOS bundle ID) for `google_sign_in` setup.
- App name / package id / bundle id for `flutter create`.
- Logout behavior: keep cached data for next login, or wipe Drift tables?
