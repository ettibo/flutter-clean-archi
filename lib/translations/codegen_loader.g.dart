// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "title": {
    "appTitle": "Clean Tree App",
    "titleTreeListPage": "Trees",
    "titledetailTreePage": "Tree Detail",
    "mapTitlePage": "Map",
    "bmiTitlePage": "BMI",
    "settingsTitlePage": "Settings"
  },
  "treeScreen": {
    "treeWithoutName": "Tree without name",
    "species": "Species",
    "speciesNotSpecified": "Not specified",
    "height": "Height",
    "circumference": "Circumference",
    "address": "Address",
    "titleLabel": "{title}: {value}",
    "valueWithUnit": "{value} {unit}",
    "meterUnit": "m",
    "centimeterUnit": "cm"
  },
  "theme": {
    "themeTitle": "Theme:",
    "lightTheme": "Light",
    "darkTheme": "Dark",
    "mirrorSystem": "System"
  },
  "bmi": {
    "weight": "Weight",
    "height": "Height",
    "meters": "meters",
    "inch": "inch",
    "kilos": "kilos",
    "pounds": "pounds",
    "hintBmiTextField": "Please insert your {unit} in {system}",
    "bmiResult": "Your BMI is {value}",
    "bmiErrorNull": "Please enter all informations",
    "formatError": "Format Error",
    "metricUnitName": "Metric",
    "imperialUnitName": "Imperial"
  },
  "appSettings": {
    "locationServicesDisabled": "Location services are disabled.",
    "locationPermissionDenied": "Location permissions are denied",
    "locationPermissionDeniedPermanently": "Location permissions are permanently denied."
  },
  "langage": {
    "englishLangage": "English",
    "spanishLangage": "Spanish",
    "frenchLangage": "French"
  }
};
static const Map<String,dynamic> fr = {
  "title": {
    "appTitle": "Clean Tree App",
    "titleTreeListPage": "Arbres",
    "titledetailTreePage": "Detail Arbre",
    "mapTitlePage": "Carte",
    "bmiTitlePage": "IMC",
    "settingsTitlePage": "Paramètres"
  },
  "treeScreen": {
    "treeWithoutName": "Arbre sans nom",
    "species": "Espèce",
    "speciesNotSpecified": "Non spécifiée",
    "height": "Hauteur",
    "circumference": "Circonférence",
    "address": "Adresse",
    "titleLabel": "{title} : {value}",
    "valueWithUnit": "{value} {unit}",
    "meterUnit": "m",
    "centimeterUnit": "cm"
  },
  "theme": {
    "themeTitle": "Thème :",
    "lightTheme": "Clair",
    "darkTheme": "Sombre",
    "mirrorSystem": "Système"
  },
  "bmi": {
    "weight": "Poids",
    "meters": "mètres",
    "inch": "pouces",
    "kilos": "kilos",
    "pounds": "livres",
    "hintBmiTextField": "Veuillez insérer votre {unit} en {system}",
    "bmiResult": "Votre IMC est {value}",
    "bmiErrorNull": "Veuillez saisir toutes les informations",
    "formatError": "Erreur de format",
    "metricUnitName": "Métrique",
    "imperialUnitName": "Impérial"
  },
  "appSettings": {
    "locationServicesDisabled": "Les services de localisation sont désactivés.",
    "locationPermissionDenied": "Les autorisations de localisation sont refusées.",
    "locationPermissionDeniedPermanently": "Les autorisations de localisation sont refusées de façon permanente."
  },
  "langage": {
    "englishLangage": "Anglais",
    "spanishLangage": "Espagnol",
    "frenchLangage": "Français"
  }
};
static const Map<String,dynamic> es = {
  "title": {
    "appTitle": "Clean Tree App",
    "titleTreeListPage": "Árboles",
    "titledetailTreePage": "Detalle del árbol",
    "mapTitlePage": "Mapas",
    "bmiTitlePage": "IMC",
    "settingsTitlePage": "Ajustes"
  },
  "treeScreen": {
    "treeWithoutName": "Árbol sin nombre",
    "species": "Especie",
    "speciesNotSpecified": "No especificadas",
    "height": "Altura",
    "circumference": "Circunferencia",
    "address": "Dirección",
    "titleLabel": "{title}: {value}",
    "valueWithUnit": "{value} {unit}",
    "meterUnit": "m",
    "centimeterUnit": "cm"
  },
  "theme": {
    "themeTitle": "Tema:",
    "lightTheme": "Claro",
    "darkTheme": "Oscuro",
    "mirrorSystem": "Dispositivo"
  },
  "bmi": {
    "weight": "peso",
    "meters": "metros",
    "inch": "pulgadas",
    "kilos": "kilos",
    "pounds": "libras",
    "hintBmiTextField": "Por favor, introduzca su {unit} en {system}",
    "bmiResult": "Su IMC es {value}",
    "bmiErrorNull": "Por favor, introduzca toda la información",
    "formatError": "Error de formato",
    "metricUnitName": "Métrica",
    "imperialUnitName": "Imperial"
  },
  "appSettings": {
    "locationServicesDisabled": "Los servicios de localización están desactivados.",
    "locationPermissionDenied": "Los permisos de localización están denegados.",
    "locationPermissionDeniedPermanently": "Los permisos de localización están permanentemente denegados."
  },
  "langage": {
    "englishLangage": "Inglés",
    "spanishLangage": "Español",
    "frenchLangage": "Francés"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "fr": fr, "es": es};
}
