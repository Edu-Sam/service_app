import 'package:flutter/material.dart';
import 'package:shopi_attendant/models/orders.dart';
import  'package:http/http.dart' as http;
import 'dart:convert';

class OrderRepository{
  final String url_fetch_orders="https://shopilyv.com/shopiservice/fetch_orders_attendant.php";

  OrderRepository(){

  }

  Future<List<Orders>> fetchOrdersById(String employee_id) async{
    http.Response response=await http.post(
        url_fetch_orders,
        headers: {"Accept":"application/json"},
        body:{
          "employee_id":employee_id,
        }
    );

    var jsonOrders=jsonDecode(response.body);
    var ordersMap=jsonOrders["orders"] as List;
    List<Orders> order_list=ordersMap.map<Orders>((x) => Orders.fromJson(x)).toList();
    print("The first item is " + order_list.first.order_date);

    return order_list;
  }
}