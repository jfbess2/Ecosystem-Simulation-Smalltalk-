"Jacob Besse
 
CS 450 Spring 2015
Smalltalk Assignment"


"To run: 
	>gst smalltalk_besse.st
"


"This is the Grid class"
Object subclass: #Grid .
Grid instanceVariableNames: 'rowNcol a b animalList' .
Grid class instanceVariableNames: 'grid ' .


"Initializing the Grid Class"
Grid class extend [ 

	"Grid will be size 10"
	initialize[
	grid:= Array new: 10.
	]
	
	new [
		self initialize .
		^ super new init: grid
	]]
	
	Grid extend [
		init: row [
		
			a:= 1.

			"animalList keeps all the animals that are alive in a single list"			
			animalList:= OrderedCollection new.
			"This creates a 10x10 array"
			rowNcol :=row.
			10 timesRepeat:[rowNcol at: a put: (Array new: 10).
			a:=a+1.].
			a:=1.

			"In that array we place an ordered collection of animals"
                        10 timesRepeat:[b:=1.
			10 timesRepeat:[(rowNcol at: a)at:b put: (OrderedCollection new).b:=b+1.].
			a:=a+1.].

			

 		]

	]

	Grid extend [
	
	"Counts the number of lynxes at a place in the gird"
	"Returns the number of lynxes"
	countLynxesAtRow:r col:c["Returns lynxes in cell"
		|cnt element|
		cnt:=0.
		((rowNcol at: r) at:c) do:[:element | (element getType = 1) ifTrue:[cnt:= cnt+1.].].
		^cnt.
		
	]
	
	"Counts the number of Rabbits at a place in the gird"
	"Returns the number of Rabbits"
	countRabbitsAtRow:r col:c["Returns rabbits in cell"
                |cnt element|
                cnt:=0.
               ((rowNcol at: r) at:c) do:[:element | ((element getType) = 2) ifTrue:[cnt:= cnt+1.].].
                ^cnt.
	]




	"This function is called when a lynx moves into the cell and a rabbit is present"
	"Returns the ID of a rabbit type which will be eaten by the lynx"	
	rabbitsToEatRow:row Col:col[
		|element toEat index|
	
		"A collection of all animals in cell"
		toEat:= OrderedCollection new.
      		((rowNcol at:row) at: col) do:[:element | toEat add:element.].

		"Random index of collection is selected"
		index:=((Simulation new) getRand *(toEat size)) ceiling.

		"While the collection is not empty, check if the index is a rabbit,
		if so return the ID of the rabbit to be eaten, else return nil"

		[(toEat size) > 0] whileTrue:[
		((toEat at: index)getType = 2) ifTrue: [^(((rowNcol at: row) at: col) at: index) getID ]
		ifFalse:[toEat removeAtIndex: index].
		index:=((Simulation new) getRand *(toEat size)) ceiling.].
		^nil.
	]

	"put places an animal class in a given spot on the grid and in the animal list"
	put:ani row:r col:c[
		
		ani setRow:r Col:c.

		((rowNcol at: r) at: c) add:ani.
		animalList add:ani.
	]

	"remove deletes the animal from the grid and alive animal list"
	remove:ani row:r col:c[
                
                ((rowNcol at: r) at: c) remove: ani.
		animalList remove:ani.
	]

	"returns the location on the grid"	
	getIndexRow:r col:c[
		^((rowNcol at: r) at: c)
	]

	"Returns the list of animals that are currently alive on the grid"
	getAnimalList[
		^animalList
	]
]



"Class of Animals which includes both the Rabbit and the Lynx"

