enum Genre {
  dance(eng: 'Dance', kor: '댄스'),
  ballad(eng: 'Ballad', kor: '발라드'),
  edm(eng: 'EDM', kor: 'EDM'),
  none(eng: 'none', kor: '없음');

  const Genre({required this.eng, required this.kor});

  final String eng;
  final String kor;
}
