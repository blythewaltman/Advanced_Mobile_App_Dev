package com.example.lab7

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.lab7.TreeAdapter.ViewHolder
import com.example.lab7.model.Tree

class TreeAdapter(private val treeList: ArrayList<Tree>): RecyclerView.Adapter<ViewHolder>() {
    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val treeTextView: TextView = view.findViewById(R.id.textView2)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        //create an instance of LayoutInflater
        val layoutInflater = LayoutInflater.from(parent.context)
        //inflate the view
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun getItemCount() = treeList.size

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        //get data at the position
        val tree = treeList[position]
        //set the text of the textview to the name
        holder.treeTextView.text = tree.name
        //assign click listener
        //  holder.itemView.setOnClickListener{clickListener(bulb)}
    }

}