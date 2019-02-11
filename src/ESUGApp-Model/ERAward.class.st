Class {
	#name : #ERAward,
	#superclass : #SDActiveRecord,
	#instVars : [
		'nameAward',
		'smalltalkDialect',
		'affiliation',
		'country',
		'downloadUrl',
		'demoUrl',
		'keywords',
		'licence',
		'submitter',
		'otherDevelopers',
		'submittionDate'
	],
	#category : #'ESUGApp-Model-Magritte'
}

{ #category : #accessing }
ERAward class >> submitter: anAttendee [
	^ self new 
		submitter: anAttendee; 
		yourself 
]

{ #category : #accessing }
ERAward >> affiliation [
	^ affiliation
]

{ #category : #accessing }
ERAward >> affiliation: anObject [
	affiliation := anObject
]

{ #category : #accessing }
ERAward >> country [
	^ country
]

{ #category : #accessing }
ERAward >> country: anObject [
	country := anObject
]

{ #category : #accessing }
ERAward >> demoUrl [
	^ demoUrl
]

{ #category : #accessing }
ERAward >> demoUrl: anObject [
	demoUrl := anObject
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionAffilitation [
	<magritteDescription>
	| tmp |
	tmp := MAStringDescription new.
	tmp 
		accessor: #affiliation; 
		priority: 50;
		beRequired;
		label: 'Affiliation (Required)';
		withoutLabel: true;
		componentClass: MDLMATextInputComponent.
	^ tmp yourself
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionCountry [
	<magritteDescription>
	| tmp1 |
	tmp1 := MASingleOptionDescription new.
	tmp1
		accessor: #country;
		priority: 60;
		required: false;
		options: ERAttendee countries;
		withoutLabel: true;
		componentClass: MDLMASelectListComponent .
	^ tmp1 yourself
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionDemoUrl [
	<magritteDescription>
	| tmp |
	tmp := MAStringDescription new.
	tmp 
		accessor: #demoUrl; 
		priority: 80;
		required: false;
		withoutLabel: true;
		componentClass: MDLMATextInputComponent.
	^ tmp yourself
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionDownloadUrl [
	<magritteDescription>
	| tmp |
	tmp := MAStringDescription new.
	tmp 
		accessor: #downloadUrl; 
		priority: 70;
		beRequired;
		label: 'Download Url (Required)';
		withoutLabel: true;
		componentClass: MDLMATextInputComponent.
	^ tmp yourself
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionKeywords [
	<magritteDescription>
	| tmp |
	tmp := MAStringDescription new.
	tmp 
		accessor: #keywords; 
		priority: 90;
		required: false;
		withoutLabel: true;
		componentClass: MDLMATextInputComponent.
	^ tmp yourself
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionLicence [
	<magritteDescription>
	| tmp |
	tmp := MAStringDescription new.
	tmp 
		accessor: #licence; 
		priority: 100;
		required: false;
		withoutLabel: true;
		componentClass: MDLMATextInputComponent.
	^ tmp yourself
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionNameAward [
	<magritteDescription>
	| tmp |
	tmp := MAStringDescription new.
	tmp 
		accessor: #nameAward; 
		priority: 10;
		beRequired;
		label: 'Name (Required)';
		withoutLabel: true;
		componentClass: MDLMATextInputComponent.
	^ tmp yourself
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionOtherDevelopers [
	<magritteDescription>
	| tmp |
	tmp := MAMemoDescription new.
	tmp 
		accessor: #otherDevelopers; 
		priority: 30;
		required: false;
		lineCount: 5;
		withoutLabel: true;
		componentClass: MDLMATextAreaComponent.
	^ tmp yourself
]

{ #category : #'as yet unclassified' }
ERAward >> descriptionSmalltalkDialect [
	<magritteDescription>
	| tmp |
	tmp := MAStringDescription new.
	tmp 
		accessor: #smalltalkDialect; 
		priority: 40;
		required: false;
		withoutLabel: true;
		componentClass: MDLMATextInputComponent.
	^ tmp yourself
]

{ #category : #accessing }
ERAward >> downloadUrl [
	^ downloadUrl
]

{ #category : #accessing }
ERAward >> downloadUrl: anObject [
	downloadUrl := anObject
]

{ #category : #accessing }
ERAward >> keywords [
	^ keywords
]

{ #category : #accessing }
ERAward >> keywords: anObject [
	keywords := anObject
]

{ #category : #accessing }
ERAward >> licence [
	^ licence
]

{ #category : #accessing }
ERAward >> licence: anObject [
	licence := anObject
]

{ #category : #accessing }
ERAward >> nameAward [
	^ nameAward
]

{ #category : #accessing }
ERAward >> nameAward: anObject [
	nameAward := anObject
]

{ #category : #accessing }
ERAward >> otherDevelopers [
	^ otherDevelopers
]

{ #category : #accessing }
ERAward >> otherDevelopers: anObject [
	otherDevelopers := anObject
]

{ #category : #accessing }
ERAward >> smalltalkDialect [
	^ smalltalkDialect
]

{ #category : #accessing }
ERAward >> smalltalkDialect: anObject [
	smalltalkDialect := anObject
]

{ #category : #accessing }
ERAward >> submitter [
	^ submitter
]

{ #category : #accessing }
ERAward >> submitter: anObject [
	submitter := anObject
]

{ #category : #accessing }
ERAward >> submittionDate [
	^ submittionDate
]

{ #category : #accessing }
ERAward >> submittionDate: anObject [
	submittionDate := anObject
]