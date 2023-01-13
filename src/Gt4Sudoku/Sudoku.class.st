Class {
	#name : #Sudoku,
	#superclass : #Object,
	#instVars : [
		'grid',
		'rawData',
		'columns',
		'boxes'
	],
	#category : #'Gt4Sudoku-Model'
}

{ #category : #example }
Sudoku class >> for: aString [
	^ self new rawData: aString
]

{ #category : #accessing }
Sudoku >> atRow: row col: col [
	^ (grid at: row) at: col
]

{ #category : #accessing }
Sudoku >> boxes [
	boxes
		ifNil: [ boxes := (1 to: 3)
					flatCollect: [ :x | 
						(1 to: 3)
							collect: [ :y | 
								| startx starty |
								startx := (x - 1) * 3 + 1.
								starty := (y - 1) * 3 + 1.
								(startx to: startx + 2)
									flatCollect: [ :row | (starty to: starty + 2) collect: [ :col | self atRow: row col: col ] ] ] ] ].
	^ boxes
]

{ #category : #printing }
Sudoku >> candidateGrid [
	"The Simple Sudoku representation"

	| rowStrings topBottom separator |
	rowStrings := self rows
			collect: [ :row | 
				'| '
					, (' | '
							join: (((row collect: [ :cell | cell candidates padRightTo: 9 ]) groupsOf: 3)
									collect: [ :group | ' ' join: group ])) , ' |' ].

	topBottom := '*' , ('-' repeat: 10 * 9 + 5) , '*'.
	separator := '
|' , ('+' join: ((1 to: 3) collect: [ :n | '-' repeat: 10 * 3 + 1 ]))
			, '|
'.
	^ topBottom , String cr
		, (separator
				join: ((rowStrings groupsOf: 3) collect: [ :group | String cr join: group ]))
		, String cr , topBottom
]

{ #category : #accessing }
Sudoku >> cells [
	^ self rows flatten
]

{ #category : #accessing }
Sudoku >> checkInvariant [
	self cells do: [ :cell | self assert: cell invariant ]
]

{ #category : #private }
Sudoku >> cleanData [
	^ rawData select: [ :char | '0123456789 ._' includes: char ]
]

{ #category : #accessing }
Sudoku >> columns [
	columns
		ifNil: [ columns := (1 to: 9)
					collect: [ :col | (1 to: 9) collect: [ :row | self atRow: row col: col ] ] ].
	^ columns
]

{ #category : #accessing }
Sudoku >> gtBoxesFor: aView [
<gtView>

^ aView forward
	title: 'Boxes'; priority: 20; object: [self boxes]; view: #gtItemsFor:
]

{ #category : #accessing }
Sudoku >> gtCandidatesFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Candidates';
		priority: 35;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self candidateGrid asRopedText ];
		actionUpdateButton
]

{ #category : #gui }
Sudoku >> gtGridFor: aView [
	<gtView>
	| aColumnedList |
	aColumnedList := aView columnedList
			title: 'Grid';
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
Sudoku >> gtSimpleSudokuFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Simple Sudoku';
		priority: 30;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self simpleSudokuString asRopedText ];
		actionUpdateButton
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

{ #category : #printing }
Sudoku >> printOn: aStream [
	self storeOn: aStream
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

{ #category : #printing }
Sudoku >> simpleSudokuString [
	"The Simple Sudoku representation"

	| rowStrings |
	rowStrings := self rows
			collect: [ :row | '|' , ('|' join: (('' join: (row collect: #ssValue)) groupsOf: 3)) , '|' ].

	^ '*-----------*
'
		, ('
|---+---+---|
' join: ((rowStrings groupsOf: 3) collect: [ :each | String cr join: each ]))
		, '
*-----------*
'
]

{ #category : #printing }
Sudoku >> storeOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' for: ';
		store: self sdm
]

{ #category : #initialization }
Sudoku >> updateCells [
	^ 1
		to: 9
		do: [ :row | 
			1
				to: 9
				do: [ :col | (self atRow: row col: col) value: (self cleanData at: (row - 1) * 9 + col) ] ]
]
