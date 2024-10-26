class HttpResponseModel {
  String? message;
  String? body;

  HttpResponseModel({
    this.body,
    this.message,
  });

  // Factory constructor para crear una instancia a partir de un JSON
  factory HttpResponseModel.fromJson(Map<String, dynamic> json) {
    return HttpResponseModel(
      body: json['body'],
      message: json['message'],
    );
  }

  // Método para convertir una instancia a JSON
  Map<String, dynamic> toJson() {
    return {
      'body': body,
      'message': message,
    };
  }
}
