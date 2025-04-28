class RequestModel {
  final String id, babySitterId,
      parentId,
      date,
      time,
      form,
      to,
      address,
      note,
      status;

  RequestModel(
      {
        required this.id,
        required this.babySitterId,
      required this.parentId,
      required this.date,
      required this.time,
      required this.form,
      required this.to,
      required this.address,
      required this.note,
      required this.status,
});

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      babySitterId: json['baby_sitter_id'],
      parentId: json['parent_id'],
      date: json['date'],
      time: json['time'],
      form: json['form'],
      to: json['to'],
      address: json['address'],
      note: json['note'],
      status: json['status'],
    );
  }
}
