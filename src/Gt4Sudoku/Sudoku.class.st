Class {
	#name : #Sudoku,
	#superclass : #Object,
	#instVars : [
		'grid',
		'rawData'
	],
	#category : #'Gt4Sudoku-Model'
}

{ #category : #accessing }
Sudoku >> atRow: row col: col [
	^ (grid at: row) at: col
]

{ #category : #accessing }
Sudoku >> boxes [
	^ (1 to: 3)
		flatCollect: [ :x | 
			(1 to: 3)
				collect: [ :y | 
					| startx starty |
					startx := (x - 1) * 3 + 1.
					starty := (y - 1) * 3 + 1.

					(startx to: startx + 2)
						flatCollect: [ :row | (starty to: starty + 2) collect: [ :col | self atRow: row col: col ] ] ] ]
]

{ #category : #accessing }
Sudoku >> columns [
	^ (1 to: 9)
		collect: [ :col | (1 to: 9) collect: [ :row | self atRow: row col: col ] ]
]

{ #category : #gui }
Sudoku >> gtCellsFor: aView [
	<gtView>
	| aColumnedList |
	aColumnedList := aView columnedList
			title: 'Cells';
			priority: 10;
			items: [ grid ];
			column: 'Row/Col' text: [ :each | (grid indexOf: each) asString ] width: 60.
	1
		to: 9
		do: [ :col | 
			aColumnedList
				column: col asString
				text: [ :gridRow | (gridRow at: col) value asString ] ].
	^ aColumnedList
]

{ #category : #initialization }
Sudoku >> initialize [
	self initializeGrid
]

{ #category : #initialization }
Sudoku >> initializeGrid [
	grid := (1 to: 9)
		collect: [ :row | (1 to: 9) collect: [ :col | SuCell row: row col: col ] ]
]

{ #category : #private }
Sudoku >> rawData: aString [
	self assert: aString notNil.
	rawData := aString.
	self updateCells
]

{ #category : #accessing }
Sudoku >> rows [
	"The grid already stores the Cells by row"

	^ grid
]

{ #category : #printing }
Sudoku >> sdm [
	^ '' join: (grid collect: [ :rowData | '' join: (rowData collect: #sdmValue) ])
]

{ #category : #initialization }
Sudoku >> updateCells [
	^ 1
		to: 9
		do: [ :row | 
			1
				to: 9
				do: [ :col | (self atRow: row col: col) value: (rawData at: (row - 1) * 9 + col) ] ]
]
