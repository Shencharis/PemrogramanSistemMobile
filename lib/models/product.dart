// Variabel & tipe data produk
const String namaToko = 'TokoKita';
const List<String> daftarKategori = ['Elektronik', 'Fashion', 'Makanan'];

void demoVariabel() {
  var namaProduk = 'Kaos Polos Cotton';
  namaProduk = 'Kaos Polos Cotton Combed 30s';
  print('var namaProduk        : $namaProduk');

  final DateTime waktuDibuat = DateTime.now();
  print('final waktuDibuat     : $waktuDibuat');

  print('const namaToko        : $namaToko');

  int stok = 12;
  double harga = 75000.0;
  String nama = 'Kaos Polos Combed 30s';
  bool tersedia = true;

  print('int    stok           : $stok');
  print('double harga          : $harga');
  print('String nama           : $nama');
  print('bool   tersedia       : $tersedia');

  print('List kategori         : $daftarKategori');
  print('Jumlah kategori       : ${daftarKategori.length}');

  Map<String, dynamic> produkMentah = {
    'id': 'P001',
    'name': nama,
    'price': harga,
    'category': 'Fashion',
    'stock': stok,
    'available': tersedia,
  };
  print('Map produkMentah      : $produkMentah');
  print('Akses Map (name)      : ${produkMentah['name']}');
  print('\n');
}

//Perhitungan harga dengan operator
void demoOperator() {
  double hargaA = 75000;
  double hargaB = 125000;
  int stokA = 12;
  int jumlahBeli = 5;

  print('-- Aritmatika --');
  print('Total 2 item A + 1 item B : ${(hargaA * 2) + hargaB}');
  print('Selisih harga (B - A)     : ${hargaB - hargaA}');
  print('Sisa stok A setelah beli  : ${stokA - jumlahBeli}');
  print('Harga rata-rata           : ${(hargaA + hargaB) / 2}');
  print('Sisa bagi (12 % 5)        : ${stokA % jumlahBeli}');
  print('Pembagian bulat (12 ~/ 5) : ${stokA ~/ jumlahBeli}');

  print('\n-- Perbandingan --');
  print('hargaA == hargaB : ${hargaA == hargaB}');
  print('hargaA != hargaB : ${hargaA != hargaB}');
  print('hargaA <  hargaB : ${hargaA < hargaB}');
  print('hargaB >= 100000 : ${hargaB >= 100000}');
  print('stokA  <= 10     : ${stokA <= 10}');

  print('\n-- Logika --');
  bool layakTampil = stokA > 0 && hargaA > 0;
  bool perluRestock = stokA < 5 || !(stokA > 0);
  print('Layak ditampilkan (stok>0 && harga>0) : $layakTampil');
  print('Perlu restock (stok<5 || stok habis)  : $perluRestock');
  print('Negasi (!layakTampil)                 : ${!layakTampil}');
  print('\n');
}

//Status stok & diskon (if-else/switch)
String labelStatusStok(int stok) {
  if (stok <= 0) {
    return 'Habis';
  } else if (stok <= 5) {
    return 'Stok Terbatas';
  } else {
    return 'Tersedia';
  }
}

double diskonKategori(String kategori) {
  switch (kategori) {
    case 'Elektronik':
      return 10;
    case 'Fashion':
      return 15;
    case 'Makanan':
      return 5;
    default:
      return 0;
  }
}

void demoControlFlow() {
  print('-- if-else: status stok --');
  for (int s in [0, 3, 20]) {
    print('Stok $s\t-> ${labelStatusStok(s)}');
  }

  print('\n-- for: total belanja --');
  List<double> hargaKeranjang = [75000, 125000, 32000, 18500];
  double total = 0;
  for (int i = 0; i < hargaKeranjang.length; i++) {
    total += hargaKeranjang[i];
    print('Item ke-${i + 1} : ${hargaKeranjang[i]} | subtotal: $total');
  }
  print('TOTAL BELANJA : $total');

  print('\n-- while: simulasi stok berkurang --');
  int stok = 5;
  while (stok > 0) {
    print(
      'Terjual 1 unit, sisa stok: ${stok - 1} (${labelStatusStok(stok - 1)})',
    );
    stok--;
  }

  print('\n-- switch-case: diskon per kategori --');
  for (String k in daftarKategori) {
    print('$k\t-> diskon ${diskonKategori(k)}%');
  }
  print('\n');
}

