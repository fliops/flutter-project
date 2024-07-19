import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';

mixin class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  postRequestWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));

    // Open the file and create a ByteStream
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());

    // Create a multipart file from the ByteStream
    var multipartFile = http.MultipartFile("file", stream, length,
        filename: basename(file.path));

    // Add the multipart file to the request
    request.files.add(multipartFile);

    // Add additional data fields to the request
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    // Send the request

    var myresponse = await request.send();
    // var streamedResponse = await request.send();

    // Check if the request was successful (status code 200)
    var response = await http.Response.fromStream(myresponse);

    // var responseBody = await http.Response.fromStream(myrequest);
    if (myresponse.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error ${response.statusCode}");
    }
  }
}
