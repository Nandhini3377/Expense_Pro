import 'package:expense_tracker/models/expense_list.dart';
import 'package:hive/hive.dart';


class ExpenseListAdapter extends TypeAdapter<ExpenseList> {
  @override
  final int typeId = 0; // Assign a unique ID for your ExpenseList type

  @override
  ExpenseList read(BinaryReader reader) {
    return ExpenseList(
      title: reader.read(),
      description: reader.read(),
      category: Categories.values[reader.readByte()],
      date: DateTime.parse(reader.read()),
      amount: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseList obj) {
    writer.write(obj.title);
    writer.write(obj.description);
    writer.writeByte(obj.category.index);
    writer.write(obj.date.toString());
    writer.writeDouble(obj.amount);
  }
}
