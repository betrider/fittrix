enum AuthState {
  authorized,
  unauthorized,
}

enum FitnessType{

  lunge('런지', 'https://media.istockphoto.com/id/964785648/ko/%EB%B2%A1%ED%84%B0/2-%EB%8B%A8%EA%B3%84%EC%97%90%EC%84%9C-%EB%8B%AC%EB%A0%A4-%EB%93%A4%EC%A3%A0-%EC%9A%B4%EB%8F%99-%ED%95%98-%EA%B3%A0-%EA%B1%B4%EA%B0%95-%ED%95%9C-%EC%97%AC%EC%9E%90%EC%97%90-%EC%9D%98%ED%95%B4-%EC%9A%B4%EB%8F%99-%EA%B0%80%EC%9D%B4%EB%93%9C%EB%A5%BC-%EA%B7%B8%EB%A6%BC.jpg?s=612x612&w=0&k=20&c=ApSaqBxHARKjiG53LNi6EgoyPEAQY3b_iFE1uuXNhYM='),
  squat('스쿼트', 'https://www.shutterstock.com/shutterstock/photos/1993360865/display_1500/stock-vector-woman-doing-bodyweight-sumo-wide-stance-squats-exercise-flat-vector-illustration-isolated-on-1993360865.jpg'),
  pushUp('푸시업', 'https://mblogthumb-phinf.pstatic.net/20151120_31/qortmdejr123_14480158040255Aldu_JPEG/EAB080EC8AB4EC9AB4EB8F99EBB0A9EBB295_7.jpg?type=w800'),
  legRaise('레그레이즈', 'https://thumb.ac-illust.com/83/83cb5b4a7e2b75fceffce6d4311164d0_t.jpeg');

  final String koreanName;
  final String imageUrl;

  const FitnessType(this.koreanName, this.imageUrl);

  @override
  String toString() {
    return koreanName;
  }

  static FitnessType strToEnum(String str) {
    return FitnessType.values.byName(str);
  }

}
