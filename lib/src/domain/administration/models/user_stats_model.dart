class UserStatsModel {
  final int totalTransactions;
  final double totalEarnings;
  final double totalSpent;
  final int pendingTransactions;

  UserStatsModel({
    required this.totalTransactions,
    required this.totalEarnings,
    required this.totalSpent,
    required this.pendingTransactions,
  });

  factory UserStatsModel.fromJson(Map<String, dynamic> json) {
    return UserStatsModel(
      totalTransactions: json['totalTransactions'],
      totalEarnings: json['totalEarnings'].toDouble(),
      totalSpent: json['totalSpent'].toDouble(),
      pendingTransactions: json['pendingTransactions'],
    );
  }
}
