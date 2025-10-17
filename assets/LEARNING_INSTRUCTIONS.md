# Instruksi Pembelajaran Flutter

**Catatan Visual**: Waktu belajar total 110 menit, 70% live coding, 30% teori.

## 1. Review Week 1: ListView.builder

### Lokasi: `lib/pages/home_page.dart`

**Tugas:**
- Pahami kembali cara kerja ListView.builder (loop index → item)
- Visual: diagram alur "Data → Builder → Widget"
- Contoh kecil kode yang menampilkan 3 makanan dalam list

**Konsep yang Dipelajari:**
- Builder pattern dalam Flutter
- Loop index untuk mengakses data
- itemBuilder function
- ListView.builder vs ListView biasa

## 2. Switch List ↔ Grid

### Lokasi: `lib/pages/home_page.dart`

**Tugas:**
- Buat tombol switch antara List dan Grid
- Tunjukkan perbedaan tampilan daftar vs grid
- Visual perbandingan dua kolom: ListView di kiri, GridView di kanan
- Sorot bagian kode crossAxisCount dan itemBuilder

**Langkah-langkah:**

1. **Aktifkan ViewSwitcher:**
```dart
ViewSwitcher(
  onViewChanged: (isGridView) {
    setState(() {
      this.isGridView = isGridView;
    });
  },
),
```

2. **Tambahkan state management:**
```dart
bool isGridView = false;
```

3. **Implementasikan conditional rendering:**
```dart
isGridView
    ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return FoodCardWidget(foodItem: foodItems[index]);
        },
      )
    : ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return VerticalFoodItemWidget(foodItem: foodItems[index]);
        },
      ),
```

**Konsep yang Dipelajari:**
- Toggle button atau switch di AppBar
- GridView vs ListView
- crossAxisCount untuk jumlah kolom
- Conditional rendering dengan ternary operator

## 3. Bottom Navigation Bar

### Lokasi: `lib/pages/main_page.dart`

**Tugas:**
- Jelaskan struktur dasar Scaffold dengan BottomNavigationBar
- Visual: layout dengan 5 tab (Home, Menu, Cart, Favorites, Profile)
- Tips tentang currentIndex dan setState() untuk berpindah tab
- Highlight kesalahan umum: lupa mengatur type: BottomNavigationBarType.fixed

**Langkah-langkah:**

1. **Ubah MainPage menjadi StatefulWidget:**
```dart
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  int _cartItemCount = 3;

  final List<Widget> _pages = [
    const HomePage(),
    const MenuPage(),
    const CartPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];
```

2. **Tambahkan Bottom Navigation Bar:**
```dart
return Scaffold(
  body: _pages[_selectedIndex],
  bottomNavigationBar: NavigationBar(
    backgroundColor: Colors.white,
    selectedIndex: _selectedIndex,
    indicatorColor: Colors.transparent,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    onDestinationSelected: (index) {
      setState(() {
        _selectedIndex = index;
      });
    },
    destinations: [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home, color: Colors.green),
        label: 'Home',
      ),
      // Tambahkan 4 destination lainnya...
    ],
  ),
);
```

**Konsep yang Dipelajari:**
- StatefulWidget untuk state management
- NavigationBar widget untuk bottom navigation
- currentIndex dan setState() untuk berpindah tab
- List<Widget> untuk menyimpan halaman-halaman
- onDestinationSelected callback function

## 4. Navigasi & Passing Data

### Lokasi: `lib/widgets/food_card_widget.dart` dan `lib/widgets/vertical_food_item_widget.dart`

**Tugas:**
- Tampilkan diagram visual: HomePage → DetailPage
- Navigator bekerja seperti tumpukan kertas – push untuk maju, pop untuk kembali
- Passing data antar halaman

**Langkah-langkah:**

1. **Tambahkan import FoodDetailPage:**
```dart
import '../pages/food_detail_page.dart';
```

2. **Tambahkan GestureDetector:**
```dart
return GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(foodItem: foodItem),
      ),
    );
  },
  child: Container(
    // ... existing container code
  ),
);
```

**Konsep yang Dipelajari:**
- GestureDetector untuk menangkap tap events
- Navigator.push untuk navigasi ke halaman baru
- MaterialPageRoute untuk routing
- Passing data dengan constructor parameter
- Context untuk navigasi

