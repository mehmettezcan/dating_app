# 🌟 Dating App - Flutter

---

## ✨ Features

* 🔐 User Authentication (Login & Register)
* 🏠 Home Page with Infinite Scroll, Pull-to-Refresh
* ❤️ Favorite/Unfavorite Movie Functionality
* 👤 Profile Page with User Info & Favorite Movies
* 🧱 Bottom Navigation with State Preservation
* 🎨 Custom Dark Theme
* 🌍 Localization (English 🇺🇸 / Turkish 🇹🇷)
* 🧺 Logger Service using `loggy`
* 🎯 Clean Architecture (Domain, Data, Presentation)
* 🧱 MVVM + Bloc State Management

---

## 🛠️ Technologies

| Layer        | Libraries / Tools                |
| ------------ | -------------------------------- |
| UI / Theme   | `Flutter`, `Material3`, `intl`   |
| State Mgmt   | `flutter_bloc`, `equatable`      |
| Network      | `dio`                            |
| Storage      | `hive`, `flutter_secure_storage` |
| Logging      | `loggy`                          |
| Localization | `intl`, `intl_utils`             |

---

## 📂 Folder Structure

```
lib/
├── core/
│   ├── theme/
│   ├── logger/
│   └── l10n/
├── features/
│   ├── auth/
│   ├── home/
│   └── profile/
└── main.dart
```

---

## 🌐 Localization Setup (Intl)

This project supports both English and Turkish using `intl`.

### 1. `l10n.yaml` (at root):

```yaml
arb-dir: lib/core/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
output-class: S
```

### 2. Create ARB Files:

`lib/core/l10n/app_en.arb`

```json
{
  "@@locale": "en",
  "login": "Login",
  "register": "Register",
  "email": "Email",
  "password": "Password"
}
```

`lib/core/l10n/app_tr.arb`

```json
{
  "@@locale": "tr",
  "login": "Giriş",
  "register": "Kayıt Ol",
  "email": "E-posta",
  "password": "Şifre"
}
```

### 3. Generate Localization Files:

```bash
flutter pub run intl_utils:generate
```

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/mehmettezcan/dating-app.git
cd dating-app
```

### 2. Get dependencies

```bash
flutter pub get
```

### 3. Generate localization

```bash
flutter pub run intl_utils:generate
```

### 4. Run the app

```bash
flutter run
```

---

## 🌌 Change Language

Localization supports English and Turkish. The app detects system language automatically. You can change it manually in future updates.

---

## 📧 Contact

Created by **Mehmet Tezcan** – [LinkedIn](https://www.linkedin.com/in/mehmet-tezcan-aa49159b/)
Feel free to reach out!
