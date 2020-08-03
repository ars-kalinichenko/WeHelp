class ReviewRequest {
  int authorId;
  int addressId;
  String text;
  int rate;
  String pubDate;

  ReviewRequest(
      {this.authorId, this.addressId, this.text, this.rate, this.pubDate});
}
