
class Transaction{
  double amount;
  String description;
  String type;

  Transaction(this.amount, this.description, this.type);

}

class Budget{
  List<Transaction> income = [];
  List<Transaction> expenses = [];

  void addTransaction(Transaction transaction){
    if (transaction.type == 'income'){
      income.add(transaction);
    }
    else{
      expenses.add(transaction);
    }
  }

  double totalIncome(){
    double total = 0.0;
    income.forEach((transaction) => total += transaction.amount);
    return total;
  }

  double totalExpenses(){
    double total = 0.0;
    expenses.forEach((transaction) => total += transaction.amount);
    return total;
  }

  double balance(){
    return (totalIncome() - totalExpenses());
  }

  void displaySummary(){
    print('Transactions Details:');
    print('----------------------');
    print('Income Transactions: ');
    income.forEach((transaction) => print('${transaction.description}, ${transaction.amount}'));

    print('\n');
    print('Expenses Transactions: ');
    expenses.forEach((transaction) => print('${transaction.description}, ${transaction.amount}'));
  }
}

void main(){
  Budget budget = Budget();
  
  budget.addTransaction(Transaction(5000.0, 'Freelancing', 'income'));
  budget.addTransaction(Transaction(10000.0, 'Salary', 'income'));
  
  budget.addTransaction(Transaction(500.0, 'Shopping', 'expense'));
  budget.addTransaction(Transaction(1500.0, 'Utilities', 'expense'));

  print('Total Income: ${budget.totalIncome()}');
  print('Total Expenses: ${budget.totalExpenses()}');
  print('Current Balance: ${budget.balance()}');

  print('\n');
  budget.displaySummary();
}