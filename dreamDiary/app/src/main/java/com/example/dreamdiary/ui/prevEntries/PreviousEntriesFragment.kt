package com.example.dreamdiary.ui.prevEntries

import android.os.Bundle
import android.view.*
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.view.Menu
import android.view.MenuItem
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.lifecycle.LiveData
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.dreamdiary.R
import com.example.dreamdiary.model.Item
import com.example.dreamdiary.model.ItemViewModel

class PreviousEntriesFragment : Fragment() {

    private val prevEntriesViewModel: ItemViewModel by viewModels()

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        val root = inflater.inflate(R.layout.fragment_prev_entries, container, false)
        return root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        val recyclerView : RecyclerView = view.findViewById(R.id.entryRecyclerView)
        //set a layout manager on the recycler view
        recyclerView.layoutManager = LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false)

        val adapter = MyListAdapter(prevEntriesViewModel)

        recyclerView.adapter = adapter

        //create the observer
        getActivity()?.let {
            prevEntriesViewModel.itemList.observe(it, Observer {
            adapter.update()
        })
        }
    }

}