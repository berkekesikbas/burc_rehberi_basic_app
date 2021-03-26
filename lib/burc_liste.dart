import 'package:burc_rehberi_app/burc.dart';
import 'package:burc_rehberi_app/strings.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  static List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];
    for (int i = 0; i < 12; i++) {
      String burcAdi = Strings.BURC_ADLARI[i];
      String burcTarihi = Strings.BURC_TARIHLERI[i];
      String burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];
      String burcKucukResim = "${Strings.BURC_ADLARI[i].toLowerCase()}" +
          "${i + 1}" +
          ".png"; //Koc --> koc2.png
      String burcBuyukResim = "${Strings.BURC_ADLARI[i].toLowerCase()}" +
          "_buyuk" +
          "${i + 1}" +
          ".png"; //Koc --> koc_buyuk2.png

      Burc eklenecekBurc =
          Burc(burcAdi, burcTarihi, burcDetayi, burcKucukResim, burcBuyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oAnListeyeEklenenBurc = tumBurclar[index];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/burcDetay/$index"),
          leading: Image.asset(
            "images/" + oAnListeyeEklenenBurc.burcKucukResim,
            width: 64,
            height: 64,
          ),
          title: Text(
            oAnListeyeEklenenBurc.burcAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              oAnListeyeEklenenBurc.burcTarihi,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
