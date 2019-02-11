Class {
	#name : #ERContentTab,
	#superclass : #ERStateContent,
	#instVars : [
		'active',
		'id',
		'container',
		'tabId',
		'tabName',
		'contentTab'
	],
	#category : #'ESUGApp-Component'
}

{ #category : #'instance creation' }
ERContentTab class >> on: anAttendee [
	| form |
	form := self new.
	form attendee: anAttendee.
	^ form
]

{ #category : #'instance creation' }
ERContentTab class >> on: anAttendee container: aContainer [
	| form |
	form := self new.
	form attendee: anAttendee.
	form container: aContainer.
	^ form
]

{ #category : #activation }
ERContentTab >> activate [
	active := true.
]

{ #category : #accessing }
ERContentTab >> attendee: anObject [
	attendee := anObject
]

{ #category : #accessing }
ERContentTab >> container: aContainer [
	container := aContainer
]

{ #category : #accessing }
ERContentTab >> contentTab [
	^ contentTab
]

{ #category : #accessing }
ERContentTab >> contentTab: anObject [
	contentTab := anObject
]

{ #category : #private }
ERContentTab >> deactivate [
	active := false.
]

{ #category : #initialization }
ERContentTab >> initialize [
	super initialize.
	active := false.
]

{ #category : #testing }
ERContentTab >> isActive [
	^ active.
]

{ #category : #rendering }
ERContentTab >> renderContentOn: html [
	html render: contentTab  
	
]

{ #category : #accessing }
ERContentTab >> tabId [
	^ tabId 
]

{ #category : #accessing }
ERContentTab >> tabId: anObject [
	tabId := anObject
]

{ #category : #accessing }
ERContentTab >> tabName [
	^ tabName 
]

{ #category : #accessing }
ERContentTab >> tabName: anObject [
	tabName := anObject
]

{ #category : #'as yet unclassified' }
ERContentTab >> updateStateTab: aString [
	container tabs detect: [ :tab | (tab tabName = aString) ]
	ifFound: [ :tab | tab activate.
		container tabs reject: [ :aTab | (aTab tabName = aString) ]
		thenDo: [ :aTab | aTab deactivate ]
	]
]