Class {
	#name : #Sudoku,
	#superclass : #Object,
	#instVars : [
		'sdm',
		'grid'
	],
	#category : #'Gt4Sudoku-Model'
}

{ #category : #accessing }
Sudoku class >> sdm: aString [
	^ self new sdm: aString
]

{ #category : #accessing }
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

{ #category : #accessing }
Sudoku >> initialize [
	self initializeGrid
]

{ #category : #accessing }
Sudoku >> initializeGrid [
	grid := (1 to: 9)
		collect: [ :row | (1 to: 9) collect: [ :col | Cell row: row col: col ] ]
]

{ #category : #accessing }
Sudoku >> sdm: aString [
	sdm := aString.
	self updateCells
]

{ #category : #accessing }
Sudoku >> updateCells [
	^ 1
		to: 9
		do: [ :row | 
			1
				to: 9
				do: [ :col | ((grid at: row) at: col) value: (sdm at: (row - 1) * 9 + col) ] ]
]
