Class {
	#name : #ERTest,
	#superclass : #TestCase,
	#instVars : [
		'store',
		'controller'
	],
	#category : #'ESUGApp-Test'
}

{ #category : #tests }
ERTest class >> testAdditionalInformation [
	^ ERAdditionalInformation new
		keywords: 'test test test';
		additionalText: 'test test test';
		yourself
]

{ #category : #tests }
ERTest class >> testAffiliationInformation [
	^ ERAffiliationInformation new
		organizationName: 'testOrgName';
		organizationAddrees1: 'testAddress1';
		organizationAddrees2: 'testAddress2';
		organizationCity: 'testCity';
		organizationCountry: 'Bolivia';
		organizationProvince: 'testProvince';
		organizationPostal: '0000';
		membershipType: 'Student';
		yourself
]

{ #category : #tests }
ERTest class >> testAttendee [
	^ ERAttendee new
		userAccount: self testUserAccount;
		contactInformation: self testContactInformation ;
		conferenceInformation: self testRegisterConferenceInformation ;
		affiliationInformation: self testAffiliationInformation ;
		additionalInformation: self testAdditionalInformation ;
		paymentInformation: self testPaymentInformation ;
		yourself
]

{ #category : #tests }
ERTest class >> testAward: anAttendee [
	^ (ERAward submitter: anAttendee) 
			nameAward: 'testAward';
			smalltalkDialect: 'English';
			affiliation: 'Test Org.';
			country: nil;
			downloadUrl: 'https://www.webpagetest.org/';
			demoUrl: 'https://www.webpagetest.org/';
			keywords: 'test, test, test, test';
			licence: 'MIT';
			otherDevelopers: 'Test Dev, Test1 Dev';
			submittionDate: Date today;
			yourself 
			
			
]

{ #category : #tests }
ERTest class >> testContactInformation [
	^ ERContactInformation new
		address: 'testAddress';
		address2: 'testAddress2';
		city: 'testCity';
		country: 'Bolivia';
		postal: '0000';
		province: 'test';
		facebookURL: 'https://es-la.facebook.com/login/example';
		twitterURL: 'https://es-la.twitter.com/login/example';
		homePageURL: 'https://medium.com/espanol/example';
		yourself
]

{ #category : #tests }
ERTest class >> testExampleAttendee [
	^ ERAttendee new
		userAccount: self testUserExampleAccount;
		contactInformation: self testContactInformation ;
		conferenceInformation: self testRegisterConferenceInformation ;
		affiliationInformation: self testAffiliationInformation ;
		additionalInformation: self testAdditionalInformation ;
		paymentInformation: self testPaymentInformation ;
		yourself
]

{ #category : #tests }
ERTest class >> testGroupManager [
	^ ERGroupManager new
		userAccount: self testUserAccount asGroupManager;
		affiliationInformation: self testAffiliationInformation;
		yourself
]

{ #category : #tests }
ERTest class >> testModifyUser [
	^ ERUserAccount new
		firstName: 'userModify';
		lastName: 'usermodify';
		email: 'userModify@gmail.com';
		yourself 
]

{ #category : #tests }
ERTest class >> testPaymentInformation [
	^ ERPaymentInformation new
		paymentType: 'Bank transfer';
		paymentCurrency: 'Euro';
		coupon: nil;
		yourself
]

{ #category : #tests }
ERTest class >> testRegisterConferenceInformation [
	^ ERRegisterConferenceInformation new
		attendSocialEvent: true;
		addedToMainList: true;
		foodPreference: 'Normal';
		addPersonToSocialDinner: true;
		personAddedFoodPreference: 'Normal';
		tshirtSize: 'XL';
		attendance:
			(Dictionary
				newFrom:
					{('monday' -> true).
					('tuesday' -> true).
					('wednesday' -> false).
					('thursday' -> false).
					('friday' -> true)});
		gender: 'Male';
		yourself
]

{ #category : #tests }
ERTest class >> testTalk: anAttendee [
	^ (ERTalk submitter: anAttendee) 
			name: 'Talk test';
			description: 'Description test';
			presentation: 'Test Org.';
			authorsWithoutSubmitter: nil;
			submittionDate: Date today;
			yourself 
			
			
]

{ #category : #tests }
ERTest class >> testUserAccount [
	^ ERUserAccount new
		email: 'test@gmail.com';
		firstName: 'Test';
		lastName: 'Test';
		password: '12345678';
		confirmPassword: '12345678';
		yourself
]

{ #category : #tests }
ERTest class >> testUserAccount: email [
	^ ERUserAccount new
		email: email;
		firstName: 'Test';
		lastName: 'Test';
		password: '12345678';
		confirmPassword: '12345678';
		yourself
]

{ #category : #tests }
ERTest class >> testUserExampleAccount [
	^ ERUserAccount new
		email: 'example@gmail.com';
		firstName: 'Example';
		lastName: 'Example';
		password: '12345678';
		confirmPassword: '12345678';
		yourself
]

{ #category : #tests }
ERTest >> defaultStore [
	^ SDMemoryStore new
]

{ #category : #rendering }
ERTest >> registerAsGroupManager [
	^ (ERRegistrationController
		attendee: self class testGroupManager) saveGroupManager
]

{ #category : #rendering }
ERTest >> registerAttendee [
	^ (ERRegistrationController attendee:
			 self class testAttendee) saveAttendee 
]

{ #category : #rendering }
ERTest >> registerAttendee: anAttendee [
	^ (ERRegistrationController attendee: anAttendee)
		saveAttendee
]

{ #category : #tests }
ERTest >> setUp [
	store := self defaultStore.
	SDActiveRecord setStore: store.
	ERUserAccount warmUp.
	ERAttendee warmUp.
	ERAward warmUp.
	ERReductionTicket warmUp.
	ERFee warmUp.
	ERGroup warmUp.
	ERTalk warmUp.
	ERConference warmUp.
	ERSandstoneDatabase initialize.
	ESUGSetUp start
]

{ #category : #running }
ERTest >> tearDown [
	ERAttendee
		do: [ :each | 
			[ each delete ]
				on: Error
				do: [  ] ].
	ERAttendee coolDown.
	ERAward
		do: [ :each | 
			[ each delete ]
				on: Error
				do: [  ] ].
	ERAward coolDown.	
	ERFee
		do: [ :each | 
			[ each delete ]
				on: Error
				do: [  ] ].
	ERFee coolDown.
	ERGroup
		do: [ :each | 
			[ each delete ]
				on: Error
				do: [  ] ].
	ERGroup coolDown.
	ERReductionTicket
		do: [ :each | 
			[ each delete ]
				on: Error
				do: [  ] ].
	ERReductionTicket coolDown.
	ERTalk
		do: [ :each | 
			[ each delete ]
				on: Error
				do: [  ] ].
	ERTalk coolDown.
	ERUserAccount
		do: [ :each | 
			[ each delete ]
				on: Error
				do: [  ] ].
	ERUserAccount coolDown.
	ERConference
		do: [ :each | 
			[ each delete ]
				on: Error
				do: [  ] ].
	ERConference coolDown.
	ESUGSetUp stop.
	Smalltalk garbageCollectMost
]

{ #category : #'as yet unclassified' }
ERTest >> validCoupon [
	^ ERController new conference reductionTickets first ticketId
]