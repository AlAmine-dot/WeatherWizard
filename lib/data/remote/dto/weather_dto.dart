class WeatherDTO {
  int code;
  String description;
  String icon;
  String? lottieResource; // Nouvelle propriété pour la ressource Lottie

  WeatherDTO({
    required this.code,
    required this.description,
    required this.icon,
    String? lottieResource,
  }) : lottieResource = lottieResource;

  factory WeatherDTO.fromJson(Map<String, dynamic> json) => WeatherDTO(
    code: json["code"],
    description: json["description"],
    icon: json["icon"],
    // Vous pouvez ajouter ici la logique pour associer les liens des ressources Lottie en fonction de la valeur de l'icône
    lottieResource: WeatherDTO.getLottieResourceForIcon(json["icon"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": description,
    "icon": icon,
  };

  // Méthode pour associer les liens des ressources Lottie en fonction de la valeur de l'icône
  static String? getLottieResourceForIcon(String icon) {
    switch (icon) {
      case "c01d":
        return "https://assets4.lottiefiles.com/temp/lf20_Stdaec.json";
      case "c01n":
        return "https://assets4.lottiefiles.com/temp/lf20_y6mY2A.json";
      case "c02d":
        return "https://assets4.lottiefiles.com/temp/lf20_HflU56.json";
      case "c02n":
        return "https://assets4.lottiefiles.com/temp/lf20_Jj2Qzq.json";
      case "c03d":
        return "https://assets5.lottiefiles.com/temp/lf20_dgjK9i.json";
      case "co3n":
        return "https://assets5.lottiefiles.com/temp/lf20_Jj2Qzq.json";
      case "co4d":
        return "https://assets5.lottiefiles.com/temp/lf20_VAmWRg.json";
      case "r01d":
        return "https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json";
      case "r01n":
        return "https://assets5.lottiefiles.com/temp/lf20_I5XMi9.json";
      case "r01d":
        return "https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json";
      case "r02n":
        return "https://assets5.lottiefiles.com/temp/lf20_I5XMi9.json";
      case "r02d":
        return "https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json";
      case "r03n":
        return "https://assets4.lottiefiles.com/temp/lf20_XkF78Y.json";
      case "r03d":
        return "https://assets4.lottiefiles.com/temp/lf20_XkF78Y.json";
      case "r04n":
        return "https://assets5.lottiefiles.com/temp/lf20_I5XMi9.json";
      case "r04d":
        return "https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json";
      case "r05n":
        return "https://assets5.lottiefiles.com/temp/lf20_I5XMi9.json";
      case "r06d":
        return "https://assets5.lottiefiles.com/temp/lf20_rpC1Rd.json";
      case "r06n":
        return "https://assets5.lottiefiles.com/temp/lf20_I5XMi9.json";
      default:
        return null; // Utilisation de la valeur d'icône par défaut si aucune association n'est trouvée
    }
  }
}
