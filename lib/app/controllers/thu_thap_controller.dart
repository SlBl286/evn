import 'controller.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class ThuThapController extends Controller {
  int? currentBieuMauId = 0;
  List<BieuMau> listBieuMau = [];
  List<DoiTuong> listDoiTuong = [];
  @override
  construct(BuildContext context) {}

  Future getListBieuMau() async {
    for (var i = 0; i < 6; i++) {
      listBieuMau.add(BieuMau(id: i, name: "Biểu mẫu $i"));
    }
  }

  void getListObject() {
    var rng = new Random().nextInt(11);
    listDoiTuong.clear();
    for (var i = 0; i < rng; i++) {
      listDoiTuong
          .add(DoiTuong(id: i, name: "Đối tượng BM$currentBieuMauId$i"));
    }
  }
}

class BieuMau {
  int id;
  String name;

  BieuMau({required this.id, required this.name});
}

class DoiTuong {
  int id;
  String name;

  DoiTuong({required this.id, required this.name});
}
