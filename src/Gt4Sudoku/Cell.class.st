Class {
	#name : #Cell,
	#superclass : #Object,
	#instVars : [
		'value',
		'row',
		'col'
	],
	#category : #'Gt4Sudoku-Model'
}

{ #category : #accessing }
Cell class >> row: row col: col [
	^ self new
		row: row;
		col: col;
		yourself
]

{ #category : #accessing }
Cell class >> with: aCharacter [ 
	^ self new value: aCharacter
]

{ #category : #accessing }
Cell >> col: aDigit [
	col := aDigit
]

{ #category : #accessing }
Cell >> row: aDigit [
	row := aDigit
]

{ #category : #accessing }
Cell >> value [
	^ value
]

{ #category : #accessing }
Cell >> value: aCharacter [
	value := aCharacter
]
