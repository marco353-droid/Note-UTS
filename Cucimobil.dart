import 'dart:io';

void main () {

var jalan = true;


List WaitingList = [];




Map PosA = {'plat' : null};
Map PosB = {'plat' : null};
Map PosC = {'plat' : null};

// function untuk menambahkan kendaraan ke pos atau waiting list
 tambahlist() {
    stdout.write("Masukkan Plat Kendaraan: ");
    var plat = stdin.readLineSync()!;
    if (PosA['plat'] == null) {
      PosA['plat'] = plat;
      print("Kendaraan dengan plat $plat telah ditambahkan ke Pos A.");
    } else if (PosB['plat'] == null) {
      PosB['plat'] = plat;
      print("Kendaraan dengan plat $plat telah ditambahkan ke Pos B.");
    } else if (PosC['plat'] == null) {
      PosC['plat'] = plat;
      print("Kendaraan dengan plat $plat telah ditambahkan ke Pos C.");
    } else {
      WaitingList.add(plat);
      print("Semua pos penuh. Kendaraan dengan plat $plat telah ditambahkan ke Waiting List.");
    }
}


// posisi kendaraan di setiap pos
posisi() {
  print("Posisi Kendaraan");
  print("Pos A : ${PosA['plat']}");
  print("Pos B : ${PosB['plat']}");
  print("Pos C : ${PosC['plat']}");
}



// Selesaikan pesanan kendaraan di pos yang dipilih dan pindahkan antrean jika ada
 selesai() {
    if (PosA['plat'] == null && PosB['plat'] == null && PosC['plat'] == null) {
      print("Tidak ada kendaraan yang sedang dicuci.");
      return;
    }

    print("Pilih pos yang ingin diselesaikan:");
    print("1. Pos A: ${PosA['plat'] ?? '-'}");
    print("2. Pos B: ${PosB['plat'] ?? '-'}");
    print("3. Pos C: ${PosC['plat'] ?? '-'}");
    stdout.write("Masukkan pilihan (1/2/3): ");
    var pilihan = stdin.readLineSync();

    Map? pos;
    String? namaPos;
    if (pilihan == '1') {
      pos = PosA;
      namaPos = 'Pos A';
    } else if (pilihan == '2') {
      pos = PosB;
      namaPos = 'Pos B';
    } else if (pilihan == '3') {
      pos = PosC;
      namaPos = 'Pos C';
    } else {
      print("Pilihan tidak valid.");
      return;
    }

    if (pos['plat'] == null) {
      print("Tidak ada kendaraan di $namaPos.");
      return;
    }

    print("Kendaraan dengan plat ${pos['plat']} telah selesai dicuci di $namaPos.");
    pos['plat'] = null;
    if (WaitingList.isNotEmpty) {
      pos['plat'] = WaitingList.removeAt(0);
      print("Kendaraan dengan plat ${pos['plat']} telah dipindahkan dari Waiting List ke $namaPos.");
    }
}


// keluar dari program
 keluar() {
  jalan = false;
  print("Terima kasih telah menggunakan layanan kami!");
}

while(jalan == true) {

print(" Clean Wash");
print("============================");
print("          Menu               ");
print("============================");
print("1. Tambah Menu");
print("2. Lihat Pos");
print("3. Waiting List");
print("4. selesaikan pesanan");
print("5. Keluar");
print("============================");
print("Masukkan Pilihan Anda (1/2/3/4/5): ");

String Inputmenu = stdin.readLineSync()!;

 int Menu = int.parse(Inputmenu); switch (Menu) {
    case 1:
    tambahlist();
      break;

      case 2:
      posisi();
      break;

      case 3:
      for (var i = 0; i < WaitingList.length; i++) {
        print("Waiting List ke-${i + 1}: ${WaitingList[i]}");
      }
      break;


      case 4:
        selesai();
    break ;

    case 5:
        keluar();
        break;

}
}
}