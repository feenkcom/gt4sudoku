Class {
	#name : #SudokuExamples,
	#superclass : #Object,
	#category : #'Gt4Sudoku-Examples'
}

{ #category : #accessing }
SudokuExamples >> easy [
	<gtExample>
	^ Sudoku new rawData: self easyData
]

{ #category : #accessing }
SudokuExamples >> easyData [
	<gtExample>
	^ '050703060007000800000816000000030000005000100730040086906000204840572093000409000'
]

{ #category : #accessing }
SudokuExamples >> easyHouses [
	"Test the access to the houses (rows, columns and blocks"

	<gtExample>
	| easy |
	easy := self easy.	
	
	"rows"
	self assert: easy rows size equals: 9.
	self assert: easy rows first second value equals: $5.
	self assert: easy rows second third value equals: $7.
	self assert: (easy rows first at: 2) value equals: $5.
	
	"columns"
	self assert: easy columns size equals: 9.
	self assert: easy columns second first value equals: $5.
	self assert: easy columns fourth first value equals: $7.	
	
	"blocks"
	self assert: easy boxes size equals: 9.
	self assert: easy boxes second first value equals: $7.
	self assert: easy boxes fourth seventh value equals: $7.
	
	^ easy
]

{ #category : #accessing }
SudokuExamples >> easyPositions [
	<gtExample>
	| easy |
	easy := self easy.
	self assert: (easy atRow: 1 col: 1) value equals: Character space.
	self assert: (easy atRow: 1 col: 2) value equals: $5.
	^ easy
]

{ #category : #accessing }
SudokuExamples >> easySdm [
	<gtExample>
	| easy |
	easy := self easy.
	self assert: easy sdm equals: self easyData.
	^ easy
]

{ #category : #accessing }
SudokuExamples >> sudoku20min20220530 [
	<gtExample>
	^ Sudoku new
		rawData: '.8.16......3......4..2.819...7......948...623......4...357.9..1......3......13.4.'
]
