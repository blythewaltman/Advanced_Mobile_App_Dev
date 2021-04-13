package com.example.lab8.util

import android.content.Context
import android.util.Log
import android.widget.TextView
import com.android.volley.AuthFailureError
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.cronet.CronetHttpStack.getHeaders
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.lab8.R
import com.example.lab8.model.Match
import com.example.lab8.model.MatchViewModel
import org.json.JSONException
import org.json.JSONObject

class JSONData() {

    fun loadJSON(context: Context, matchViewModel: MatchViewModel, fname: String, sname: String){

        var api_url = ("https://love-calculator.p.rapidapi.com/getPercentage?") + ("fname=") + (fname) + ("&sname=") + (sname)
        println("URL: $api_url")

        val queue = Volley.newRequestQueue(context)

        val stringRequest = object: StringRequest(Request.Method.GET, api_url,
            Response.Listener<String> { response ->
                parseJSON(response,matchViewModel)

            },
            Response.ErrorListener {
                val x = 0
            })
        {
            override fun getHeaders(): MutableMap<String, String> {
                val headers = HashMap<String, String>()
                headers["x-rapidapi-key"] = "ccb661f7f7mshe9e373d8f971d4bp1127cajsnbf33eefb2aa0"
                headers["x-rapidapi-host"] = "love-calculator.p.rapidapi.com"
                return headers
            }


        }
        queue.add(stringRequest)
    }

    fun parseJSON(response: String, matchViewModel: MatchViewModel){
        val match = Match("0", "")

        try {
            //create JSONObject
            val jsonObject = JSONObject(response)

            //create JSONArray with the value from the results key
            val resultsPercentage = jsonObject.getString("percentage")
            val resultsResult = jsonObject.getString("result")

            match.percentage = resultsPercentage
            match.result = resultsResult

        } catch (e: JSONException) {
            e.printStackTrace()
        }
        matchViewModel.matchInfo.value = match
    }
}
