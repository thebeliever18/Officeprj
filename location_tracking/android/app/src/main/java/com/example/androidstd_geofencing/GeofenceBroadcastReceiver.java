package com.example.androidstd_geofencing;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.EventChannel.EventSink;

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
import android.content.Context; 

import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.OnFailureListener;

import android.util.Log;
import io.flutter.plugin.common.*;
import io.flutter.plugin.common.StringCodec;
import io.flutter.view.FlutterView;

import io.flutter.plugin.common.BasicMessageChannel;
import java.lang.Object.*;



public class GeofenceBroadcastReceiver extends BroadcastReceiver{
    //ArrayList e = new ArrayList();
    // GeofenceBroadcastReceiver(EventChannel.EventSink mEventSink){
    //     //final EventChannel.EventSink mEventSink=mEventSink;
    //     System.out.println("Printing event sink"+mEventSink);
        
    // }
    //boolean tf;
    //private final BinaryMessenger messenger;

    public MethodChannel.Result mResult;

    //public EventChannel.EventSink mEventSink;
    public static final String TAG = ".GeofenceBroadcastReceiver";
    // public FlutterView getFlutterView(){

    // }-23.370971910451647, 135.06041575223207
    //String one;
    // public EventChannel.EventSink getEventSink() {
    //     return mEventSink;
    // }

    // public void setEventSink(EventChannel.EventSink eventSink) {
            
    //         System.out.println("lp");
    //         mEventSink = eventSink;
    //         //Syste
    //         System.out.println("lk");
    // }
    
    @Override
    public void onReceive(Context context, Intent intent) {
        GeofencingEvent geofencingEvent = GeofencingEvent.fromIntent(intent);
        int geofenceTransition = geofencingEvent.getGeofenceTransition();
        System.out.println(geofenceTransition);
        MainActivity objMainActivity= new MainActivity();
        double a=0.0;
        double b=0.0;
        String ok="ko";
        String geofenceTrans;
        if(geofenceTransition==1){
            geofenceTrans="You have entered in the geofence";
            objMainActivity.geofence(a,b,ok,geofenceTrans,mResult);
        }else if(geofenceTransition==2){
            geofenceTrans="You have exited from the geofence";
            objMainActivity.exitGeofence(geofenceTrans,mResult);
        }
    }
}
    // public int send(int geofenceTransition){
    //     System.out.println(geofenceTransition);
    //     MainActivity mMainActivity= new  MainActivity();
    //     mMainActivity.tryit(geofenceTransition);
    //     return geofenceTransition;
    // }
    
        // if (geofencingEvent.hasError()) {
        //     System.out.println("geofencingEvent has error");
        //     //String errorMessage = GeofenceErrorMessages.getErrorString(this,
        //     //        geofencingEvent.getErrorCode());
        //     //Log.e("Error message TAG", errorMessage);
        //     return;
        // }
  
        // // Get the transition type.
        // int geofenceTransition = geofencingEvent.getGeofenceTransition();
  
        // // Test that the reported transition was of interest.
        // //on geofence entry
        // if (geofenceTransition == Geofence.GEOFENCE_TRANSITION_ENTER) {
        //     //List<Geofence> triggeringGeofences = geofencingEvent.getTriggeringGeofences();
        //     //System.out.println("Trigger events"+triggeringGeofences);
        //     System.out.println("You have entered the geofence");
        //     // Notification notify=new Notification();
        //     // notify.Notify();
        //     // one="You have entered geofence";
        //     //result.success(reply("You have entered the geofence"));
        //     //reply("You have entered the geofence");
        //     //val channel = BasicMessageChannel<String>(flutterView, "foo", StringCodec.INSTANCE);
        //     // try{
        //     //     String channel = BasicMessageChannel( messenger,"foo", StringCodec.INSTANCE);
        //     //  channel.send("You have entered geofence");
        //     // }catch(Exception e){
        //     //     System.out.println(e);
        //     // }

             
            
        // //on geofence exit
        // } else if(geofenceTransition == Geofence.GEOFENCE_TRANSITION_EXIT){
        //     System.out.println("You have exited from geofence");
        //     // Notification notify=new Notification();
        //     // notify.Notify();
        //     // one="You have entered geofence";
        //     //result.success(reply("You have entered the geofence"));
        //     //reply("You have exited from geofence");
        //     // try{
        //     //     String channel = BasicMessageChannel( messenger,"foo", StringCodec.INSTANCE);
        //     //  channel.send("You have entered geofence");
        //     // }catch(Exception e){
        //     //     System.out.println(e);
        //     // }
        // // Log the error.
        // }else{
        //     Log.d(TAG,"Error");
        //     System.out.println("errrror");
        // }
            
        // }
        // // public String reply(String reply){
        // //     //return reply;
        // //     //System.out.println(reply);
        // //     return reply;
        // // }
    
    