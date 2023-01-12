Class {
	#name : #SuCell,
	#superclass : #Object,
	#instVars : [
		'value',
		'row',
		'col',
		'candidates'
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
SuCell >> candidates [
	candidates isNil
		ifTrue: [ self isEmpty
				ifTrue: [ candidates := '123456789' ]
				ifFalse: [ candidates := self value asString ] ].
	^ candidates
]

{ #category : #accessing }
SuCell >> col: aDigit [
	col := aDigit
]

{ #category : #constant }
SuCell >> emptyValue [
	^ Character space
]

{ #category : #testing }
SuCell >> isEmpty [
	^ self value = self emptyValue
]

{ #category : #accessing }
SuCell >> notEmpty [
	^ self isEmpty not
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

	^ self isEmpty ifTrue: [ $0 ] ifFalse: [ value ]
]

{ #category : #printing }
SuCell >> ssValue [
	"Produce the Simple Soduku value (dot for blanks)"

	^ self isEmpty ifTrue: [ $. ] ifFalse: [ value ]
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
