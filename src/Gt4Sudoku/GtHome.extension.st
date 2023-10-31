Extension { #name : #GtHome }

{ #category : #'*Gt4Sudoku' }
GtHome >> sudokuSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'Sudoku';
		description: 'Sudoku project';
		databaseName: 'feenkcom/gt4sudoku/lepiter';
		startPageName: 'Sudoku project overview';
		priority: 10
]
