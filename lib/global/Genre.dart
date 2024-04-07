enum Genre {
  dance('Dance', '댄스'),
  ballad('Ballad', '발라드'),
  edm('EDM', 'EDM');

  const Genre(this.eng, this.kor);
  final String eng;
  final String kor;

  factory Genre.getKorByEng(String eng) {
    return Genre.values.firstWhere((value) => value.kor == eng);
  }
}