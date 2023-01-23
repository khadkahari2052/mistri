class UserComment {

    int? userid;
   int? id;
   String? title;
   String ?body;

  UserComment(this.userid, this.id,this.title, this.body);

  UserComment.formMap(Map<String,dynamic> map){
    this.id=map["id"];
    this.userid=map["userid"];
    this.title=map["title"];
    this.body=map["body"];
  }

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "userid":userid,
      "title":title,
      "body":body,
    };
  }

}
