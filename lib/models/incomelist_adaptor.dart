import 'package:expense_tracker/models/expense_list.dart';
import 'package:expense_tracker/models/income_list.dart';
import 'package:hive/hive.dart';


class IncomeListAdapter extends TypeAdapter<IncomeList> {
  @override
  final int typeId = 1; 

  @override
  IncomeList read(BinaryReader reader) {
    return IncomeList(
      title: reader.read(),
      description: reader.read(),
      category: Categoriess.values[reader.readByte()],
      date: DateTime.parse(reader.read()),
      iamount: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, IncomeList obj) {
    writer.write(obj.title);
    writer.write(obj.description);
    writer.writeByte(obj.category.index);
    writer.write(obj.date.toString());
    writer.writeDouble(obj.iamount);
  }
}
