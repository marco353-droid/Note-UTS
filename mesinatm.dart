import 'dart:io';

void main(){
  var ceklogin = true;
  var jalan = true;
  var pin = 112233;
  var Saldo = 2000000;

  login(){
    print('\n================================');
    print('Sistem Bank');
    print('================================');
    stdout.write('Masukan PIN Anda:');
    int inputpin = int.parse(stdin.readLineSync()!);
    
    if(inputpin == pin){
      ceklogin = false;
    }
    //tanya user pin anda?
    //input pin user
    //jika pin == input pin user maka
    //ceklogin = false
  
  }

  tampilmenu(){
    //tampil 3 jenis menu:
    //1. Cek Saldo
    //2. Setor Tunai
    //3. Tarik Tunai
  }
  	
  ceksaldo(){
    print('Saldo Anda: $Saldo');
  }

  setor(){

    stdout.write('Masukan Nominal Yang Ingin Disetor:');
    int inputsaldo = int.parse(stdin.readLineSync()!);

    Saldo = inputsaldo + Saldo;
    //tanya user mau setor brp?
    //tambah saldo dengan hasil input user
  }

  tarik(){
    int nilai = 0;
    int nilai1 = 0;
    int totaltarik = 0;

    stdout.write('Masukan Nominal Yang Ingin Ditarik:');
    int inputtarik = int.parse(stdin.readLineSync()!);
    if(inputtarik < 50000){
      print('Nominal Minimal 50.000');
    }
    
    print('\n================================');
    print('Pecahan:');
    print('1. 50.000');
    print('2. 100.000');
    print('================================');
    stdout.write('Silahkan Pilih Pecahan Nominal (1/2):');
    int inputpecahan = int.parse(stdin.readLineSync()!);

    if(inputpecahan == 1){
      nilai = inputtarik ~/ 50000;
      print('50.000 (x$nilai)');
      Saldo = Saldo - inputtarik;
    }else if (inputpecahan == 2){
      totaltarik = totaltarik + inputtarik;
      nilai = inputtarik ~/ 100000;
      inputtarik = inputtarik - (100000*nilai);
      if(inputtarik == 50000){
        nilai1 = inputtarik ~/ 50000;
        print('50.000 (x$nilai1)');
      }
      print('100.000 (x$nilai)');
      Saldo = Saldo - totaltarik;
    }else{
      // stdout.write('Input Tidak Valid');
      print('Input Tidak Valid');
    }
    //tanya user mau tarik brp?
    //lalu tanya user pecahan 50rb atau 100rb?
    //pakai pembagian bulat (~/) cth:
    //250rb ~/ 100rb = 2 
  }

  while(jalan == true){
    if(ceklogin == true){
      login();
    }else{
      tampilmenu();
      print('\n================================');
      print('1. Cek Saldo');
      print('2. Setor Tunai');
      print('3. Tarik Tunai');
      print('================================');
      stdout.write('Silahkan Pilih Menu (1/2/3):');
      int pilihan = int.parse(stdin.readLineSync()!);

      switch(pilihan) {
      case 1 :
      ceksaldo();
      case 2 :
      setor();
      case 3 :
      tarik();
      }
      //tanya user menu yang mana
      //switch case
      //case 1: ceksaldo();
      //case 2: setor();
      //case 3: tarik();
   
    }
  }
  //jika ceklogin == true maka 
  //jalankan login()
  //sebaliknya jalankan menu
}