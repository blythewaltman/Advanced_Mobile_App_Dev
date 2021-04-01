package com.example.lab7.sample

import com.example.lab7.model.Cloud
import com.example.lab7.model.Tree

object SampleData {
    val cloudList = ArrayList<Cloud>()

    init{
        cloudList.add(Cloud("Cirrus"))
        cloudList.add(Cloud("Cirrocumuls"))
        cloudList.add(Cloud("Cirrostratus"))
        cloudList.add(Cloud("Altocumulus"))
        cloudList.add(Cloud("Altostratus"))
        cloudList.add(Cloud("Stratus"))
        cloudList.add(Cloud("Stratocumulus"))
        cloudList.add(Cloud("Nimbostratus"))
        cloudList.add(Cloud("Cumulus"))
        cloudList.add(Cloud("Cumulonimbus"))
        cloudList.add(Cloud("Lenticular"))
        cloudList.add(Cloud("Kelvin-Helmholtz"))
        cloudList.add(Cloud("Mammatus"))
        cloudList.add(Cloud("Contrails"))
    }

    val treeList = ArrayList<Tree>()

    init{
        treeList.add(Tree("Maple"))
        treeList.add(Tree("Oak"))
        treeList.add(Tree("Sycamore"))
        treeList.add(Tree("Pine"))
        treeList.add(Tree("Fir"))
        treeList.add(Tree("Elm"))
        treeList.add(Tree("Willow"))
        treeList.add(Tree("Magnolia"))
        treeList.add(Tree("Birch"))
        treeList.add(Tree("Tulip"))
        treeList.add(Tree("Butternut"))
        treeList.add(Tree("Cedar"))

    }

}