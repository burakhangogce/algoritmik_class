// To parse this JSON data, do
//
//     final saveIslem = saveIslemFromJson(jsonString);

import 'dart:convert';

SaveIslemInputModel saveIslemFromJson(String str) =>
    SaveIslemInputModel.fromJson(json.decode(str));

String saveIslemToJson(SaveIslemInputModel data) => json.encode(data.toJson());

class SaveIslemInputModel {
  SaveIslemInputModel({
    this.islemNo,
    required this.branchNo,
    this.yIciAkisBatch,
    this.today,
    required this.startedTheProcess,
    required this.islemGiris,
    required this.pesinIskontoBilgileri,
  });

  int? islemNo;
  int branchNo;
  bool? yIciAkisBatch;
  DateTime? today;
  String startedTheProcess;
  IslemGiris islemGiris;
  PesinIskontoBilgileri pesinIskontoBilgileri;

  factory SaveIslemInputModel.fromJson(Map<String, dynamic> json) =>
      SaveIslemInputModel(
        islemNo: json["IslemNo"],
        branchNo: json["BranchNo"],
        yIciAkisBatch: json["YIciAkisBatch"],
        today: DateTime.parse(json["Today"]),
        startedTheProcess: json["StartedTheProcess"],
        islemGiris: IslemGiris.fromJson(json["IslemGiris"]),
        pesinIskontoBilgileri:
            PesinIskontoBilgileri.fromJson(json["PesinIskontoBilgileri"]),
      );
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'IslemNo': islemNo,
      'BranchNo': branchNo,
      'YIciAkisBatch': yIciAkisBatch,
      'Today': today,
      'StartedTheProcess': startedTheProcess,
      'IslemGiris': islemGiris,
      'PesinIskontoBilgileri': pesinIskontoBilgileri,
    };
  }
}

class IslemGiris {
  IslemGiris({
    this.ekNo,
    this.dogmusDogacak,
    required this.pesiniskontoOdendigindeode,
    required this.acilislem,
    required this.istihbaratsizIslem,
    this.acilOperGonder,
    required this.refactoring,
    required this.bildirimli,
    required this.teminatHesap,
    required this.yurticiyp,
    required this.teyitli,
    required this.bordroypHesap,
    required this.gkrHesap,
    required this.islemTipi,
    required this.islemTuru,
  });

  int? ekNo;
  String? dogmusDogacak;
  String pesiniskontoOdendigindeode;
  bool acilislem;
  bool istihbaratsizIslem;
  bool? acilOperGonder;
  bool refactoring;
  bool bildirimli;
  bool teminatHesap;
  bool yurticiyp;
  bool teyitli;
  bool bordroypHesap;
  bool gkrHesap;
  String islemTipi;
  String islemTuru;

  factory IslemGiris.fromJson(Map<String, dynamic> json) => IslemGiris(
        ekNo: json["EkNo"],
        dogmusDogacak: json["DogmusDogacak"],
        pesiniskontoOdendigindeode: json["PesiniskontoOdendigindeode"],
        acilislem: json["Acilislem"],
        istihbaratsizIslem: json["IstihbaratsizIslem"],
        acilOperGonder: json["AcilOperGonder"],
        refactoring: json["Refactoring"],
        bildirimli: json["Bildirimli"],
        teminatHesap: json["TeminatHesap"],
        yurticiyp: json["Yurticiyp"],
        teyitli: json["Teyitli"],
        bordroypHesap: json["BordroypHesap"],
        gkrHesap: json["GkrHesap"],
        islemTipi: json["islemTipi"],
        islemTuru: json["islemTuru"],
      );

  Map<String, dynamic> toJson() => {
        "EkNo": ekNo,
        "DogmusDogacak": dogmusDogacak,
        "PesiniskontoOdendigindeode": pesiniskontoOdendigindeode,
        "Acilislem": acilislem,
        "IstihbaratsizIslem": istihbaratsizIslem,
        "AcilOperGonder": acilOperGonder,
        "Refactoring": refactoring,
        "Bildirimli": bildirimli,
        "TeminatHesap": teminatHesap,
        "Yurticiyp": yurticiyp,
        "Teyitli": teyitli,
        "BordroypHesap": bordroypHesap,
        "GkrHesap": gkrHesap,
        "islemTipi": islemTipi,
        "islemTuru": islemTuru,
      };
}

