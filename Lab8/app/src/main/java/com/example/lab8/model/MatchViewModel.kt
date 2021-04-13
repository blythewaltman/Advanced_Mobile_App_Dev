package com.example.lab8.model

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class MatchViewModel: ViewModel() {
    val matchInfo = MutableLiveData<Match>()
}