## 5. Gambar Produk: Image.asset

### Lokasi: `lib/widgets/food_image_section.dart`

**Tugas:**
- Jelaskan cara menambahkan aset di pubspec.yaml
- Visual langkah-langkah: folder → pubspec → kode Image.asset()
- Beri contoh penggunaan parameter fit dan height
- Tampilkan hasil visual gambar produk di layar ponsel mockup

**Langkah-langkah:**

1. **Tambahkan gambar ke `assets/images/food_image.png`**

2. **Update pubspec.yaml:**
```yaml
flutter:
  assets:
    - assets/images/
```

3. **Ganti Icon dengan Image.asset:**
```dart
Image.asset(
  'assets/images/food_image.png',
  width: double.infinity,
  height: 300,
  fit: BoxFit.cover,
)
```

**Konsep yang Dipelajari:**
- Asset management di Flutter
- pubspec.yaml configuration
- Image.asset widget
- BoxFit untuk mengatur tampilan gambar
- Parameter width, height, dan fit

## 6. Overlay Rating (Stack + SVG)

### Lokasi: `lib/widgets/food_image_section.dart`

**Tugas:**
- Penjelasan teori singkat tentang Stack dan Positioned
- Kode singkat untuk overlay teks di atas gambar
- Tambahkan logo pub.dev dan langkah instalasi flutter_svg
- Visual perbandingan: gambar polos vs gambar dengan overlay rating bintang

**Langkah-langkah:**

1. **Install package flutter_svg:**
```bash
flutter pub add flutter_svg
```

2. **Import package:**
```dart
import 'package:flutter_svg/flutter_svg.dart';
```

3. **Implementasikan Stack dengan Positioned:**
```dart
child: Stack(
  children: [
    // Image atau background
    Center(
      child: Icon(Icons.fastfood, size: 120, color: Colors.grey[400]),
    ),
    // Rating badge
    Positioned(
      top: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.green[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.white, size: 16),
            const SizedBox(width: 4),
            Text(
              rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),
```

**Konsep yang Dipelajari:**
- Stack widget untuk layering
- Positioned widget untuk positioning
- Package installation dari pub.dev
- flutter_svg package
- Overlay design pattern

## 7. Ingredients Section

### Lokasi: `lib/widgets/ingredients_section.dart`

**Tugas:**
- Tampilkan barisan ikon bahan makanan (misal beef, cheese, onion)
- Jelaskan konsep Row, SvgPicture.asset, dan MainAxisAlignment.spaceAround
- Tambahkan catatan opsional: warna ikon SVG bisa diubah dengan colorFilter

**Langkah-langkah:**

1. **Install package flutter_svg:**
```bash
flutter pub add flutter_svg
```

2. **Update pubspec.yaml:**
```yaml
dependencies:
  flutter_svg: ^2.0.9

flutter:
  assets:
    - assets/icons/
```

3. **Import package:**
```dart
import 'package:flutter_svg/flutter_svg.dart';
```

4. **Ganti Icon dengan SVG:**
```dart
SvgPicture.asset(
  'assets/icons/${ingredient.toLowerCase()}.svg',
  width: 24,
  height: 24,
  colorFilter: ColorFilter.mode(
    Colors.green[600]!,
    BlendMode.srcIn,
  ),
),
```

**File SVG yang Dibutuhkan:**
- beef.svg
- lettuce.svg
- tomato.svg
- cheese.svg
- chicken.svg
- salmon.svg
- dll (sesuai dengan ingredients yang ada)

**Konsep yang Dipelajari:**
- Row widget untuk horizontal layout
- SvgPicture.asset untuk SVG icons
- MainAxisAlignment.spaceAround
- colorFilter untuk mengubah warna SVG
- Asset management untuk SVG files

## 8. Pilihan Ukuran (Size Selector)

### Lokasi: `lib/widgets/size_selection_section.dart` dan `lib/pages/food_detail_page.dart`

**Tugas:**
- Jelaskan penggunaan ChoiceChip atau ElevatedButton untuk memilih ukuran
- Visual: tiga tombol berlabel Small, Medium, Large dengan satu aktif
- Highlight kode sederhana setState(() => selectedSize = size)

