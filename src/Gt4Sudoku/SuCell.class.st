Class {
	#name : #SuCell,
	#superclass : #Object,
	#instVars : [
		'value',
		'row',
		'col'
	],
	#category : #'Gt4Sudoku-Model'
}

{ #category : #accessing }
SuCell class >> row: row col: col [
	^ self new
		row: row;
		col: col;
		yourself
]

{ #category : #accessing }
SuCell class >> with: aCharacter [ 
	^ self new value: aCharacter
]

{ #category : #accessing }
SuCell >> col: aDigit [
	col := aDigit
]

{ #category : #accessing }
SuCell >> printOn: aStream [
	aStream nextPutAll: self value asString
]

{ #category : #accessing }
SuCell >> row: aDigit [
	row := aDigit
]

{ #category : #accessing }
SuCell >> sdmValue [
	"Produce the SDM value (0 for blanks)."

	^ value = Character space ifTrue: [ $0 ] ifFalse: [ value ]
]

{ #category : #printing }
SuCell >> ssValue [
	"Produce the Simple Soduku value (dot for blanks)"

	^ value = Character space ifTrue: [ $. ] ifFalse: [ value ]
]

{ #category : #accessing }
SuCell >> value [
	^ value
]

{ #category : #accessing }
SuCell >> value: aCharacter [
	('123456789' includes: aCharacter)
		ifTrue: [ value := aCharacter ]
		ifFalse: [ value := Character space ]
]
