# Implementation Plan — Baskit

Execution order for [architecture.md](./architecture.md), derived from [requirements.md](./requirements.md).

**Status: Phases 0–7 done and verified running on an Android emulator (Splash → Auth confirmed by screenshot). Phase 8 substantially covered inline as each phase landed. Phase 9 (submission deliverables) not started.**

## Phase 0 — Project Setup ✅
- `flutter create` in repo root, project `baskit`, org `com.example` (placeholder — real Google Sign-In needs a real one eventually), Android + iOS.
- Dependencies added as needed per phase (not all up front): `get`, `drift`, `drift_flutter`, `path_provider`, `google_sign_in`, `dio`, `connectivity_plus`, `cached_network_image`; dev: `drift_dev`, `build_runner`.
- **Android toolchain had to be bumped beyond Flutter's scaffolded defaults** to satisfy transitive dependency requirements (discovered by actually running the app, not by `flutter analyze`): compileSdk 35→36, AGP 8.7.0→8.9.1, Gradle 8.10.2→8.12, Kotlin plugin 1.8.22→2.1.0, minSdk 21→23, NDK→27.0.12077973. See `android/app/build.gradle.kts` / `android/settings.gradle.kts` comments.
- `lib/` folder tree per architecture.md §2.

## Phase 1 — Data Layer ✅
Drift tables + DAOs + repositories (Category/Product/Favourite/Cart), all with `watch...()` streams. Unit-tested against an in-memory database.

## Phase 2 — Remote Layer ✅
`ApiClient` (Dio) + `DummyJsonApi.getCategories()`/`getProducts(limit: 200)` + DTOs mapping straight to Drift companions.

## Phase 3 — Auth ✅ (code) / ⏳ (Google Cloud config pending)
`GoogleAuthService` + `AuthRepository` + Splash/Auth screens wired and confirmed working. **Real sign-in will fail until the Google Cloud OAuth clients exist** — you deferred providing the iOS client ID; Android needs no code change, just SHA-1 registration (debug SHA-1 already generated, see earlier chat).

## Phase 4 — Initial Sync ✅
`SyncRepository.syncAll()` with connectivity pre-check, byte-progress on the products download, non-dismissible Sync screen, Retry on failure.

## Phase 5 — Dashboard ✅
Profile/counts/last-sync from Drift; View Categories, Refresh Data, Logout, and Logout-and-Delete-Account (user-requested addition beyond the original spec).

## Phase 6 — Categories & Products ✅
Categories grid; Products search/sort/pull-to-refresh/empty-states.

## Phase 7 — Product Details, Favourites, Cart ✅
Image carousel, Add to Favourite/Cart; Favourites grid with remove; Cart with quantity controls and live Subtotal/Discount/Grand Total.

## Phase 8 — Polish & Error States — mostly done
- Error handling (No Internet / API Failure / No products / Search empty / Empty cart) is wired per-screen inline (via `ApiException` + simple `Rx<String?>` state) rather than the shared `AppError`/`ErrorStateWidget` architecture.md originally sketched — functionally equivalent, less abstraction. Docs updated to match reality is still TODO if it matters for grading.
- Offline scenario (airplane mode after first sync) not yet manually verified end-to-end — worth doing on-device before submission.

## Phase 9 — Submission Deliverables (not started)
- [ ] README.md (setup, architecture summary, how to run, known limitations)
- [ ] Export `docs/architecture-diagram.png` from the Mermaid diagram in architecture.md
- [ ] Screenshots of each screen → `docs/screenshots/`
- [ ] Build APK (`flutter build apk`) and IPA (`flutter build ipa`) — IPA needs Apple signing you'll need to provide/do
- [ ] Push to GitHub repository

## Open Items Needing Your Input
- iOS Google OAuth client ID (you said skip for now) — needed before Google Sign-In will actually work end-to-end.
- Real package id / bundle id, if you want one other than `com.example.baskit` before submission (Google OAuth clients are tied to it — changing later means re-registering).
- Release keystore SHA-1 for the release-build Android OAuth client (separate from the debug one already generated), needed before a release APK can use Google Sign-In.
