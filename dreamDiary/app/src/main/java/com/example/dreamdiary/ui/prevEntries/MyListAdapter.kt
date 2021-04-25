package com.example.dreamdiary.ui.prevEntries

import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.dreamdiary.R
import com.example.dreamdiary.model.ItemViewModel
import com.google.android.material.snackbar.Snackbar

class MyListAdapter(private val itemViewModel: ItemViewModel): RecyclerView.Adapter<MyListAdapter.ViewHolder>() {
    private var myItemList = itemViewModel.itemList.value

    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val cardText: TextView = view.findViewById(R.id.card_text)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        //create an instance of LayoutInflater
        val layoutInflater = LayoutInflater.from(parent.context)
        //inflate the view
        val itemViewHolder = layoutInflater.inflate(R.layout.item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        //get data at the position
        val item = myItemList?.get(position)
        //set the text of the textview to the name
        holder.cardText.text = item?.name ?: ""
        when(item?.nightmare ?: 0){
            1 -> holder.cardText.setBackgroundColor(Color.parseColor("#ff6f60"))
            0 -> holder.cardText.setBackgroundColor(Color.parseColor("#76d275"))
        }
        //context menu
        holder.itemView.setOnCreateContextMenuListener(){menu, view, menuInfo ->
            //set the menu title
            menu.setHeaderTitle(R.string.delete)

            //add the choices to the menu
            menu.add(R.string.yes).setOnMenuItemClickListener {
                //remove item from view model
                itemViewModel.delete(item!!)
                Snackbar.make(view, R.string.deleteItem, Snackbar.LENGTH_LONG)
                        .setAction(R.string.action, null).show()
                true
            }
            menu.add(R.string.no)
        }
    }

    override fun getItemCount(): Int {
        if (myItemList != null) {
            return myItemList!!.size
        } else return 0
    }

    fun update(){
        myItemList = itemViewModel.itemList.value
        notifyDataSetChanged()
    }

}