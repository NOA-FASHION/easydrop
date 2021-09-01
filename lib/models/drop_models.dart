class ResultJournee {
  double chiffreAffaireDays;
  double prixShippingDays;
  double facebookDepenseDays;
  double coutDaysProduit;
  double margeDays;
  double venteDays;
  double roaDays;
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
  List<String> offres;
  Offre({
    required this.prixAchat,
    required this.prixVente,
    required this.prixBarre,
    required this.margeOffre,
    required this.roas,
    required this.offres,
  });

  factory Offre.fromJSON(Map<String, dynamic> json) => Offre(
      prixAchat: json['prixAchat'],
      prixVente: json['prixVente'],
      prixBarre: json['prixBarre'],
      margeOffre: json['margeOffre'],
      roas: json['roas'],
      offres: List<String>.from(json["offres"].map((x) => x)));

  Map<String, dynamic> toJson() {
    return {
      "prixAchat": prixAchat,
      "prixVente": prixVente,
      "prixBarre": prixBarre,
      "margeOffre": margeOffre,
      "roas": roas,
      "offres": List<dynamic>.from(offres.map((x) => x)),
    };
  }
}

class ProduitGagnant {
  String id;
  String nomProduit;
  double prixShipping;
  String typeDuProduit;
  double prixAchat;
  double prixVente;
  double chiffreAffaireTotal;
  double prixShippingTotal;
  double facebookDepenseTotal;
  double coutTotalProduit;
  double margeTotal;
  double venteTotal;
  double roaTotal;
  int panierTotal;
  int vueTotal;
  String siteVente;
  String siteAliexpress;
  String facebookAdress;
  String photoProduit;
  List<String> nombreVenteOffreTotal;
  List<ResultJournee> listeResultatJournee;
  List<Offre> listeOffre;

  ProduitGagnant({
    required this.id,
    required this.nomProduit,
    required this.prixShipping,
    required this.typeDuProduit,
    required this.prixAchat,
    required this.prixVente,
    required this.chiffreAffaireTotal,
    required this.prixShippingTotal,
    required this.facebookDepenseTotal,
    required this.coutTotalProduit,
    required this.siteVente,
    required this.siteAliexpress,
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
        id: json['id'],
        prixShipping: json['prixShipping'],
        siteAliexpress: json['siteAliexpress'],
        nomProduit: json['nomProduit'],
        prixVente: json['prixVente'],
        prixAchat: json['prixAchat'],
        chiffreAffaireTotal: json['chiffreAffaireTotal'],
        prixShippingTotal: json['prixShippingTotal'],
        facebookDepenseTotal: json['facebookDepenseTotal'],
        coutTotalProduit: json['coutTotalProduit'],
        siteVente: json['siteVente'],
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
      "id": id,
      "nomProduit": nomProduit,
      "prixShipping": prixShipping,
      "typeDuProduit": typeDuProduit,
      "prixVente": prixVente,
      "prixAchat": prixAchat,
      "chiffreAffaireTotal": chiffreAffaireTotal,
      "prixShippingTotal": prixShippingTotal,
      "facebookDepenseTotal": facebookDepenseTotal,
      "coutTotalProduit": coutTotalProduit,
      "siteVente": siteVente,
      "siteAliexpress": siteAliexpress,
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