**Langkah-langkah:**

1. **Tambahkan parameter onSizeSelected:**
```dart
final Function(String) onSizeSelected;

const SizeSelectionSection({
  super.key,
  required this.sizeOptions,
  required this.selectedSize,
  required this.onSizeSelected,
});
```

2. **Tambahkan GestureDetector:**
```dart
child: GestureDetector(
  onTap: () => onSizeSelected(entry.key),
  child: Container(
    // ... existing container code
  ),
),
```

3. **Implementasikan callback di FoodDetailPage:**
```dart
SizeSelectionSection(
  sizeOptions: widget.foodItem.sizeOptions,
  selectedSize: selectedSize,
  onSizeSelected: (size) {
    setState(() {
      selectedSize = size;
    });
  },
),
```

**Konsep yang Dipelajari:**
- GestureDetector untuk menangkap tap events
- State management dengan setState()
- Callback functions untuk komunikasi antar widget
- Conditional styling berdasarkan state

## 9. Add Extras (CheckboxListTile)

### Lokasi: `lib/pages/food_detail_page.dart`

**Tugas:**
- Konsep: pengguna bisa menambah topping
- Visual mockup: daftar checkbox (Extra Cheese, Bacon, Avocado)
- Tekankan prinsip penggunaan boolean state (true / false)
- Tambahkan catatan: interaksi belum mengubah harga — itu akan dibuat di minggu berikutnya

**Langkah-langkah:**

1. **Tambahkan import ExtrasSection:**
```dart
import '../widgets/extras_section.dart';
```

2. **Tambahkan state variable:**
```dart
Set<String> selectedExtras = {};
```

3. **Tambahkan ExtrasSection widget:**
```dart
ExtrasSection(
  extras: widget.foodItem.extras,
  selectedExtras: selectedExtras,
  onExtraChanged: (extraId, isSelected) {
    setState(() {
      if (isSelected) {
        selectedExtras.add(extraId);
      } else {
        selectedExtras.remove(extraId);
      }
    });
  },
),
```

4. **Tambahkan extras price calculation:**
```dart
double extrasPrice = 0.0;
for (String extraId in selectedExtras) {
  final extra = widget.foodItem.extras.firstWhere(
    (e) => e.id == extraId,
    orElse: () => widget.foodItem.extras.first,
  );
  extrasPrice += extra.price;
}

return (basePrice + extrasPrice) * quantity;
```

**Konsep yang Dipelajari:**
- Checkbox widget untuk multiple selection
- Set data structure untuk menyimpan multiple values
- State management dengan Set operations (add/remove)
- Price calculation dengan multiple selections
- Callback functions dengan multiple parameters

## 10. Integrasi Keseluruhan

**Visual**: tampilan lengkap DetailPage (gambar, rating, ingredient, size, extras)

**Garis besar hierarki widget:**
```
Scaffold
├── Column
    ├── Stack (gambar + rating)
    ├── Section ingredient
    ├── Section size
    ├── Section extras
    └── Bagian bawah (qty & total)
```

**Highlight area yang dibahas di sesi ini vs template (gunakan warna berbeda)**

## 11. Ringkasan Materi

**Format 2 kolom:**

| Hari Ini Dipelajari: | Sudah Ada di Template: |
|---------------------|----------------------|
| List → Grid switch | AppBar, nama, harga, deskripsi |
| BottomNav | Bagian bawah (qty & total) |
| Navigator.push | |
| Stack + SVG | |
| ChoiceChip & Checkbox | |

## Tips Pembelajaran:
1. Mulai dengan ListView.builder untuk memahami konsep dasar
2. Lanjut dengan switch List ↔ Grid untuk memahami conditional rendering
3. Tambahkan Bottom Navigation Bar untuk memahami state management
4. Implementasikan navigasi untuk memahami passing data
5. Gunakan Image.asset untuk memahami asset management
6. Buat overlay dengan Stack untuk memahami positioning
7. Implementasikan SVG icons untuk memahami package management
8. Buat size selector untuk memahami interaksi widget
9. Implementasikan checkbox untuk memahami multiple selection
10. Setiap langkah memiliki TODO comment untuk guidance
