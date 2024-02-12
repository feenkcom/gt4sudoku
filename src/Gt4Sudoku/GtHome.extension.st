Extension { #name : #GtHome }

{ #category : #'*Gt4Sudoku' }
GtHome >> sudokuSection [
	<gtHomeSection>
	<gtExample>
	^ SudokuHomeSection new
		priority: 10;
		yourself
]
