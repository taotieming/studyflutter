class Myclass {
  final int? classroomId;
  final String? classroomName;
  final int? partakeNum;
  final String? adminName;
  final String? start_at;
  final String? endAt;
  final String? coverUrl;
  final int? fileId;

  Myclass(
      {required this.classroomId,
      required this.classroomName,
      required this.partakeNum,
      required this.adminName,
      required this.start_at,
      required this.endAt,
      required this.coverUrl,
      required this.fileId});

  factory Myclass.jsonfrom(Map<String, dynamic> json) => Myclass(
      classroomId: json['id'],
      classroomName: json['classroomName'],
      partakeNum: json['partakeNum'],
      adminName: json['adminName'],
      endAt: json['endAt'],
      coverUrl: json['coverUrl'],
      fileId: json['fileId'],
      start_at: json['start_at']);
}
