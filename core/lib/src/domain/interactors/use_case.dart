import 'package:rxdart/rxdart.dart';

abstract class UseCase<Model, Params> {
  Observable<Model> execute({Params params});
}
