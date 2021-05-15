class ExpenseModel {
  ExpenseModel(
      {this.expenseAmount,
      this.categoryName,
      this.categoryEmoji,
      this.expenseName,
      this.expenseDate,
      this.expenseId});

  ExpenseModel.fromJson(Map<String, dynamic> data)
      : expenseAmount = data['expense_amount'],
        categoryName = data['category_name'],
        categoryEmoji = data['category_emoji'],
        expenseName = data['expense_name'],
        expenseId = data['expense_id'],
        expenseDate = data['expense_date'];
  final int expenseAmount;
  final String categoryName;
  final String categoryEmoji;
  final String expenseName;
  final String expenseId;
  final String expenseDate;

  Map<String, dynamic> toJson() {
    return {
      'expense_amount': expenseAmount,
      'category_name': categoryName,
      'category_emoji': categoryEmoji,
      'expense_name': expenseName,
      'expense_id': expenseId,
      'expense_date': expenseDate,
    };
  }
}
