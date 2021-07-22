import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum unity_challenge {
  haute,
  normal,
  quotidien,
  hebdomadaire,
  mensuel,
  notification
}
enum unity_challenge1 {
  evenement,
  achat,
  tache,
  mission,
  youtube,
  video,
  commentaire,
  image,
  url,
  paiement,
  formation,
  projet,
  adresse,
  echeancier,
  information
}
choixDesciptionEnum(dynamic json) {
  unity_challenge1 unity = unity_challenge1.evenement;
  if (json['description'] == "unity_challenge1.evenement") {
    unity = unity_challenge1.evenement;
  } else if (json['description'] == "unity_challenge1.achat") {
    unity = unity_challenge1.achat;
  } else if (json['description'] == "unity_challenge1.tache") {
    unity = unity_challenge1.tache;
  } else if (json['description'] == "unity_challenge1.mission") {
    unity = unity_challenge1.mission;
  } else if (json['description'] == "unity_challenge1.youtube") {
    unity = unity_challenge1.youtube;
  } else if (json['description'] == "unity_challenge1.video") {
    unity = unity_challenge1.video;
  } else if (json['description'] == "unity_challenge1.commentaire") {
    unity = unity_challenge1.commentaire;
  } else if (json['description'] == "unity_challenge1.image") {
    unity = unity_challenge1.image;
  } else if (json['description'] == "unity_challenge1.url") {
    unity = unity_challenge1.url;
  } else if (json['description'] == "unity_challenge1.paiement") {
    unity = unity_challenge1.paiement;
  } else if (json['description'] == "unity_challenge1.echeancier") {
    unity = unity_challenge1.echeancier;
  } else if (json['description'] == "unity_challenge1.projet") {
    unity = unity_challenge1.projet;
  } else if (json['description'] == "unity_challenge1.adresse") {
    unity = unity_challenge1.adresse;
  } else if (json['description'] == "unity_challenge1.formation") {
    unity = unity_challenge1.formation;
  } else if (json['description'] == "unity_challenge1.information") {
    unity = unity_challenge1.information;
  }
  return unity;
}

choixDesciptionEnum1(dynamic json) {
  unity_challenge unity = unity_challenge.haute;
  if (json['unity'] == "unity_challenge.haute") {
    unity = unity_challenge.haute;
  } else if (json['unity'] == "unity_challenge.normal") {
    unity = unity_challenge.normal;
  } else if (json['unity'] == "unity_challenge.quotidien") {
    unity = unity_challenge.quotidien;
  } else if (json['unity'] == "unity_challenge.hebdomadaire") {
    unity = unity_challenge.hebdomadaire;
  } else if (json['unity'] == "unity_challenge.mensuel") {
    unity = unity_challenge.mensuel;
  } else if (json['unity'] == "unity_challenge.notification") {
    unity = unity_challenge.notification;
  }
  return unity;
}

// class Formation {
//   String chapitre;
//   String duree;
//   String theoriePratique;
//   Formation({
//     required this.chapitre,
//     required this.duree,
//     required this.theoriePratique,
//   });

//   Formation.fromJSON(Map<String, dynamic> json)
//       : chapitre = json['chapitre'],
//         duree = json['duree'],
//         theoriePratique = json['theoriePratique'];

//   Map<String, dynamic> toJson() {
//     return {
//       "chapitre": chapitre,
//       "duree": duree,
//       "theoriePratique": theoriePratique
//     };
//   }
// }

class ResultJournee {
  double prix;
  double cout;
  String id;
  String index;
  String name;
  final String tache;
  final unity_challenge1 description;
  ResultJournee(
      {required this.prix,
      required this.cout,
      required this.id,
      required this.name,
      required this.tache,
      required this.description,
      required this.index});

  ResultJournee.fromJSON(Map<String, dynamic> json)
      : prix = json['prix'],
        cout = json['cout'],
        name = json['name'],
        id = json['id'],
        tache = json['tache'],
        index = json['index'],
        description = choixDesciptionEnum(json);

  Map<String, dynamic> toJson() {
    return {
      "prix": prix,
      "cout": cout,
      "name": name,
      "id": id,
      "tache": tache,
      "index": index,
      "description": description.toString()
    };
  }
}

class Offre {
  double prix;
  double cout;
  String id;
  String index;
  String name;
  final String tache;
  final unity_challenge1 description;
  Offre(
      {required this.prix,
      required this.cout,
      required this.id,
      required this.name,
      required this.tache,
      required this.description,
      required this.index});

  Offre.fromJSON(Map<String, dynamic> json)
      : prix = json['prix'],
        cout = json['cout'],
        name = json['name'],
        id = json['id'],
        tache = json['tache'],
        index = json['index'],
        description = choixDesciptionEnum(json);

  Map<String, dynamic> toJson() {
    return {
      "prix": prix,
      "cout": cout,
      "name": name,
      "id": id,
      "tache": tache,
      "index": index,
      "description": description.toString()
    };
  }
}

class ProduitGagnant {
  String typeDuProduit;
  Double prixAchat;
  Double prixVente;
  Double chiffreAffaireTotal;
  Double prixShipping;
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
    required this.prixShipping,
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
        prixShipping: json['prixShipping'],
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
      "prixShipping": prixShipping,
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
  // bool notifcationResultBool;
  String nom;
  String prenom;
  String email;
  String telephone;
  String photo;
  UserDrop({
    // required this.notifcationResultBool,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.photo,
  });

  UserDrop.fromJSON(Map<String, dynamic> json)
      :
        // notifcationResultBool = json['notifcationResultBool'],
        nom = json['nom'],
        prenom = json['prenom'],
        email = json['email'],
        telephone = json['telephone'],
        photo = json['photo'];

  Map<String, dynamic> toJson() {
    return {
      // "notifcationResultBool": notifcationResultBool,
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "telephone": telephone,
      "photo": photo,
    };
  }
}

// class Challengeyesterday {
//   String date;
//   String nbChallengeEnCours;
//   String nbTacheEnCours;
//   String commentaire;
//   String nbchallengeVallide;
//   String nbtacheVallide;

//   Challengeyesterday(
//       {this.date,
//       this.nbChallengeEnCours,
//       this.commentaire,
//       this.nbchallengeVallide,
//       this.nbTacheEnCours,
//       this.nbtacheVallide});

//   Challengeyesterday.fromJSON(Map<String, dynamic> json)
//       : date = json['date'],
//         nbChallengeEnCours = json['nbChallengeEnCours'],
//         nbTacheEnCours = json['nbTacheEnCours'],
//         nbchallengeVallide = json['nbchallengeVallide'],
//         nbtacheVallide = json['nbtacheVallide'],
//         commentaire = json['commentaire'];

//   Map<String, dynamic> toJson() {
//     return {
//       "date": date,
//       "nbchallengeVallide": nbchallengeVallide,
//       "nbTacheEnCours": nbTacheEnCours,
//       "nbtacheVallide": nbtacheVallide,
//       "nbChallengeEnCours": nbChallengeEnCours,
//       "commentaire": commentaire
//     };
//   }
// }
