package com.example.androidstd_geofencing;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.EventChannel.EventSink;

import io.flutter.plugins.GeneratedPluginRegistrant;

import java.net.SocketPermission;
import java.util.*;

import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.Geofence;
import com.google.android.gms.location.GeofencingClient;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.GeofencingEvent;

import android.app.PendingIntent;
import android.content.Intent;
import android.content.BroadcastReceiver;

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.OnFailureListener;

import android.util.Log;

//import android.support.annotation.NonNull;
// import com.google.android.gms.common.api.GoogleApiClient;
// import com.google.android.gms.common.api.ResultCallback;
// import com.google.android.gms.common.api.Status;

public class MainActivity extends FlutterActivity {
  boolean replay;
  String sendBack;
  private GeofencingClient geofencingClient;
  ArrayList geofenceList = new ArrayList();
  private static final String CHANNEL1 = "flutter.native/helper";
  //private static final String CHANNEL = "second";
  //public EventChannel.EventSink mEventSink;
  public MethodChannel.Result mResult;
  private PendingIntent geofencePendingIntent;

  public Bundle savedInstanceState;

  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), CHANNEL1).setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("geofence")) {
          final double a = call.argument("t");
          final double b = call.argument("r");
          final String ok = call.argument("check");
          final String geofenceTransition = call.argument("geofenceTransition");
          mResult=result;
          geofence(a, b, ok, geofenceTransition,mResult);
        } else if(call.method.equals("exitGeofence")){
            mResult=result;
            final String geofenceTrans="";
            exitGeofence(geofenceTrans,mResult);
        }
      }
    });

    // final EventChannel eventChannel = new EventChannel(getFlutterView(), CHANNEL);
    // eventChannel.setStreamHandler(new StreamHandler()  {
    // @Override
    // public void onCancel(Object arguments) {
    //   System.out.println("right");

    //   System.out.println("up");
    // }

    // @Override
    // public void onListen(Object o, EventChannel.EventSink eventSink) {
    //   System.out.println("left");
    //   mEventSink = eventSink;
    //   String geofenceTrans="check";
    //   System.out.println("down");
    // }
    // });
  }

  private static MethodChannel.Result replyExitObjectStore;

  public void exitGeofence(String geofenceTrans,MethodChannel.Result mResult){
    if(mResult!=null){
      System.out.println("exit try"+mResult);
      replyExitObjectStore=mResult;
      System.out.println("exit try object store "+replyExitObjectStore);
    }else if(mResult==null){
      System.out.println("replyExitObjectStore "+replyExitObjectStore);
      mResult=replyExitObjectStore;
      mResult.success(geofenceTrans);
    }

  }

  private static MethodChannel.Result sencondObjectStore;
  
  public void geofence(double a, double b, String ok, String geofenceTrans,MethodChannel.Result mResult) {
    

    if(mResult!=null){
      System.out.println("First try"+mResult);
      sencondObjectStore=mResult;
      System.out.println("First try object store "+sencondObjectStore);
    }else if(mResult==null){
      System.out.println("SecondObjectstoreis"+sencondObjectStore);
      mResult=sencondObjectStore;
    }

    if (ok.equals("ok")) {
      geofencingClient = LocationServices.getGeofencingClient(this);

      // String geofencingClient =
      // LocationServices.getGeofencingClient(this).toString();

      geofenceList.add(new Geofence.Builder()
          // Set the request ID of the geofence. This is a string to identify this
          // geofence. 27.694501704324644, 85.33888164907694
          .setRequestId("My geofence")

          .setCircularRegion(a, b, 500).setExpirationDuration(300000) // 5 minute
          .setTransitionTypes(Geofence.GEOFENCE_TRANSITION_ENTER | Geofence.GEOFENCE_TRANSITION_EXIT).build());

      System.out.println("Arry list is:" + geofenceList);
      // getGeofencingRequest();

      geofencingClient.addGeofences(getGeofencingRequest(), getGeofencePendingIntent())
          .addOnSuccessListener(this, new OnSuccessListener<Void>() {
            @Override
            public void onSuccess(Void aVoid) {
              System.out.println("Hurayy! geofence added");
              
            }
          }).addOnFailureListener(this, new OnFailureListener() {
            @Override
            public void onFailure(Exception e) {
              // Failed to add geofences
              // ...
              System.out.println("Sorry! geofence not added");
            }
          });
          //mResult.success("From java Latitude is" + String.valueOf(a) + " From java Longtitude is" + String.valueOf(b));
    } else if (ok.equals("ko")) {

      System.out.println("ha"+mResult);
      String sendBack = geofenceTrans;
      System.out.println(sendBack);
      if(mResult!=null){
        mResult.success(sendBack);
      }else if(mResult==null){
        System.out.println("Hello dude"+mResult);
      }
      
    }
    
  }

  private GeofencingRequest getGeofencingRequest() {
    GeofencingRequest.Builder builder = new GeofencingRequest.Builder();
    builder.setInitialTrigger(GeofencingRequest.INITIAL_TRIGGER_ENTER);
    builder.addGeofences(geofenceList);
    // System.out.println(builder.build());
    return builder.build();
  }

  private PendingIntent getGeofencePendingIntent() {
    // Reuse the PendingIntent if we already have it.
    if (geofencePendingIntent == null) {
      GeofenceBroadcastReceiver obj = new GeofenceBroadcastReceiver();
      //obj.setEventSink(mEventSink);
      Intent intent = new Intent(this, GeofenceBroadcastReceiver.class);
      // We use FLAG_UPDATE_CURRENT so that we get the same pending intent back when
      // calling addGeofences() and removeGeofences(). -23.382350244182177, 135.06510961800814
      geofencePendingIntent = PendingIntent.getBroadcast(this, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT);
    }
    return geofencePendingIntent;
  }
  
   
}
