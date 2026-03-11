@workspace Bertindak sebagai Senior Flutter Test Engineer. Saya memiliki proyek Flutter dengan struktur Clean Architecture (Data, Domain, Presentation) + Core. 

Saya ingin membuat Unit Test dan Widget Test yang komprehensif. Ikuti aturan ketat berikut untuk setiap file test yang kamu buatkan:

1. **Struktur Folder**: 
   - Buat file test di folder `test/` yang mencerminkan struktur `lib/`.
   - Contoh: `lib/features/auth/domain/usecases/login_usecase.dart` -> `test/features/auth/domain/usecases/login_usecase_test.dart`.

2. **Dependencies Testing**:
   - Gunakan package `mocktail` untuk mocking (bukan mockito).
   - Gunakan `flutter_test` untuk widget testing.
   - Gunakan `provider` untuk wrapping widget jika diperlukan.

3. **Standar Penamaan**:
   - Nama file harus diakhiri `_test.dart`.
   - Gunakan `group()` untuk mengelompokkan tes berdasarkan fungsi.
   - Gunakan `test()` dengan deskripsi yang jelas (Given-When-Then style).

4. **Strategi Testing Per Layer**:
   - **Domain (UseCases)**: Mock Repository. Tes apakah UseCase memanggil repository dengan benar dan mengembalikan Either (Failure/Success).
   - **Data (Repositories)**: Mock DataSource. Tes implementasi repository (apakah memanggil datasource & mapping model ke entity).
   - **Data (Models)**: Tes fromJson dan toJson (serialization).
   - **Presentation (Providers)**: Mock UseCase. Tes state management (loading, success, error).
   - **Presentation (Widgets)**: Pump widget, tes interaksi UI (tap button, input text), dan pastikan widget muncul sesuai state.
   - **Core**: Tes helper, extension, dan custom widget umum.

5. **Konteks Proyek**:
   - Saya akan memberikan file spesifik atau nama fitur.
   - Jangan buat semua file sekaligus. Fokus pada fitur yang saya minta.
   - Pastikan import path benar sesuai struktur `lib/` dan `test/`.

**Tugas Pertama**:
Mari kita mulai dengan fitur **`auth`**. Buatkan rencana file test apa saja yang perlu dibuat untuk fitur `auth` (Domain, Data, Presentation), lalu buatkan kode lengkap untuk **`login_usecase_test.dart`** dan **`login_page_test.dart`** sebagai contoh standar.