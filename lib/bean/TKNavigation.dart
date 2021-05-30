class TKNavigation {
  List<Result> result;
  int status;

  TKNavigation({this.result, this.status});

  TKNavigation.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  String action;
  String createdAt;
  String endDate;
  int id;
  bool isDisplay;
  String limitUser;
  int order;
  String picture;
  int position;
  String role;
  String startDate;
  String targetValue;
  String title;
  String updatedAt;
  bool valid;

  Result(
      {this.action,
        this.createdAt,
        this.endDate,
        this.id,
        this.isDisplay,
        this.limitUser,
        this.order,
        this.picture,
        this.position,
        this.role,
        this.startDate,
        this.targetValue,
        this.title,
        this.updatedAt,
        this.valid});

  Result.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    createdAt = json['createdAt'];
    endDate = json['endDate'];
    id = json['id'];
    isDisplay = json['isDisplay'];
    limitUser = json['limitUser'];
    order = json['order'];
    picture = json['picture'];
    position = json['position'];
    role = json['role'];
    startDate = json['startDate'];
    targetValue = json['targetValue'];
    title = json['title'];
    updatedAt = json['updatedAt'];
    valid = json['valid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['createdAt'] = this.createdAt;
    data['endDate'] = this.endDate;
    data['id'] = this.id;
    data['isDisplay'] = this.isDisplay;
    data['limitUser'] = this.limitUser;
    data['order'] = this.order;
    data['picture'] = this.picture;
    data['position'] = this.position;
    data['role'] = this.role;
    data['startDate'] = this.startDate;
    data['targetValue'] = this.targetValue;
    data['title'] = this.title;
    data['updatedAt'] = this.updatedAt;
    data['valid'] = this.valid;
    return data;
  }
}