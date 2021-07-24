import 'dart:ffi';

class ResultJournee {
  Double chiffreAffaireDays;
  Double prixShippingDays;
  Double facebookDepenseDays;
  Double coutDaysProduit;
  Double margeDays;
  Double venteDays;
  Double roaDays;
  int panierDays;
  int vueDays;
  List<String> nombreVenteOffreDays;
  ResultJournee(
      {required this.chiffreAffaireDays,
      required this.prixShippingDays,
      required this.facebookDepenseDays,
      required this.coutDaysProduit,
      required this.margeDays,
      required this.venteDays,
      required this.roaDays,
      required this.panierDays,
      required this.vueDays,
      required this.nombreVenteOffreDays});

  factory ResultJournee.fromJSON(Map<String, dynamic> json) => ResultJournee(
      chiffreAffaireDays: json['chiffreAffaireDays'],
      prixShippingDays: json['prixShippingDays'],
      facebookDepenseDays: json['facebookDepenseDays'],
      coutDaysProduit: json['coutDaysProduit'],
      margeDays: json['margeDays'],
      venteDays: json['venteDays'],
      roaDays: json['roaDays'],
      panierDays: json['panierDays'],
      vueDays: json['vueDays'],
      nombreVenteOffreDays:
          List<String>.from(json["nombreVenteOffreDays"].map((x) => x)));

  Map<String, dynamic> toJson() {
    return {
      "chiffreAffaireDays": chiffreAffaireDays,
      "prixShippingDays": prixShippingDays,
      "facebookDepenseDays": facebookDepenseDays,
      "coutDaysProduit": coutDaysProduit,
      "margeDays": margeDays,
      "venteDays": venteDays,
      "roaDays": roaDays,
      "panierDays": panierDays,
      "vueDays": vueDays,
      "nombreVenteOffreDays":
          List<dynamic>.from(nombreVenteOffreDays.map((x) => x)),
    };
  }
}

class Offre {
  double prixAchat;
  double prixVente;
  double prixBarre;
  double margeOffre;
  double roas;
  Offre({
    required this.prixAchat,
    required this.prixVente,
    required this.prixBarre,
    required this.margeOffre,
    required this.roas,
  });

  Offre.fromJSON(Map<String, dynamic> json)
      : prixAchat = json['prixAchat'],
        prixVente = json['prixVente'],
        prixBarre = json['prixBarre'],
        margeOffre = json['margeOffre'],
        roas = json['roas'];

  Map<String, dynamic> toJson() {
    return {
      "prixAchat": prixAchat,
      "prixVente": prixVente,
      "prixBarre": prixBarre,
      "margeOffre": margeOffre,
      "roas": roas
    };
  }
}

class ProduitGagnant {
  String typeDuProduit;
  Double prixAchat;
  Double prixVente;
  Double chiffreAffaireTotal;
  Double prixShippingTotal;
  Double facebookDepenseTotal;
  Double coutTotalProduit;
  Double margeTotal;
  Double venteTotal;
  Double roaTotal;
  int panierTotal;
  int vueTotal;
  String adresseSite;
  String facebookAdress;
  String photoProduit;
  List<String> nombreVenteOffreTotal;
  List<ResultJournee> listeResultatJournee;
  List<Offre> listeOffre;

  ProduitGagnant({
    required this.typeDuProduit,
    required this.prixAchat,
    required this.prixVente,
    required this.chiffreAffaireTotal,
    required this.prixShippingTotal,
    required this.facebookDepenseTotal,
    required this.coutTotalProduit,
    required this.adresseSite,
    required this.margeTotal,
    required this.venteTotal,
    required this.roaTotal,
    required this.panierTotal,
    required this.vueTotal,
    required this.facebookAdress,
    required this.photoProduit,
    required this.nombreVenteOffreTotal,
    required this.listeResultatJournee,
    required this.listeOffre,
  });

  factory ProduitGagnant.fromJSON(Map<String, dynamic> json) => ProduitGagnant(
        typeDuProduit: json['typeDuProduit'],
        prixVente: json['prixVente'],
        prixAchat: json['prixAchat'],
        chiffreAffaireTotal: json['chiffreAffaireTotal'],
        prixShippingTotal: json['prixShippingTotal'],
        facebookDepenseTotal: json['facebookDepenseTotal'],
        coutTotalProduit: json['coutTotalProduit'],
        adresseSite: json['adresseSite'],
        margeTotal: json['margeTotal'],
        venteTotal: json['venteTotal'],
        nombreVenteOffreTotal:
            List<String>.from(json["nombreVenteOffreTotal"].map((x) => x)),
        roaTotal: json['roaTotal'],
        panierTotal: json['panierTotal'],
        vueTotal: json['vueTotal'],
        facebookAdress: json['facebookAdress'],
        photoProduit: json['photoProduit'],
        listeResultatJournee: List<ResultJournee>.from(
            json["listeResultatJournee"]
                .map((x) => ResultJournee.fromJSON(x))
                .toList()),
        listeOffre: List<Offre>.from(
            json["listeOffre"].map((x) => Offre.fromJSON(x)).toList()),
      );

  Map<String, dynamic> toJson() {
    return {
      "typeDuProduit": typeDuProduit,
      "prixVente": prixVente,
      "prixAchat": prixAchat,
      "chiffreAffaireTotal": chiffreAffaireTotal,
      "prixShippingTotal": prixShippingTotal,
      "facebookDepenseTotal": facebookDepenseTotal,
      "coutTotalProduit": coutTotalProduit,
      "adresseSite": adresseSite,
      "margeTotal": margeTotal,
      "venteTotal": venteTotal,
      "nombreVenteOffreTotal":
          List<dynamic>.from(nombreVenteOffreTotal.map((x) => x)),
      "roaTotal": roaTotal,
      "panierTotal": panierTotal,
      "vueTotal": vueTotal,
      "facebookAdress": facebookAdress,
      "photoProduit": photoProduit,
      "listeResultatJournee":
          List<dynamic>.from(listeResultatJournee.map((x) => x.toJson())),
      "listeOffre": List<dynamic>.from(listeOffre.map((x) => x.toJson())),
    };
  }
}

class UserDrop {
  bool infoRecupere;
  String nom;
  String prenom;
  String email;
  String telephone;
  String photo;
  UserDrop({
    required this.infoRecupere,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.photo,
  });

  UserDrop.fromJSON(Map<String, dynamic> json)
      : infoRecupere = json['infoRecupere'],
        nom = json['nom'],
        prenom = json['prenom'],
        email = json['email'],
        telephone = json['telephone'],
        photo = json['photo'];

  Map<String, dynamic> toJson() {
    return {
      "infoRecupere": infoRecupere,
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "telephone": telephone,
      "photo": photo,
    };
  }
}