Object subclass: #Animal .
Animal instanceVariableNames: ' type id row col direction age' .
Animal class instanceVariableNames: 'count' .
	
	Animal class extend[
		initialize[count:=0.]
		new[
		self initialize.
		^super new init
	]]

	"The traits of the animal"
	Animal extend [
		init [
			"Type 1 is a lynx, type 2 is a rabbit"
			type:=nil.

			"Location of animal on grid"
			col:= nil.
			row:= nil.

			"Which way the animal is moving"
			direction:=nil.

			"how old is the animal (die off) and the ID of the animal"
			age:=nil.
			id:= (Simulation new) getRand.
	]
	]

	Animal extend[
	

	"returns the direction of the animal"
	getDirection[
		^direction.
	]	
	
	"returns animals ID"
	getID[
		^id]

	"returns the row"
	getRow[
		^row]

	"returns the col"
	getCol[

		^col]

	"returns the type (lynx or rabbit)"
	getType[

		^type]	

	"returns the age"
	getAge[
		^age]
	
	"increments the age of the age by 1"
	incrementAge[
		age:= age+1]

	"Sets the direction of movement randomly 1,2,3,4 (west, north, east, south)"
	setDirection:dir[
		direction:= (dir next* 4) ceiling.
	]

	"sets row and col for animal"
	setRow:r Col:c[
		row:=r.
		col:=c.
	]
		

	"Move moves the animals a neither up, down, left, or right.
	If the animal is on a edge and moves into the edge, it is placed of the other side
	of the grid is if the grid were a continuous object"
	move[
			"west"
			(direction = 1) ifTrue:[(col>1) ifTrue: [col:=col-1] ifFalse: [col:=10].].
                        "north"
			(direction = 2) ifTrue: [(row>1) ifTrue: [row:=row-1] ifFalse: [row:=10].].
                        "east"
			(direction = 3) ifTrue: [(col<10) ifTrue: [col:=col+1] ifFalse: [col:=1].].
                        "south"
			(direction = 4) ifTrue: [(row<10) ifTrue: [row:=row+1] ifFalse: [row:=1].].
	
	]

	]


"Subclass for Lynx"
Animal subclass: #Lynx.
Lynx instanceVariableNames: ' '.
	Lynx class extend[
		new[
		^super new init
	]]
	
	"Set the type to 1 for lynx, age = 0 (new born)"
	Lynx extend [
		init [
		type:=1.
		age:=0.
	]]

	Lynx extend[
	
	"act method for lynx"
	act:grid[
	|rabbitFood|

	"takes the grid and sees if there are any rabbits to eat in its location"
	((grid countRabbitsAtRow: row col: col) >0) ifTrue: [

		"if a rabbit is present, a new lynx is born and a rabbit at that location
		is choosen randomly to be eaten (see rabbitsToEat fuction (Grid Class method))"

		grid put: (Lynx new) row: (row) col: (col).
                rabbitFood:= (grid rabbitsToEatRow:row Col:col).
		(rabbitFood ~=nil) ifTrue: [
		grid remove:rabbitFood row: row col:col.
		"return the rabbit's ID which is eaten"
		^rabbitFood.].
		].
		
		"if no rabbits are presents, return 1 (lynx dies)" 
		^1.
		]
	]	

"Subclass for rabbits"
Animal subclass: #Rabbit.
Rabbit instanceVariableNames: ' '.
        Rabbit class extend[
                new[
                ^super new init
        ]]


	"Set rabbit type to 2"
        Rabbit extend [
                init [
                type:=2.
		age:=0.
                ]]
        
	Rabbit extend[

	"if a rabbit is present in the cell the rabbit jumped to (more than 1 rabbit total),
	make 2 new rabbits and place them in that cell. They won't move this round because they
	are not in the active toMove list(below)"

	act:grid[
	((grid countRabbitsAtRow: row col: col) >1) ifTrue: [
	 2 timesRepeat:[grid put: (Rabbit new) row: (row) col: (col).].].	
	^2.
	]
        ]

