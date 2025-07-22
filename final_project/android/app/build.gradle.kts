import java.util.Properties


val envProperties = Properties().apply {
    load(rootProject.file(".env").inputStream())
}


val googleMapsApiKey = "AIzaSyA7yVJuIw-yeogIlD2qTkyFFjNIchS4L3M"


plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.final_project"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.final_project"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        resValue("string", "Maps_ANDROID_KEY", googleMapsApiKey) 
     }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}


flutter {
    source = "../.."
}
