import 'dart:convert';

List<CountriesListResponse> countriesListResponseFromJson(String str) => List<CountriesListResponse>.from(json.decode(str).map((x) => CountriesListResponse.fromJson(x)));

String countriesListResponseToJson(List<CountriesListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesListResponse {
  Flags? flags;
  Name? name;
  List<String>? capital;
  Languages? languages;

  CountriesListResponse({
    this.flags,
    this.name,
    this.capital,
    this.languages,
  });

  factory CountriesListResponse.fromJson(Map<String, dynamic> json) => CountriesListResponse(
    flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
    languages: json["languages"] == null ? null : Languages.fromJson(json["languages"]),
  );

  Map<String, dynamic> toJson() => {
    "flags": flags?.toJson(),
    "name": name?.toJson(),
    "capital": capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
    "languages": languages?.toJson(),
  };
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    png: json["png"],
    svg: json["svg"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,
    "alt": alt,
  };
}

class Languages {
  String? eng;
  String? sot;
  String? fra;
  String? sag;
  String? ara;
  String? ber;
  String? tir;
  String? swa;
  String? mey;
  String? spa;
  String? por;
  String? tsn;
  String? run;
  String? afr;
  String? nbl;
  String? nso;
  String? ssw;
  String? tso;
  String? ven;
  String? xho;
  String? zul;
  String? crs;
  String? mlg;
  String? kon;
  String? lin;
  String? lua;
  String? som;
  String? kin;
  String? deu;
  String? her;
  String? hgm;
  String? kwn;
  String? loz;
  String? ndo;
  String? zdj;
  String? pov;
  String? bwg;
  String? kck;
  String? khi;
  String? ndc;
  String? nde;
  String? nya;
  String? sna;
  String? toi;
  String? zib;
  String? amh;
  String? mfe;

  Languages({
    this.eng,
    this.sot,
    this.fra,
    this.sag,
    this.ara,
    this.ber,
    this.tir,
    this.swa,
    this.mey,
    this.spa,
    this.por,
    this.tsn,
    this.run,
    this.afr,
    this.nbl,
    this.nso,
    this.ssw,
    this.tso,
    this.ven,
    this.xho,
    this.zul,
    this.crs,
    this.mlg,
    this.kon,
    this.lin,
    this.lua,
    this.som,
    this.kin,
    this.deu,
    this.her,
    this.hgm,
    this.kwn,
    this.loz,
    this.ndo,
    this.zdj,
    this.pov,
    this.bwg,
    this.kck,
    this.khi,
    this.ndc,
    this.nde,
    this.nya,
    this.sna,
    this.toi,
    this.zib,
    this.amh,
    this.mfe,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
    eng: json["eng"],
    sot: json["sot"],
    fra: json["fra"],
    sag: json["sag"],
    ara: json["ara"],
    ber: json["ber"],
    tir: json["tir"],
    swa: json["swa"],
    mey: json["mey"],
    spa: json["spa"],
    por: json["por"],
    tsn: json["tsn"],
    run: json["run"],
    afr: json["afr"],
    nbl: json["nbl"],
    nso: json["nso"],
    ssw: json["ssw"],
    tso: json["tso"],
    ven: json["ven"],
    xho: json["xho"],
    zul: json["zul"],
    crs: json["crs"],
    mlg: json["mlg"],
    kon: json["kon"],
    lin: json["lin"],
    lua: json["lua"],
    som: json["som"],
    kin: json["kin"],
    deu: json["deu"],
    her: json["her"],
    hgm: json["hgm"],
    kwn: json["kwn"],
    loz: json["loz"],
    ndo: json["ndo"],
    zdj: json["zdj"],
    pov: json["pov"],
    bwg: json["bwg"],
    kck: json["kck"],
    khi: json["khi"],
    ndc: json["ndc"],
    nde: json["nde"],
    nya: json["nya"],
    sna: json["sna"],
    toi: json["toi"],
    zib: json["zib"],
    amh: json["amh"],
    mfe: json["mfe"],
  );

  Map<String, dynamic> toJson() => {
    "eng": eng,
    "sot": sot,
    "fra": fra,
    "sag": sag,
    "ara": ara,
    "ber": ber,
    "tir": tir,
    "swa": swa,
    "mey": mey,
    "spa": spa,
    "por": por,
    "tsn": tsn,
    "run": run,
    "afr": afr,
    "nbl": nbl,
    "nso": nso,
    "ssw": ssw,
    "tso": tso,
    "ven": ven,
    "xho": xho,
    "zul": zul,
    "crs": crs,
    "mlg": mlg,
    "kon": kon,
    "lin": lin,
    "lua": lua,
    "som": som,
    "kin": kin,
    "deu": deu,
    "her": her,
    "hgm": hgm,
    "kwn": kwn,
    "loz": loz,
    "ndo": ndo,
    "zdj": zdj,
    "pov": pov,
    "bwg": bwg,
    "kck": kck,
    "khi": khi,
    "ndc": ndc,
    "nde": nde,
    "nya": nya,
    "sna": sna,
    "toi": toi,
    "zib": zib,
    "amh": amh,
    "mfe": mfe,
  };
}

class Name {
  String? common;
  String? official;
  Map<String, NativeName>? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
    official: json["official"],
    nativeName: Map.from(json["nativeName"]!).map((k, v) => MapEntry<String, NativeName>(k, NativeName.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
    "nativeName": Map.from(nativeName!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class NativeName {
  String? official;
  String? common;

  NativeName({
    this.official,
    this.common,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
    official: json["official"],
    common: json["common"],
  );

  Map<String, dynamic> toJson() => {
    "official": official,
    "common": common,
  };
}