class PesinIskontoBilgileri {
  PesinIskontoBilgileri({
    required this.musteri,
    required this.faiz,
    required this.komisyon,
    required this.islemMasraf,
    required this.digerMasraf,
    this.faizTuruCheck,
    this.donemsel,
    this.islemAninda,
    this.faizOrani,
    this.faizSikligi,
    this.oranBasTarihi,
    this.onOdemeOrani,
    this.onOdemeTutari,
    this.komisyonKriteriIsAni,
    this.komisyonOraniIsAni,
    this.komisyonSikligi,
    this.komisyonBasTarihi,
    this.komisyonKriteriDonemsel,
    this.komisyonOraniDonemsel,
    this.komisyonSpotTarihi,
    this.valGunCek,
    this.valGunSenet,
    this.valGunOdemeVasitasiz,
    this.eksiltmeTutari,
    required this.cekIslemItems,
    required this.senetIslemItems,
    required this.odemeVasitasizGirisItems,
    required this.odemeVasitasizGirisDetayItems,
  });

  Musteri musteri;
  int faiz;
  int komisyon;
  int islemMasraf;
  int digerMasraf;
  int? faizTuruCheck;
  bool? donemsel;
  bool? islemAninda;
  int? faizOrani;
  int? faizSikligi;
  DateTime? oranBasTarihi;
  int? onOdemeOrani;
  int? onOdemeTutari;
  int? komisyonKriteriIsAni;
  int? komisyonOraniIsAni;
  int? komisyonSikligi;
  DateTime? komisyonBasTarihi;
  int? komisyonKriteriDonemsel;
  int? komisyonOraniDonemsel;
  DateTime? komisyonSpotTarihi;
  int? valGunCek;
  int? valGunSenet;
  int? valGunOdemeVasitasiz;
  int? eksiltmeTutari;
  List<CekIslemItem> cekIslemItems;
  List<SenetIslemItem> senetIslemItems;
  List<OdemeVasitasizGirisItem> odemeVasitasizGirisItems;
  List<OdemeVasitasizGirisDetayItem> odemeVasitasizGirisDetayItems;

