class NoticiaModelo {
  String titulo;
  String resumen;
  String url;

  NoticiaModelo({this.resumen, this.url, this.titulo});

  factory NoticiaModelo.fromJson(Map<String,dynamic> json){
    return NoticiaModelo(
      url: json['url'],
      resumen: json['abstract'],
      titulo: json['title']
    );
  }
}
