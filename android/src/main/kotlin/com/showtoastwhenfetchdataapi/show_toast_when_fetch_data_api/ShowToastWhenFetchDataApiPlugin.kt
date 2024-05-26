package com.showtoastwhenfetchdataapi.show_toast_when_fetch_data_api

import androidx.annotation.NonNull
import android.content.Context
import android.widget.Toast
import android.app.Activity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.lang.Thread
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
/** ShowToastWhenFetchDataApiPlugin */
class ShowToastWhenFetchDataApiPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "show_toast_when_fetch_data_api")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override  fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getData") {
      sendGetRequest() { response ->
        println(response)
      }
      Toast.makeText(context, "Data Retrieved Successfully", Toast.LENGTH_LONG).show()
    }
  }



  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  fun sendGetRequest(callback: (String) -> Unit) {
    val url = URL("https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow")
    Thread {
      var response = ""
      with(url.openConnection() as HttpURLConnection) {
        requestMethod = "GET"  // optional default is GET

        println("\nSent 'GET' request to URL : $url; Response Code : $responseCode")

        val responseBuilder = StringBuilder()
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N) {
          inputStream.bufferedReader().use {
            it.lines().forEach { line ->
              responseBuilder.append(line)
            }
          }
        } else {
          val reader: BufferedReader = BufferedReader(InputStreamReader(inputStream))
          var line: String? = reader.readLine()
          while (line != null) {
            responseBuilder.append(line)
            line = reader.readLine()
          }
          reader.close()
        }
        response = responseBuilder.toString()
        callback(response)
      }
    }.start()
  }

}
