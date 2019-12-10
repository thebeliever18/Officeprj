import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:office_prj/homePage.dart';

class Post {
  final String order_id;
  final String order_not_pickuped;
  final String order_return;
  final String order_Delivered_return;
  final String order_delivered;
  final String order_notdelivered;
  final String lastCoddate;
  final String lastCod;
  final String pendingAmt;


  Post({
    this.order_id, 
    this.order_not_pickuped, 
    this.order_return, 
    this.order_Delivered_return,
    this.order_delivered,
    this.order_notdelivered,
    this.lastCoddate,
    this.lastCod,
    this.pendingAmt,
    });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      order_id: json['order_id'].toString(),
      order_not_pickuped: json['data']['order_not_pickuped'].toString(),
      order_return: json['data']['order_return'].toString(),
      order_Delivered_return: json['data']['order_Delivered_return'].toString(),
      order_delivered:json['data']['order_delivered'].toString(),
      order_notdelivered:json['data']['order_notdelivered'].toString(),
      lastCoddate:json['data']['lastCoddate'].toString(),
      lastCod: json['data']['lastCod'].toString(),
      pendingAmt: json['data']['pendingAmt'].toString(),
    ); 
  }
}