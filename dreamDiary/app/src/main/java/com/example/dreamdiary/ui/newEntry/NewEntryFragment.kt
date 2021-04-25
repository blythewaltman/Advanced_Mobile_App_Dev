package com.example.dreamdiary.ui.newEntry

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.CheckBox
import android.widget.EditText
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import com.example.dreamdiary.R
import com.example.dreamdiary.model.ItemViewModel
import com.example.dreamdiary.model.Item

class NewEntryFragment : Fragment() {

    private lateinit var newEntryViewModel: ItemViewModel

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        newEntryViewModel =
                ViewModelProvider(this).get(ItemViewModel::class.java)
        val root = inflater.inflate(R.layout.fragment_new_entry, container, false)
        return root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        val saveEntryButton = view.findViewById<Button>(R.id.saveEntryBtn)
        val entryTextField = view.findViewById<EditText>(R.id.entryTextField)
        val nightmareCheckBox = view.findViewById<CheckBox>(R.id.nightmareCheckBox)
        var entry : String
        var isNightmare : Int

        saveEntryButton.setOnClickListener{
            entry = entryTextField.text.toString()
            if(nightmareCheckBox.isChecked == true){
                isNightmare = 1 // The dream was a nightmare
            }
            else{
                isNightmare = 0 // The dream was not a nightmare
            }
            if(!entry.isEmpty()) {
                newEntryViewModel.add(Item(0, entry, isNightmare))
            }
        }
    }
}