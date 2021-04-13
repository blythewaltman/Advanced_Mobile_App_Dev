package com.example.lab8

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import com.example.lab8.model.Match
import com.example.lab8.model.MatchViewModel
import com.example.lab8.util.JSONData
import androidx.activity.viewModels
import androidx.lifecycle.Observer

class MainActivity : AppCompatActivity() {

    private val model : MatchViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val loader = JSONData()

        val percentText : TextView = findViewById(R.id.percentTextView)
        val resultText : TextView = findViewById(R.id.resultTextView)
        val firstName : EditText = findViewById(R.id.fnameTextView)
        val secondName : EditText = findViewById(R.id.snameTextView)
        var fname : String
        var sname : String

        val matchObserver = Observer<Match>{newMatch ->
            percentText.text = newMatch.percentage + "%"
            resultText.text = newMatch.result
        }

        model.matchInfo.observe(this, matchObserver)

        val calculateBtn : Button = findViewById(R.id.calculateLoveBtn)
        calculateBtn.setOnClickListener {
            fname = firstName.text.toString()
            sname = secondName.text.toString()
            println("First name : $fname")
            println("Second name : $sname")
            loader.loadJSON(this, model, fname, sname)
        }
    }
}