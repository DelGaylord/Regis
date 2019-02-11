Class {
	#name : #ERGroupRegistrationSummaryTab,
	#superclass : #ERGroupRegistrationTab,
	#category : #'ESUGApp-View-Tab'
}

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> initializeModifyAffiliationForm [
	formMofidyAffiliation := (ERTittledFormView on: controller groupManager affiliationInformation 
								withContent: content) title: 'Affiliation Information';
								callback: [:aff | self updateAffiliation: aff];
								cancelCallback: [self cancel]; initializeForm. 
	content state: formMofidyAffiliation.
	self updateStateTab: self tabName.
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> initializePaymentForm [
	^ ( ERPaymentGroupManagerView on: self group
		withContent: content) 
	updatePayment: [ self payForGroup ];
	cancel: [ self returnToThePreviousState .
		self updateStateTab: self tabName. ];
	amountString:
	(ERController new amountOfPayToGroup: self attends) asString.

]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> modifyAffiliation [
	self initializeModifyAffiliationForm .
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> pay [
	|formUpdatePayment|
	formUpdatePayment := self initializePaymentForm.
	content state: formUpdatePayment.
	self updateStateTab: self tabName.
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> payForGroup [
	|group|
	group := self group.
	controller updateGroup: group.
	group paymentInformation  paymentTypeIsBankTransfer
		ifTrue: [ ^ self redirectViewForBankTransfer ].
	group paymentInformation paymentTypeIsCreditCard
		ifTrue: [ ^ self redirectionPayPAL ]
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> paymentStatus [
	| listAttends |
	listAttends := self attends.
	listAttends isEmpty
		ifTrue: [ ^ 'No status available. The group has no members ' ]
		ifFalse: [ 
	(controller allAttendeesHasPaid: self group )
	ifTrue: [ ^ 'Payment successfully received.' ]
	ifFalse: [ ^ 'Payment no registered yet. Amount due: '
			, (ERController new amountOfPayToGroup: listAttends) asString , ' ', 
			'(s) (NOTE: you could have paid but we could have not registered it yet)' ]].
		
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> redirectViewForBankTransfer [
	| bankTransferView |
	bankTransferView := ERBankTransferPaymentInfoView
		on: self group
		withContent: content.
	content state: bankTransferView 
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> redirectionPayPAL [
	| url |
	url := ERController new payPalUrlForGroup: self group.
	self requestContext redirectTo: url
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderButtons: html [
	self renderModifyAffiliationButtonOn: html.
	self renderRegisterAttendeeButtonOn: html.
	self renderPayButtonOn: html.
	self renderGenerateInvoiceButtonOn: html.
	self renderDownloadInvoiceButtonOn: html.
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderContainer: html [
	html horizontalRule.
	self renderOrganizationName: html.
	self renderPaymentStatus: html.
	self renderFormButtons: html
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderDownloadInvoiceButtonOn: html [
	| downloadButton |
	downloadButton := html mdlAnchorButton raised; rippleEffect;
		id: 'download';
		disabled: ((controller allAttendeesHasPaid: self group ) and: [ self group encodedInvoice isNotNil ]) not.
	downloadButton isDisabled ifFalse: [ 
		downloadButton url: ('data:text/pdf;base64,', (self group encodedInvoice ifNil: [ '' ]));
		attributeAt: 'download' put: 'RegistrationInvoice_', self group id, '.pdf'].
	downloadButton with: 'Download Invoice'.
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderFormButtons: html [
	self renderButtons: html
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderGenerateInvoiceButtonOn: html [
	html mdlAnchorButton 
        raised;
        rippleEffect;
        id: 'generateInvoice';
        callback: [ self generateInvoiceGroup: self group ];
        with: 'Generate Invoice'
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderModifyAffiliationButtonOn: html [
	html mdlAnchorButton 
		raised;
		rippleEffect;
		id: 'modifyAffiliation';
		callback: [ self modifyAffiliation ];
		with: 'Modify Affiliation'
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderOrganizationName: html [
	html
		paragraph: [ html strong: 'Organization Name: '.
			html text: (self groupManager affiliationInformation organizationName) ]."
	self createTextStrong: 'Organization Name: ' with: #orgName on: html"
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderPayButtonOn: html [
	html mdlAnchorButton 
		raised;
		rippleEffect;
		id: 'pay';
		callback: [ self pay ];
		with: 'Pay'
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderPaymentStatus: html [
	html
		paragraph: [ html strong: 'Payment Status: '.
			html text: self paymentStatus ]
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> renderRegisterAttendeeButtonOn: html [
	html mdlAnchorButton 
		raised;
		rippleEffect;
		id: 'registerAttendee';
		callback: [ self registerAttendee ];
		with: 'Register Attendee'
]

{ #category : #accessing }
ERGroupRegistrationSummaryTab >> tabId [
	^ 'summary'
]

{ #category : #accessing }
ERGroupRegistrationSummaryTab >> tabName [
	^ 'Summary'
]

{ #category : #accessing }
ERGroupRegistrationSummaryTab >> title [
	^ 'Group Manager Short Description'
]

{ #category : #rendering }
ERGroupRegistrationSummaryTab >> updateAffiliation: aff [
	controller groupManager affiliationInformation: aff.
	controller group save.
	self cancel.
]