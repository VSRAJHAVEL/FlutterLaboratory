# 📱 Flutter Laboratory (`FlutterLaboratory`)

[![GitHub Repo](https://img.shields.io/badge/GitHub-vsrajhavel%2FFlutterLaboratory-blue?logo=github)](https://github.com/vsrajhavel/FlutterLaboratory)
[![Flutter](https://img.shields.io/badge/Flutter-3.44.8-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5+-0175C2?logo=dart)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platforms-Chrome%20%7C%20Windows%20%7C%20Android-green)]()

Complete repository containing source code, project scaffolds, and lab records for **all 10 Flutter Laboratory Experiments**.

---

## 📑 Index of Experiments

| Ex. No. | Title | Description / Aim | Key Widgets & Tech | Project Folder |
| :---: | :--- | :--- | :--- | :---: |
| **01** | **Working with Widgets & Layouts** | Fresh Fruits application displaying list of fruits with cards and details | `Row`, `Column`, `Container`, `Card`, `ListView` | [`exp_01/`](./exp_01) |
| **02** | **Adaptive & Responsive UI Design** | ShopEase responsive e-commerce catalog adapting to different screen widths | `LayoutBuilder`, Breakpoints (2/3/4 cols), `GridView.builder` | [`exp_02/`](./exp_02) |
| **03** | **Interactivity - Input & Forms** | Interactive product store with live search filtering, category selection, and sorting | `TextField`, `ChoiceChip`, `DropdownButtonFormField`, `setState()` | [`exp_03/`](./exp_03) |
| **04** | **Form Validation using Stateful Widgets** | Car Mileage Calculator validating user inputs dynamically | `Form`, `TextFormField`, `GlobalKey<FormState>`, `TextEditingController` | [`exp_04/`](./exp_04) |
| **05** | **Navigation & Routing** | Multi-screen application with routes, argument passing, and result return | `Navigator.push`, `Navigator.pushNamed`, `RouteSettings`, `ModalRoute` | [`exp_05/`](./exp_05) |
| **06** | **Data Persistence Using SQLite** | StudentHub student record management with SQLite database (CRUD operations) | `sqflite`, `sqflite_common_ffi_web`, SQLite queries | [`exp_06/`](./exp_06) |
| **07** | **Data Persistence Using Firestore** | Student registration and real-time retrieval with Google Cloud Firestore | `cloud_firestore`, `StreamBuilder`, `snapshots()`, Cloud NoSQL | [`exp_07/`](./exp_07) |
| **08** | **Searching in Google Firestore** | Search student records in Cloud Firestore using range queries | Firestore `where()`, `isGreaterThanOrEqualTo`, `ListView.builder` | [`exp_08/`](./exp_08) |
| **09** | **Update Information in Firestore** | Modify existing student records in Cloud Firestore based on Register Number | Firestore `update()`, `DocumentReference`, `FutureBuilder` | [`exp_09/`](./exp_09) |
| **10** | **Manual User Login with Firestore** | Authentication app with salt generation, SHA-256 password hashing & dashboard | `crypto` (SHA-256), `Random.secure()`, Firestore auth collection | [`exp_10/`](./exp_10) |

---

## 🚀 How to Run the Experiments on Your Laptop

### Quick Run using the Interactive Launcher

Run any experiment with a single command from the project root:

#### Using PowerShell:
```powershell
.\run_experiment.ps1
```
Or directly pass the experiment number:
```powershell
.\run_experiment.ps1 1
```

#### Using Command Prompt / Double-Click:
Double-click `run_experiment.bat` or run:
```cmd
run_experiment.bat 1
```

---

### Running Individual Experiments Manually

You can navigate into any experiment's directory and run it directly in **Google Chrome**, **Microsoft Edge**, or **Windows Desktop**:

```bash
# 1. Navigate to the experiment directory
cd exp_01

# 2. Get dependencies (already initialized)
flutter pub get

# 3. Run in Google Chrome
flutter run -d chrome

# (Optional) Run on Windows Desktop:
flutter run -d windows
```

---

## 📄 Lab Record Documents

All 10 Lab Record Word documents are included in the repository, updated with the repository link:
- `Flutter_Experiment_1_Lab_Record_raj.docx`
- `Flutter_Experiment_2_Lab_Record_raj.docx`
- `Flutter_Experiment_3_Lab_Record_raj.docx`
- `Flutter_Experiment_4_Lab_Record_raj.docx`
- `Flutter_Experiment_5_Lab_Record_raj.docx`
- `Flutter_Experiment_6_Lab_Record_raj.docx`
- `Flutter_Experiment_7_Lab_Record_raj.docx`
- `Flutter_Experiment_8_Lab_Record_raj.docx`
- `Flutter_Experiment_9_Lab_Record_raj.docx`
- `Flutter_Experiment_10_Lab_Record_raj.docx`

---

## 🛠️ Requirements & Setup

1. **Flutter SDK**: v3.24.0 or higher (Installed)
2. **Web Browser**: Google Chrome or Microsoft Edge
3. **Dart SDK**: v3.5.0 or higher
