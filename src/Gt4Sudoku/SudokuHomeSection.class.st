Class {
	#name : #SudokuHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'Gt4Sudoku-Sections'
}

{ #category : #accessing }
SudokuHomeSection >> homeCard [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard page
		title: 'Sudoku';
		description: 'Sudoku project';
		priority: 10;
		databaseName: 'feenkcom/gt4sudoku/lepiter';
		pageName: 'Sudoku project overview';
		yourself
]
