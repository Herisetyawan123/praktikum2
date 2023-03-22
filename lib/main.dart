import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // ini widget akar dari aplikasi
  @override
  Widget build(BuildContext context) {
    // setiap aplikasi wajib memiliki widget MaterialApp kalau tidak maka... (coba hilangin aja hehehe)
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // properti home berfungsi untuk memanggil halaman yang telah di buat
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// halaman MyHomePage yang bersifat stateful
// yg berarti halaman ini dinamis
class MyHomePage extends StatefulWidget {
  // jika ada tanda required wajib di isi
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // variable untuk menyimpan nomor
  int _counter = 0;
  // variable untuk menyimpan nomor index menu yang aktif di mulai dari nol sehingga nilanya nol
  int _selectedNavbar = 0;

  void _incrementCounter() {
    // berfungsi untuk ngebuild ulang aplikasi sehingga jika ada perubahan di aplikasi akan tampak berubah
    setState(() {
      // akan menambahkan variable _counter dengan 1,
      // kareba diletakan di dalam fungsi setState sehingga membuat perubahan tampil
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ini adalah method yang di tampilkan ketika aplikasi di run
    // dan jika widget ini terjadi re-run, biasanya ketika menggunakan fungsi setState

    // Scaffold adalah salah satu widget yang dapat nge wrapping dengan fitur yg lengkap,
    // seperti body (untuk menaruh widget yang mau kita buat)
    // appBar (seperti navbar di website)
    // bottomBarNavigation (seperti navbar versi di bawah aja, kayak yg di tokopedia, shopee coba lihat bawahnya)
    // floatingButton berfungsi sebagai tombol yang sifatnya melayang di aplikasi
    return Scaffold(
      appBar: AppBar(
        // ini judul
        title: Text(widget.title),
      ),
      // buat nengahin semua element widget
      body: Center(
        // column berfungsi untuk membuat kolom di aplikasi
        // jadi ketika ingin membuat widget yang layoutnya vertical kebawah maka wajib di kasih widget ini
        child: Column(
          // di column berfungsi membuat jadi ditengah setiap widget didalamnya dengan patokan vertical
          mainAxisAlignment: MainAxisAlignment.center,
          // di column berfungsi membuat jadi ditengah setiap widget didalamnya dengan patokan horizontal
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // membuat element/widget didalamnya menjadi sejajar
            Row(
              // di row berfungsi membuat jadi ditengah setiap widget didalamnya dengan patokan horizontal
              mainAxisAlignment: MainAxisAlignment.center,
              // di row berfungsi membuat jadi ditengah setiap widget didalamnya dengan patokan vertical
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // container berfungsi untuk membuat kotak kosong (biasanya digunakan untuk menampung widget lain dengan style tertentu)
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                // sifatnya sama seperti container cuma digunakan ketika tidak ada style/decoration
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            // widget untuk menampilkan text/tulisan
            const Text(
              'You have pushed the button this many times:',
              // cara styling text
              style: TextStyle(
                // mengatur warna
                color: Colors.blue,
                // mengatur ukuran
                fontSize: 20,
                // mengatur ketebalan
                fontWeight: FontWeight.w600,
              ),
              // supaya textnya menjadi ditengah
              textAlign: TextAlign.center,
            ),
            // widget untuk menampilkan text/tulisan
            Text(
              // ini adalah salah satu formating string supaya kita bisa ngeinject variable langsung ke dalam string
              '$_counter',
              // salah satu cara styling text
              style: Theme.of(context).textTheme.headline4,
            ),
            // widget untuk membuat button/tombol
            ElevatedButton(
              // properti yang wajib ada walaupun fungsinya Kosong
              // properti ini akan menjalankan action tertentu jika di tekan tombolnya
              onPressed: () {
                // fungsi setState berfungsi mendeteksi perubahan dan membuild ulang aplikasi
                setState(() {
                  _counter--;
                });
              },
              // child atau anak widget bisa di isi apa aja
              child: const Text("Kurangi"),
            ),
          ],
        ),
      ),
      // widget untuk membuat button yang melayang di bawah
      floatingActionButton: FloatingActionButton(
        // properti yang men-trigger button di tekan
        // dan jika ditekan akan menjalan fungsi _incrementCounter yang telah di buat di baris 41 (coba cek di atas)
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        // untuk menampilkan icon di buttonnya
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      // TODO: tambahan sedikit belum disampaikan kemarin
      // bottomNavigatorBar berfungsi membbuat navbar di bawah
      // coba di run pasti kelihatan hhehehe :)
      bottomNavigationBar: BottomNavigationBar(
        // setiap menu dimasukan di properti item
        items: const <BottomNavigationBarItem>[
          // menu satu di bungkus dengan widget ini
          BottomNavigationBarItem(
            // sebagai icon menu
            icon: Icon(Icons.home),
            // sebgai kabel menu
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        // index saat ini berfungsi mendeteksi menu mana yang aktif sesuai angaka yg ada di variable _selectedNavbar
        currentIndex: _selectedNavbar,
        // warna ketika menu aktif
        selectedItemColor: Colors.green,
        // warna ketika menu non-aktif
        unselectedItemColor: Colors.grey,
        // menampilkan label yang tidak aktif
        // experiment: coba jadiin fdlse dan liat perbedaanya
        showUnselectedLabels: true,
        // properti yang berjalan ketika di tekan
        onTap: (value) {
          // jika di tekan menu lain supaya pindah aktifnya
          setState(() {
            _selectedNavbar = value;
          });
        },
      ),
    );
  }
}
