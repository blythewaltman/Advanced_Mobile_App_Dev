package com.example.dreamdiary.model

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.viewModelScope
import com.example.dreamdiary.util.ItemDatabase
import com.example.dreamdiary.util.ItemRepository
import kotlinx.coroutines.launch

class ItemViewModel(application: Application) : AndroidViewModel(application) {
    private val context = application.applicationContext
    private val itemDatabase = ItemDatabase.getDatabase(context)
    private val itemRepository = ItemRepository(itemDatabase.itemDAO())
    val itemList : LiveData<List<Item>> = itemRepository.itemList

    fun add(item: Item) = viewModelScope.launch{
        itemRepository.insertItem(item)
    }

    fun delete(item: Item) = viewModelScope.launch{
        itemRepository.deleteItem(item)
    }

    fun deleteAll() = viewModelScope.launch{
        itemRepository.deleteAll()
    }
}