//Function hitungHargaSetelahDiskon
double hitungHargaSetelahDiskon(double harga, {double persenDiskon = 0}) {
  double potongan = harga * (persenDiskon / 100);
  return harga - potongan;
}

String formatRupiah(double harga) => 'Rp ${_pisahRibuan(harga)}';

String _pisahRibuan(double angka) {
  String s = angka.toStringAsFixed(0);
  String hasil = '';
  int hitung = 0;
  for (int i = s.length - 1; i >= 0; i--) {
    hasil = s[i] + hasil;
    hitung++;
    if (hitung % 3 == 0 && i != 0) hasil = '.$hasil';
  }
  return hasil;
}

bool isLayakTampil(Product p) => p.stock > 0 && p.price > 0;

void demoFunction() {
  double harga = 200000;

  print('Harga awal                       : ${formatRupiah(harga)}');
  print(
    'Tanpa argumen diskon (default 0) : ${formatRupiah(hitungHargaSetelahDiskon(harga))}',
  );
  print(
    'Diskon 15%  (named parameter)    : ${formatRupiah(hitungHargaSetelahDiskon(harga, persenDiskon: 15))}',
  );
  print(
    'Diskon sesuai kategori Elektronik: '
    '${formatRupiah(hitungHargaSetelahDiskon(harga, persenDiskon: diskonKategori("Elektronik")))}',
  );
  print('Arrow function formatRupiah      : ${formatRupiah(1250000)}');
  print('\n');
}

// Class Product & DiscountedProduct
class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  int stock;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  String getStatusStok() => labelStatusStok(stock);
  String get hargaFormatted => formatRupiah(price);
  double get persenDiskonKategori => diskonKategori(category);
  String get deskripsiAman => description ?? '(Belum ada deskripsi)';

  void kurangiStok(int jumlah) {
    if (jumlah <= 0) {
      print('Jumlah pembelian tidak valid.');
    } else if (jumlah > stock) {
      print('Gagal: stok $name hanya tersisa $stock.');
    } else {
      stock -= jumlah;
      print(
        '$name terjual $jumlah unit. Sisa stok: $stock (${getStatusStok()})',
      );
    }
  }

  String tampilkanInfo() {
    return '[$id] $name\n'
        '   Kategori    : $category\n'
        '   Harga       : $hargaFormatted\n'
        '   Stok        : $stock (${getStatusStok()})\n'
        '   Deskripsi   : $deskripsiAman';
  }

  @override
  String toString() => '$name (${formatRupiah(price)})';
}

class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  double hargaFinal() =>
      hitungHargaSetelahDiskon(price, persenDiskon: discountPercent);
  double get besarPotongan => price - hargaFinal();

  @override
  String tampilkanInfo() {
    return '${super.tampilkanInfo()}\n'
        '   Diskon      : $discountPercent% (hemat ${formatRupiah(besarPotongan)})\n'
        '   Harga Akhir : ${formatRupiah(hargaFinal())}';
  }
}

void demoClass() {
  final p1 = Product(
    id: 'P001',
    name: 'Kaos Polos Combed 30s',
    price: 75000,
    imageUrl: 'assets/images/kaos.jpg',
    category: 'Fashion',
    stock: 12,
    description: 'Kaos katun combed 30s, adem dan nyaman dipakai harian.',
  );

  final p2 = Product(
    id: 'P002',
    name: 'Mouse Wireless',
    price: 95000,
    imageUrl: 'assets/images/mouse.jpg',
    category: 'Elektronik',
    stock: 3,
  );

  print(p1.tampilkanInfo());
  print('');
  print(p2.tampilkanInfo());
  print('description p2 (mentah) : ${p2.description}');
  print('');

  final p3 = DiscountedProduct(
    id: 'P003',
    name: 'Headset Gaming RGB',
    price: 320000,
    imageUrl: 'assets/images/headset.jpg',
    category: 'Elektronik',
    stock: 7,
    description: 'Headset gaming dengan lampu RGB dan mikrofon lepas-pasang.',
    discountPercent: 20,
  );
  print(p3.tampilkanInfo());
  print('p3 adalah Product?  ${p3 is Product}');
  print('');

  print('-- Simulasi transaksi --');
  p2.kurangiStok(2);
  p2.kurangiStok(5);
  print('\n');
}