  factory PesinIskontoBilgileri.fromJson(Map<String, dynamic> json) =>
      PesinIskontoBilgileri(
        musteri: Musteri.fromJson(json["Musteri"]),
        faiz: json["Faiz"],
        komisyon: json["Komisyon"],
        islemMasraf: json["IslemMasraf"],
        digerMasraf: json["DigerMasraf"],
        faizTuruCheck: json["FaizTuruCheck"],
        donemsel: json["Donemsel"],
        islemAninda: json["IslemAninda"],
        faizOrani: json["FaizOrani"],
        faizSikligi: json["FaizSikligi"],
        oranBasTarihi: DateTime.parse(json["OranBasTarihi"]),
        onOdemeOrani: json["OnOdemeOrani"],
        onOdemeTutari: json["OnOdemeTutari"],
        komisyonKriteriIsAni: json["KomisyonKriteriIsAni"],
        komisyonOraniIsAni: json["KomisyonOraniIsAni"],
        komisyonSikligi: json["KomisyonSikligi"],
        komisyonBasTarihi: DateTime.parse(json["KomisyonBasTarihi"]),
        komisyonKriteriDonemsel: json["KomisyonKriteriDonemsel"],
        komisyonOraniDonemsel: json["KomisyonOraniDonemsel"],
        komisyonSpotTarihi: DateTime.parse(json["KomisyonSpotTarihi"]),
        valGunCek: json["ValGunCek"],
        valGunSenet: json["ValGunSenet"],
        valGunOdemeVasitasiz: json["ValGunOdemeVasitasiz"],
        eksiltmeTutari: json["EksiltmeTutari"],
        cekIslemItems: List<CekIslemItem>.from(
            json["CekIslemItems"].map((x) => CekIslemItem.fromJson(x))),
        senetIslemItems: List<SenetIslemItem>.from(
            json["SenetIslemItems"].map((x) => SenetIslemItem.fromJson(x))),
        odemeVasitasizGirisItems: List<OdemeVasitasizGirisItem>.from(
            json["OdemeVasitasizGirisItems"]
                .map((x) => OdemeVasitasizGirisItem.fromJson(x))),
        odemeVasitasizGirisDetayItems: List<OdemeVasitasizGirisDetayItem>.from(
            json["OdemeVasitasizGirisDetayItems"]
                .map((x) => OdemeVasitasizGirisDetayItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Musteri": musteri.toJson(),
        "Faiz": faiz,
        "Komisyon": komisyon,
        "IslemMasraf": islemMasraf,
        "DigerMasraf": digerMasraf,
        "FaizTuruCheck": faizTuruCheck,
        "Donemsel": donemsel,
        "IslemAninda": islemAninda,
        "FaizOrani": faizOrani,
        "FaizSikligi": faizSikligi,
        "OranBasTarihi": oranBasTarihi,
        "OnOdemeOrani": onOdemeOrani,
        "OnOdemeTutari": onOdemeTutari,
        "KomisyonKriteriIsAni": komisyonKriteriIsAni,
        "KomisyonOraniIsAni": komisyonOraniIsAni,
        "KomisyonSikligi": komisyonSikligi,
        "KomisyonBasTarihi": komisyonBasTarihi,
        "KomisyonKriteriDonemsel": komisyonKriteriDonemsel,
        "KomisyonOraniDonemsel": komisyonOraniDonemsel,
        "KomisyonSpotTarihi": komisyonSpotTarihi,
        "ValGunCek": valGunCek,
        "ValGunSenet": valGunSenet,
        "ValGunOdemeVasitasiz": valGunOdemeVasitasiz,
        "EksiltmeTutari": eksiltmeTutari,
        "CekIslemItems":
            List<dynamic>.from(cekIslemItems.map((x) => x.toJson())),
        "SenetIslemItems":
            List<dynamic>.from(senetIslemItems.map((x) => x.toJson())),
        "OdemeVasitasizGirisItems":
            List<dynamic>.from(odemeVasitasizGirisItems.map((x) => x.toJson())),
        "OdemeVasitasizGirisDetayItems": List<dynamic>.from(
            odemeVasitasizGirisDetayItems.map((x) => x.toJson())),
      };
}

class CekIslemItem {
  CekIslemItem({
    required this.cekNo,
    required this.tutar,
    required this.tlTutar,
    required this.vade,
    required this.kesideciVkn,
    required this.kesideciUnvan,
    this.sonCirantVkn,
    this.sonCirantUnvan,
    required this.cekBankaTcmbKodu,
    required this.cekBankaSubeTcmbKodu,
    required this.hesapNo,
    this.kesideciYeri,
    required this.dovizCinsi,
    required this.dovizKuru,
  });

  String cekNo;
  int tutar;
  int tlTutar;
  DateTime vade;
  String kesideciVkn;
  String kesideciUnvan;
  String? sonCirantVkn;
  String? sonCirantUnvan;
  int cekBankaTcmbKodu;
  int cekBankaSubeTcmbKodu;
  String hesapNo;
  int? kesideciYeri;
  String dovizCinsi;
  double dovizKuru;

  factory CekIslemItem.fromJson(Map<String, dynamic> json) => CekIslemItem(
        cekNo: json["CekNo"],
        tutar: json["Tutar"],
        tlTutar: json["TLTutar"],
        vade: DateTime.parse(json["Vade"]),
        kesideciVkn: json["KesideciVKN"],
        kesideciUnvan: json["KesideciUnvan"],
        sonCirantVkn: json["SonCirantVKN"],
        sonCirantUnvan: json["SonCirantUnvan"],
        cekBankaTcmbKodu: json["CekBankaTcmbKodu"],
        cekBankaSubeTcmbKodu: json["CekBankaSubeTcmbKodu"],
        hesapNo: json["HesapNo"],
        kesideciYeri: json["KesideciYeri"],
        dovizCinsi: json["DovizCinsi"],
        dovizKuru: json["DovizKuru"],
      );

  Map<String, dynamic> toJson() => {
        "CekNo": cekNo,
        "Tutar": tutar,
        "TLTutar": tlTutar,
        "Vade": vade.toIso8601String(),
        "KesideciVKN": kesideciVkn,
        "KesideciUnvan": kesideciUnvan,
        "SonCirantVKN": sonCirantVkn,
        "SonCirantUnvan": sonCirantUnvan,
        "CekBankaTcmbKodu": cekBankaTcmbKodu,
        "CekBankaSubeTcmbKodu": cekBankaSubeTcmbKodu,
        "HesapNo": hesapNo,
        "KesideciYeri": kesideciYeri,
        "DovizCinsi": dovizCinsi,
        "DovizKuru": dovizKuru,
      };
}

class Musteri {
  Musteri({
    this.musteriId,
    required this.firmaAdi,
    this.userCode,
    this.telefon,
    this.vkn,
  });

  int? musteriId;
  String firmaAdi;
  String? userCode;
  String? telefon;
  String? vkn;

  factory Musteri.fromJson(Map<String, dynamic> json) => Musteri(
        musteriId: json["MusteriId"],
        firmaAdi: json["FirmaAdi"],
        userCode: json["UserCode"],
        telefon: json["Telefon"],
        vkn: json["VKN"],
      );

  Map<String, dynamic> toJson() => {
        "MusteriId": musteriId,
        "FirmaAdi": firmaAdi,
        "UserCode": userCode,
        "Telefon": telefon,
        "VKN": vkn,
      };
}

class OdemeVasitasizGirisDetayItem {
  OdemeVasitasizGirisDetayItem({
    required this.faturaTuru,
    required this.faturaTuruText,
    this.hashCode1,
    required this.faturaNo,
    required this.faturaTutari,
    required this.temlikTutari,
    required this.kullanilanTutar,
    required this.tlTutar,
    required this.dovizCinsi,
    required this.dovizText,
    required this.dovizKuru,
    this.malinCinsi,
    required this.borcluVkn,
    required this.borcluUnvan,
    required this.faturaTarihi,
    required this.vadeGun,
    required this.vade,
    this.refaktoringCheck,
    this.refaktoringText,
    this.saticiVkn,
    this.saticiUnvan,
  });

  String faturaTuru;
  String faturaTuruText;
  String? hashCode1;
  String faturaNo;
  int faturaTutari;
  int temlikTutari;
  int kullanilanTutar;
  int tlTutar;
  String dovizCinsi;
  String dovizText;
  int dovizKuru;
  String? malinCinsi;
  String borcluVkn;
  String borcluUnvan;
  DateTime faturaTarihi;
  int vadeGun;
  DateTime vade;
  bool? refaktoringCheck;
  String? refaktoringText;
  String? saticiVkn;
  String? saticiUnvan;

  factory OdemeVasitasizGirisDetayItem.fromJson(Map<String, dynamic> json) =>
      OdemeVasitasizGirisDetayItem(
        faturaTuru: json["FaturaTuru"],
        faturaTuruText: json["FaturaTuruText"],
        hashCode1: json["HashCode"],
        faturaNo: json["FaturaNo"],
        faturaTutari: json["FaturaTutari"],
        temlikTutari: json["TemlikTutari"],
        kullanilanTutar: json["KullanilanTutar"],
        tlTutar: json["TLTutar"],
        dovizCinsi: json["DovizCinsi"],
        dovizText: json["DovizText"],
        dovizKuru: json["DovizKuru"],
        malinCinsi: json["MalinCinsi"],
        borcluVkn: json["BorcluVKN"],
        borcluUnvan: json["BorcluUnvan"],
        faturaTarihi: DateTime.parse(json["FaturaTarihi"]),
        vadeGun: json["VadeGun"],
        vade: DateTime.parse(json["Vade"]),
        refaktoringCheck: json["RefaktoringCheck"],
        refaktoringText: json["RefaktoringText"],
        saticiVkn: json["SaticiVKN"],
        saticiUnvan: json["SaticiUnvan"],
      );

  Map<String, dynamic> toJson() => {
        "FaturaTuru": faturaTuru,
        "FaturaTuruText": faturaTuru,
        "HashCode": hashCode,
        "FaturaNo": faturaNo,
        "FaturaTutari": faturaTutari,
        "TemlikTutari": temlikTutari,
        "KullanilanTutar": kullanilanTutar,
        "TLTutar": tlTutar,
        "DovizCinsi": dovizCinsi,
        "DvoziText": dovizText,
        "DovizKuru": dovizKuru,
        "MalinCinsi": malinCinsi,
        "BorcluVKN": borcluVkn,
        "BorcluUnvan": borcluUnvan,
        "FaturaTarihi": faturaTarihi.toIso8601String(),
        "VadeGun": vadeGun,
        "Vade": vade.toIso8601String(),
        "RefaktoringCheck": refaktoringCheck,
        "RefaktoringText": refaktoringText,
        "SaticiVKN": saticiVkn,
        "SaticiUnvan": saticiUnvan,
      };
}

class OdemeVasitasizGirisItem {
  OdemeVasitasizGirisItem({
    required this.toplamTutar,
    required this.tlTutar,
    required this.adet,
    required this.vade,
    required this.dovizCinsi,
    required this.dovizKuru,
  });

  int toplamTutar;
  int tlTutar;
  int adet;
  DateTime vade;
  int dovizCinsi;
  int dovizKuru;

  factory OdemeVasitasizGirisItem.fromJson(Map<String, dynamic> json) =>
      OdemeVasitasizGirisItem(
        toplamTutar: json["ToplamTutar"],
        tlTutar: json["TLTutar"],
        adet: json["Adet"],
        vade: DateTime.parse(json["Vade"]),
        dovizCinsi: json["DovizCinsi"],
        dovizKuru: json["DovizKuru"],
      );

  Map<String, dynamic> toJson() => {
        "ToplamTutar": toplamTutar,
        "TLTutar": tlTutar,
        "Adet": adet,
        "Vade": vade.toIso8601String(),
        "DovizCinsi": dovizCinsi,
        "DovizKuru": dovizKuru,
      };
}

class SenetIslemItem {
  SenetIslemItem({
    required this.senetNo,
    required this.tutar,
    required this.tlTutar,
    required this.vade,
    required this.dovizCinsi,
    required this.dovizKuru,
    required this.protesto,
    this.sonCirantaVkn,
    this.sonCirantaUnvan,
    this.kefil,
    required this.senetBorcluVkn,
    required this.senetBorcluUnvan,
  });

  String senetNo;
  int tutar;
  int tlTutar;
  DateTime vade;
  String dovizCinsi;
  int dovizKuru;
  String protesto;
  String? sonCirantaVkn;
  String? sonCirantaUnvan;
  String? kefil;
  String senetBorcluVkn;
  String senetBorcluUnvan;

  factory SenetIslemItem.fromJson(Map<String, dynamic> json) => SenetIslemItem(
        senetNo: json["SenetNo"],
        tutar: json["Tutar"],
        tlTutar: json["TLTutar"],
        vade: DateTime.parse(json["Vade"]),
        dovizCinsi: json["DovizCinsi"],
        dovizKuru: json["DovizKuru"],
        protesto: json["Protesto"],
        sonCirantaVkn: json["SonCirantaVKN"],
        sonCirantaUnvan: json["SonCirantaUnvan"],
        kefil: json["Kefil"],
        senetBorcluVkn: json["SenetBorcluVkn"],
        senetBorcluUnvan: json["SenetBorcluUnvan"],
      );

  Map<String, dynamic> toJson() => {
        "SenetNo": senetNo,
        "Tutar": tutar,
        "TLTutar": tlTutar,
        "Vade": vade.toIso8601String(),
        "DovizCinsi": dovizCinsi,
        "DovizKuru": dovizKuru,
        "Protesto": protesto,
        "SonCirantaVKN": sonCirantaVkn,
        "SonCirantaUnvan": sonCirantaUnvan,
        "Kefil": kefil,
        "SenetBorcluVkn": senetBorcluVkn,
        "SenetBorcluUnvan": senetBorcluUnvan,
      };
}
