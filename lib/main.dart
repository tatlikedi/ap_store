import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  //Widget veri tipidir. Widget tipinde değişken adı myApp olan değeri
  //runApp içerisine parametre olarak vermiş olduk.
}

class MyApp extends StatelessWidget {
  //void main gibi Widget build de sabittir değiştirilemez
  //Bir şey ekrana çizilecekse mutlaka bu fonksiyona bakar ve çalışabilmesi
  //için parametre olarak bir bağlam (context) alması gerekir! BuildContext bir türdür.
  //Bu bir fonk. olduğu için içerisinde ne döneceğini yani ekrana ne çizeceğini return ile biz belirtiriz.
  @override
  Widget build(BuildContext context) {
    //dönüş tipi widget olan fonk ve MaterialApp de bir widget olduğu için hata vermez.
    return MaterialApp(
      //Text widget'ı direkt kullanılamaz bu yüzden bunu MaterialApp içerisine almalıyız
      //Hiyerarşide en tepede MaterialApp vardır

      //Burada MaterialApp bir fonksiyondur ve parametereleri isim vererek gridiğimizde
      //bu parametreleri : ile birbirinden ayırırız (home, debugShow... vs parametre isimleridir)
      //Parametrelerin tipi ise widget'tır.

      //Eğer aşağıdaki satırı koymazsak sağ üstte debug yazısı olur. Uygulamının
      //Henüz yayında olmadığını belirtir.

      debugShowCheckedModeBanner: false,

      //Scaffold bir widgettır ve bir sürü bileşenden oluşur (body, appbar...)
      //MaterialApp uygulama, Scaffold ise uygulama mimarisi sağlar !!!
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HOME"),
          centerTitle: false,
          //action widgetı parametre olarak liste tipinde veriler alır
          //istediğimiz kadar icon vs ekleyebiliriz...
          actions: [
            IconButton(
                icon: Image.asset('varliklar/notification.png',
                    width: 24, height: 24),
                onPressed: () {}),
            IconButton(
                icon: Image.asset('varliklar/bag.png', width: 24, height: 24),
                onPressed: () {}),
          ],
        ),
        //Sağ taraftaki ampul sayesinde wrap with ... şeklinde bir şey ile otomatik sarmalayabiliriz
        //remove this widget dersek de üst widget2ı sarmaladığımız otomatik siler
        //column widgetı sayesinde elemanları yukarıdan aşağıya dizebiliriz
        //o yüzden child şeklinde tek değil liste notasyonu şeklinde children alır!
        body: const Column(
          children: [
            //sizedbox boş bir kutudur aradaki boşluk mesafesini ayarlamaya yarar.
            SizedBox(height: 24),
            Padding(
              //.all değil de sadece bir yerden vermek istersek only(left:16.0) vs deriz.
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  //aşağıdaki gibi yazarsak yazı yukarıya çıkmaz
                  //hintText: "Search Anything...",
                  //label şeklinde yaparsak bir şey yazarken yazı kaybolmaz yukarıya çıkar
                  labelText: "Search Anything...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        //color: Colors.black,
                        //kendi rengimizi oluşturmak istersek 0xFF koyup ondan sonra kodunu yapıştırmalıyız
                        color: Color(0xFFD1D5DB),
                        width: 1,
                      )),
                ),
              ),
            ),
            Padding(
              //horizontal olunca sağ ve soldan boşluk bırakır üstten bırakmaz.
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                      letterSpacing: 0.07,
                    ),
                  ),
                  //spacer boşluk bırakır arada ve bu boşluk cihazdan cihaza farklılık gösterip uyumlu çalışır.
                  Spacer(),
                  Text(
                    'View All ->',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),

            SingleChildScrollView(
              //alttaki satır ile yatay eksende kaymasını sağlarız.
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Image(image: AssetImage('varliklar/fashion.png')),
                      Text("Fashion"),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('varliklar/electronics.png')),
                      Text("Electronics"),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('varliklar/app.png')),
                      Text("Appliances"),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('varliklar/beauty.png')),
                      Text("Beauty"),
                    ],
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage('varliklar/furniture.png')),
                      Text("Furniture"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        //Drawer widgetı tıklandığında veya sürüklendiğinde sağ taraftan menü açılmasını sağlar
        drawer: const Drawer(),
      ),
    );
  }
}