//daftar produk
final List<Product> daftarProduk = [
  Product(
    id: 'P001',
    name: 'Kaos Polos Combed 30s',
    price: 75000,
    imageUrl: 'assets/images/kaos.jpg',
    category: 'Fashion',
    stock: 12,
    description: 'Kaos katun combed 30s, adem dan nyaman dipakai harian.',
  ),
  Product(
    id: 'P002',
    name: 'Mouse Wireless 2.4GHz',
    price: 95000,
    imageUrl: 'assets/images/mouse.jpg',
    category: 'Elektronik',
    stock: 3,
  ),
  Product(
    id: 'P003',
    name: 'Headset Gaming RGB',
    price: 320000,
    imageUrl: 'assets/images/headset.jpg',
    category: 'Elektronik',
    stock: 7,
    description: 'Headset gaming dengan lampu RGB dan mikrofon lepas-pasang.',
  ),
  Product(
    id: 'P004',
    name: 'Keyboard Mekanik TKL',
    price: 450000,
    imageUrl: 'assets/images/keyboard.jpg',
    category: 'Elektronik',
    stock: 0,
    description: 'Keyboard mekanik 87 key, switch biru, hot-swappable.',
  ),
  Product(
    id: 'P005',
    name: 'Hoodie Fleece Unisex',
    price: 185000,
    imageUrl: 'assets/images/hoodie.jpg',
    category: 'Fashion',
    stock: 9,
    description: 'Hoodie bahan fleece tebal, tersedia ukuran M sampai XXL.',
  ),
  Product(
    id: 'P006',
    name: 'Tote Bag Kanvas',
    price: 55000,
    imageUrl: 'assets/images/totebag.jpg',
    category: 'Fashion',
    stock: 20,
  ),
  Product(
    id: 'P007',
    name: 'Kopi Arabika Gayo 250g',
    price: 68000,
    imageUrl: 'assets/images/kopi.jpg',
    category: 'Makanan',
    stock: 4,
    description: 'Biji kopi arabika Gayo single origin, medium roast.',
  ),
  Product(
    id: 'P008',
    name: 'Keripik Singkong Pedas',
    price: 18500,
    imageUrl: 'assets/images/keripik.jpg',
    category: 'Makanan',
    stock: 35,
    description: 'Keripik singkong level pedas 3, kemasan 200 gram.',
  ),
];

double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;
  for (Product p in keranjang) {
    total += p.price;
  }
  return total;
}

//status stock
void demoTugasMandiri1() {
  final contoh1 = Product(
    id: 'X1',
    name: 'Contoh Stok Habis',
    price: 10000,
    imageUrl: '-',
    category: 'Fashion',
    stock: 0,
  );
  final contoh2 = Product(
    id: 'X2',
    name: 'Contoh Stok Terbatas',
    price: 10000,
    imageUrl: '-',
    category: 'Fashion',
    stock: 3,
  );
  final contoh3 = Product(
    id: 'X3',
    name: 'Contoh Stok Tersedia',
    price: 10000,
    imageUrl: '-',
    category: 'Fashion',
    stock: 20,
  );

  print(
    '${contoh1.name} (stock=${contoh1.stock}) -> getStatusStok() = ${contoh1.getStatusStok()}',
  );
  print(
    '${contoh2.name} (stock=${contoh2.stock}) -> getStatusStok() = ${contoh2.getStatusStok()}',
  );
  print(
    '${contoh3.name} (stock=${contoh3.stock}) -> getStatusStok() = ${contoh3.getStatusStok()}',
  );
  print('\n');
}

void demoTugasMandiri2() {
  print('Selamat datang di $namaToko');
  print('Jumlah produk terdaftar : ${daftarProduk.length}\n');

  for (Product p in daftarProduk) {
    print(
      '${p.id} | ${p.name.padRight(24)} | ${p.hargaFormatted.padLeft(12)} '
      '| stok ${p.stock.toString().padLeft(2)} | ${p.getStatusStok()}',
    );
  }
  print('\n');
}

void demoTugasMandiri3() {
  List<Product> keranjang = [daftarProduk[0], daftarProduk[2], daftarProduk[7]];
  print('-- Isi keranjang --');
  for (Product p in keranjang) {
    print('- ${p.name} : ${p.hargaFormatted}');
  }
  double total = hitungTotalBelanja(keranjang);
  print('\nTotal belanja (hitungTotalBelanja) : ${formatRupiah(total)}');
  print('\n');
}

void main() {
  demoVariabel();
  demoOperator();
  demoControlFlow();
  demoFunction();
  demoClass();
  demoTugasMandiri1();
  demoTugasMandiri2();
  demoTugasMandiri3();
}
