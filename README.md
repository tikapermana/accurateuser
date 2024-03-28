# Accurate User

- Created date : I GEDE TIKA PERMANA - 28 Maret 2024 09.00 AM - 10.19 AM
> Aplikasi ini ditujukan untuk menampilkan list data user, melakukan sorting dan menambahkan data user.

> Aplikasi dibangun diatas flutter dengan Get sebagai state management, depedency injection dan routing pada aplikasi. Aplikasi dibuat seminimalis mungkin sehingga user tidak merasa penggunaan aplikasi ini melelahkan karena tata letak yang kurang baik dan tidak to the point dengan tujuan awal dibentuknya aplikasi.

> Get dipilih sebagai state management karena ringan, mensupport banyak kebutuhan, berguna sebagai observable value sehingga tidak dibutuhkannya lagi Statefull Widget dan setState()

### depedency yang digunakan
- Get - state management, depedency injection dan routing pada aplikasi
- intl - date formating, localisasi dan parsing
- http - API
- lottie - animation

### Struktur aplikasi utama

- core
- page

### Core

Core berisikan inti atau core dari aplikasi, tujuan dibuatnya core agar pengembangan kedepannya dapat lebih terstruktur dan komponent komponent pembentuk aplikasi dapat digunakan kembali(reusable) dan sebagai cetak biru dari aplikasi.
- Struktur directory pada core
    - constants - berisi template dasar seperti warna, assets dan ukuran agar aplikasi yang dibuat konsisten dan rapi
    - controllers - main controller yang dijalankan pertama kali guna mengatur aplikasi jika ada fungsi yang dijalankan - untuk session, greeting user, etc yang nantinya dapat digunakan kembali pada sub controller lainnya
    - models - kumpulan Class Object sebagai cetak biru dari Map data hasil api ataupun object yang digunakan untuk mengontrol aplikasi
    - routing - cetak biru dari name page dan route page yang digunakan dan mengikuti kaedah penggunaan Get
    - services - berisikan fungsi yang dapat di panggil di class lain sebagai fungsi untuk mengontrol API.
    - widgets - berisikan widget sebagai component terkecil dalam membentuk sebuah aplikasi. ditujukan widget tree dari aplikasi atau tampilan dari aplikasi konsisten dan mengurangi penulisan widget ganda

### Pages

Pages berisikan halaman halaman yang nantinya akan ditampilkan, pada directory page terdapat sub directory yang mencerminkan isi dari name directory tersebut.

> Contoh directory dashboard dalam directory Pages. directory dashboard ini berisikan widget tree atau komponen pembentuk dashboard.

- Dashboard
    - bindings - berisikan file binding yang dibutuhkan oleh Get sebagai state management tujuannya untuk mengikat controller dengan page dengan lazy put atau hanya put. dengan tujuan jika halaman tersebut membutuhkan banyak controller tidak semua controller saat pertama kali halaman dimuat akan di inisialisasi tetapi dialokasikan terlebih dahulu kemudian digunakan disaat yang tepat atau sudah terjadi interaksi data(pemanggilan)
    - controllers - berisikan file controller yang digunakan untuk mengontrol data data pada page
    - components - berisikan file komponen atau widget tree yang dikhususkan pada page dashboard(dengan tujuan tidak reusable) yang akan dipanggil pada main page
    - main - berisikan file main page dari dashboard


    <!--Untuk Dashboard Controller terdapat list object yang sama dengan yang ada pada maincontroller-->
    dengan tujuan jika ada perubahan data, master data masih ada dan juga jika kedepannya master data tersebut digunakan pada class lainnya sehingga aplikasi tidak perlu melakukan Get Data User maupun city kembali.

#### Hal yang perlu diperhatikan dengan Core Aplikasi
dijelaskan sebelumnya Core adalah directory yang berisikan inti atau core dari aplikasi.

- Services
- api_rest.dart :


    <!--Terdapat Class ApiRest-->
    <!--dengan fungsi onFetchOrProcessData yang digunakan sebagai main function untuk mengambil atau mengirimkan data dengan input parameter sebagai berikut : -->
    <!--keyword required digunakan untuk membuat param tersebut harus di parsing dari function yang memanggilnya(WAJIB ISI)-->
    <!--required String url,-->
    <!--required String module,-->
    <!--required String methodType,-->
    <!--Map<String, String>? header,-->
    <!--Map? body-->

    class ini mereturn Object ApiDataModel yang merupakan Class Object yang ditujukan untuk menampung return value dari response http agar seragam antara developer 1 dan lainnya sehingga tidak terjadi penulisan request http secara berulang dan cara yang berbeda

- app_url.dart


    <!--Terdapat Base Host yang merupkan base host anda bisa menuliskan host atau url dasar disini-->
    <!--Base routes digunakan untuk routing-->
    <!--Base destination url akhir atau tujuan akhir
