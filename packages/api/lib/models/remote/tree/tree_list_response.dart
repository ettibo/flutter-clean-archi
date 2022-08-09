class TreeListResponse {
  int? nhits;
  Parameters? parameters;
  List<Records>? records;
  List<FacetGroups>? facetGroups;

  TreeListResponse({nhits, parameters, records, facetGroups});

  TreeListResponse.fromJson(Map<String, dynamic> json) {
    nhits = json['nhits'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
    if (json['facet_groups'] != null) {
      facetGroups = <FacetGroups>[];
      json['facet_groups'].forEach((v) {
        facetGroups!.add(FacetGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nhits'] = nhits;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    if (facetGroups != null) {
      data['facet_groups'] = facetGroups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? dataset;
  int? rows;
  int? start;
  List<String>? facet;
  String? format;
  String? timezone;

  Parameters({dataset, rows, start, facet, format, timezone});

  Parameters.fromJson(Map<String, dynamic> json) {
    dataset = json['dataset'];
    rows = json['rows'];
    start = json['start'];
    facet = json['facet'].cast<String>();
    format = json['format'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataset'] = dataset;
    data['rows'] = rows;
    data['start'] = start;
    data['facet'] = facet;
    data['format'] = format;
    data['timezone'] = timezone;
    return data;
  }
}

class Records {
  String? datasetid;
  String? recordid;
  Fields? fields;
  Geometry? geometry;
  String? recordTimestamp;

  Records({datasetid, recordid, fields, geometry, recordTimestamp});

  Records.fromJson(Map<String, dynamic> json) {
    datasetid = json['datasetid'];
    recordid = json['recordid'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    recordTimestamp = json['record_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datasetid'] = datasetid;
    data['recordid'] = recordid;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['record_timestamp'] = recordTimestamp;
    return data;
  }
}

class Fields {
  int? hauteurenm;
  String? libellefrancais;
  String? idemplacement;
  String? complementadresse;
  int? circonferenceencm;
  List<double>? geoPoint2d;
  String? espece;
  String? typeemplacement;
  String? genre;
  String? adresse;
  String? stadedeveloppement;
  String? domanialite;
  String? remarquable;
  int? idbase;
  String? arrondissement;
  String? varieteoucultivar;

  Fields(
      {hauteurenm,
      libellefrancais,
      idemplacement,
      complementadresse,
      circonferenceencm,
      geoPoint2d,
      espece,
      typeemplacement,
      genre,
      adresse,
      stadedeveloppement,
      domanialite,
      remarquable,
      idbase,
      arrondissement,
      varieteoucultivar});

  Fields.fromJson(Map<String, dynamic> json) {
    hauteurenm = json['hauteurenm'];
    libellefrancais = json['libellefrancais'];
    idemplacement = json['idemplacement'];
    complementadresse = json['complementadresse'];
    circonferenceencm = json['circonferenceencm'];
    geoPoint2d = json['geo_point_2d'].cast<double>();
    espece = json['espece'];
    typeemplacement = json['typeemplacement'];
    genre = json['genre'];
    adresse = json['adresse'];
    stadedeveloppement = json['stadedeveloppement'];
    domanialite = json['domanialite'];
    remarquable = json['remarquable'];
    idbase = json['idbase'];
    arrondissement = json['arrondissement'];
    varieteoucultivar = json['varieteoucultivar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hauteurenm'] = hauteurenm;
    data['libellefrancais'] = libellefrancais;
    data['idemplacement'] = idemplacement;
    data['complementadresse'] = complementadresse;
    data['circonferenceencm'] = circonferenceencm;
    data['geo_point_2d'] = geoPoint2d;
    data['espece'] = espece;
    data['typeemplacement'] = typeemplacement;
    data['genre'] = genre;
    data['adresse'] = adresse;
    data['stadedeveloppement'] = stadedeveloppement;
    data['domanialite'] = domanialite;
    data['remarquable'] = remarquable;
    data['idbase'] = idbase;
    data['arrondissement'] = arrondissement;
    data['varieteoucultivar'] = varieteoucultivar;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({type, coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class FacetGroups {
  String? name;
  List<Facets>? facets;

  FacetGroups({name, facets});

  FacetGroups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['facets'] != null) {
      facets = <Facets>[];
      json['facets'].forEach((v) {
        facets!.add(Facets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (facets != null) {
      data['facets'] = facets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facets {
  String? name;
  int? count;
  String? state;
  String? path;

  Facets({name, count, state, path});

  Facets.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = json['count'];
    state = json['state'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['count'] = count;
    data['state'] = state;
    data['path'] = path;
    return data;
  }
}
