package com.example.dreamdiary.util

import androidx.lifecycle.LiveData
import com.example.dreamdiary.model.Item

class ItemRepository(private val itemDAO: ItemDAO) {

    val itemList : LiveData<List<Item>> = itemDAO.getAllItems()

    suspend fun insertItem(item: Item){
        itemDAO.insertItem(item)
    }

    suspend fun deleteItem(item: Item){
        itemDAO.deleteItem(item)
    }

    suspend fun deleteAll(){
        itemDAO.deleteAll()
    }
}