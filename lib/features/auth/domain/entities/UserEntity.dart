import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class UserEntity extends Equatable {
  final String uuid;
  final String email;

  const UserEntity({
    @required this.uuid,
    @required this.email,
  });

  @override
  List<Object> get props => [uuid, email];
}