"Class simlation"
Object subclass: #Simulation.
Simulation instanceVariableNames: 'numRabbits numLynxes thegrid random'.
	Simulation class extend[
		new[ ^super new init]]
		

	"Simulation starts with 50 rabbits and 10 lynxes, a new grid and a random number generator"

	Simulation extend[
		init[
		numRabbits:= 50.
		numLynxes:= 10.
		thegrid:= Grid new.
		random:=Random new.
		]]


	Simulation extend[

	"Setting up the simulation"
	setup[
		|iter orderCol aLynx aRabbit|
		iter:=0.
		
		"Place the number of new lynxes wanted on the grid randomly and into the alive animal list
		(put does both of these)"
		[iter<numLynxes] whileTrue:[
		aLynx:= Lynx new.
		thegrid put: aLynx row: ((random next *10)ceiling) col: ((random next*10) ceiling).
		iter:=iter+1.
		].

		"Place the number of new rabbits wanted on the grid randomly and into the alive animal list
                (put does both of these)"
		iter:= 0.
                [iter<numRabbits] whileTrue:[
		aRabbit:= Rabbit new.
                thegrid put: aRabbit row: ((random next *10)ceiling) col: ((random next*10) ceiling).
                iter:=iter+1.
                ].]


	"Step 1 month at a time, this moves all the animals that are alive to start the round randomly (not ones born during the round).
	If an animal is eaten halfway through a step and has not already moved, it obiviously does not get to move, this is done
	by removing it from the grid and the toMove list. 

	The toMove list is alist of all the animals that are yet to move and were
	alive/still alive to start the round"

	step[
		|toMove element tempAni index deadAni|
		
		"toMove is a list of all the animals that are alive to start a round and yet to be moved"
		toMove:= OrderedCollection new.
		"Copied from the alive animal list"
		thegrid getAnimalList do:[:element | toMove add:element.].

		"while not all animals have acted this step"
		[toMove size > 0] whileTrue:[ 

			"pick a random animal"
			index:=((random next*(toMove size))ceiling).
			tempAni:= toMove at: index.

			"Think of the next few lines of code as a chess piece (pick it up, move it, and sit it down on the new location"
			"Also the age is incremented, and a new random direction is set (for next move)"
			thegrid remove:tempAni row:(tempAni getRow) col: (tempAni getCol). 
			tempAni move.
			tempAni incrementAge.
			tempAni setDirection:random.
                        thegrid put:tempAni row:(tempAni getRow) col: (tempAni getCol).

			"Let the animal act, returns if the animal killed something (returns ID), or returns type)"
			deadAni := tempAni act:thegrid.

			"All ID are less than 1, if true the animal is eaten. Therefore if it is in the toMove list it is removed.
			It is also deleted from the grid."
			(deadAni > 1) ifTrue:[
			toMove do:[:element | (deadAni = element getID) ifTrue:[ toMove remove:element].].].
			

			"If a 1 is return, this means the lynx did not catch anything and is not dead"
			"It is removed from the grid"
			(deadAni = 1) ifTrue:[ thegrid remove:tempAni row:(tempAni getRow) col: (tempAni getCol).].
			
			"The animal which just acted has to be removed from the toMove list and go back through the while loop"
			toMove removeAtIndex: index.].
	]


"Prints out the status of the simulation"
	status[
		|y z element countRabbits countLynxes|
		y:= 1.
		z:= 1.
		countRabbits:= 0.
		countLynxes:= 0.
	
		"Prints out the grid, with the number of lynxes and rabbis in each cell at the time"

                        10 timesRepeat:[z:=1.
                        10 timesRepeat:[
			countRabbits:= countRabbits + (thegrid countRabbitsAtRow:y col:z).
			countLynxes:= countLynxes + (thegrid countLynxesAtRow:y col:z).
                       'R' display. (thegrid countRabbitsAtRow:y col:z) print.
                       'L' display. (thegrid countLynxesAtRow:y col:z) print. ' ' display.
	
			z:=z+1.].
			' ' displayNl.
                        y:=y+1.].
			' ' displayNl.

			"Prints out the total number of both rabbits and lynxes during that status check"
			'Number of Rabbits: ' display. countRabbits printNl.
			'Number of Lynxes: ' display. countLynxes printNl.

	]

	"return the grid for that simuation"
	getGrid[
		^thegrid.
	]	

	"return a random number"
	getRand[
		^random next]

]
		


		|sim|

		sim:= Simulation new.
		sim setup.
		line:= stdin nextLine.
		[line = 'step'] whileTrue:[sim status.
		sim step.
		line:= stdin nextLine.].

