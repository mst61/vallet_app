class CreditCard {
  final String cardDesc;
  final String cardNo;
  final String cardBrandName;

  CreditCard(this.cardDesc, this.cardNo, this.cardBrandName);

  CreditCard.fromJson(Map<dynamic, dynamic> parsedJson)
      : cardDesc =
            (parsedJson['cardDesc'] != null) ? parsedJson['cardDesc'] : null,
        cardNo = (parsedJson['cardNo'] != null) ? parsedJson['cardNo'] : null,
        cardBrandName = (parsedJson['cardBrandName'] != null)
            ? parsedJson['cardBrandName']
            : null;
}
