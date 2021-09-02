import 'package:cultino_agritech/repositories/cultino_repository.dart';

void main() {
  //
  final cultinoRepo = CultinoRepository();
  cultinoRepo.getOtherMandiApi(callFromNetwork: false);
}
