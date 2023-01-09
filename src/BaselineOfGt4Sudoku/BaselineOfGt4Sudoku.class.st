Class {
	#name : #BaselineOfGt4Sudoku,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4Sudoku
}

{ #category : #accessing }
BaselineOfGt4Sudoku class >> loadLepiter [ 
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'feenkcom' / 'gt4sudoku' / 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #baseline }
BaselineOfGt4Sudoku >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'Gt4Sudoku' ]
]
