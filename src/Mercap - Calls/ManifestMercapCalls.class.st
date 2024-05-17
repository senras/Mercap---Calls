"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMercapCalls,
	#superclass : #PackageManifest,
	#category : #'Mercap - Calls-Manifest'
}

{ #category : #'code-critics' }
ManifestMercapCalls class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#LocalCall)) #'2024-05-15T17:00:34.903-03:00') )
]
