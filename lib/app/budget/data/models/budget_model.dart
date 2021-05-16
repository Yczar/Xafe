class BudgetModel {
  BudgetModel({
    this.budgetName,
    this.budgetAmount,
    this.budgetInterval,
    this.budgetId,
  });

  BudgetModel.fromJson(Map<String, dynamic> data)
      : budgetId = data['budget_id'],
        budgetName = data['budget_name'],
        budgetAmount = data['budget_amount'],
        budgetInterval = data['budget_interval'];
  final String budgetId;
  final String budgetName;
  final String budgetAmount;
  final String budgetInterval;

  Map<String, dynamic> toJson() {
    return {
      'budget_id': budgetId,
      'budget_name': budgetName,
      'budget_amount': budgetAmount,
      'budget_interval': budgetInterval,
    };
  }
}
