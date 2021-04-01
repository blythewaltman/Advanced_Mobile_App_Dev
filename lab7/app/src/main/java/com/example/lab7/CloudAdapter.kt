package com.example.lab7

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab7.CloudAdapter.ViewHolder
import com.example.lab7.model.Cloud

class CloudAdapter(private val cloudList: ArrayList<Cloud>): RecyclerView.Adapter<ViewHolder>() {
    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val cloudTextView: TextView = view.findViewById(R.id.textView2)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        //create an instance of LayoutInflater
        val layoutInflater = LayoutInflater.from(parent.context)
        //inflate the view
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun getItemCount() = cloudList.size

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        //get data at the position
        val cloud = cloudList[position]
        //set the text of the textview to the name
        holder.cloudTextView.text = cloud.name
        //assign click listener
      //  holder.itemView.setOnClickListener{clickListener(bulb)}
    }

}