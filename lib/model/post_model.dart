class PostModel {
  int? _postId;
  int? _it;
  String? _name;
  String? _email;
  String? _body;

  PostModel({int? postId, int? it, String? name, String? email, String? body}) {
    if (postId != null) {
      this._postId = postId;
    }
    if (it != null) {
      this._it = it;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (body != null) {
      this._body = body;
    }
  }

  int? get postId => _postId;
  set postId(int? postId) => _postId = postId;
  int? get it => _it;
  set it(int? it) => _it = it;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get body => _body;
  set body(String? body) => _body = body;

  PostModel.fromJson(Map<String, dynamic> json) {
    _postId = json['postId'];
    _it = json['it'];
    _name = json['name'];
    _email = json['email'];
    _body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this._postId;
    data['it'] = this._it;
    data['name'] = this._name;
    data['email'] = this._email;
    data['body'] = this._body;
    return data;
  }
}
