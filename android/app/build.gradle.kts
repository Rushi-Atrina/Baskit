plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.baskit"
    // androidx.core:core-ktx 1.18.0 (pulled in transitively) requires
    // compileSdk 36; Flutter 3.29.2's default (flutter.compileSdkVersion)
    // is only 35, so it's overridden explicitly here.
    compileSdk = 36
    // connectivity_plus/google_sign_in_android/path_provider_android/
    // sqflite_android/sqlite3_flutter_libs all require this NDK version;
    // Flutter's default (flutter.ndkVersion) is older.
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.baskit"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        // androidx.core:core-ktx 1.18.0 requires minSdk 23; Flutter's
        // default (flutter.minSdkVersion) is 21.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
