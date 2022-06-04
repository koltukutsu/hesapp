import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit() : super(TableInitial());
}
