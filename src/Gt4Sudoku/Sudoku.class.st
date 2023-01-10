Class {
	#name : #Sudoku,
	#superclass : #Object,
	#instVars : [
		'sdm'
	],
	#category : #Gt4Sudoku
}

{ #category : #accessing }
Sudoku class >> sdm: aString [
	^ self new sdm: aString
]

{ #category : #accessing }
Sudoku >> sdm: aString [
	sdm := aString
]
