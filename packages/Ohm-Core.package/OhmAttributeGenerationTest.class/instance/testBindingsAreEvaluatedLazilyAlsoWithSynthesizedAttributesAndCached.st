testing
testBindingsAreEvaluatedLazilyAlsoWithSynthesizedAttributesAndCached

	| g action result |
	g := OhmGrammar new: 'G {
          foo = bar baz
          bar = "a"
          baz = "b" }'.

	action := g synthesizedAttribute: OhmAttributeGenerationTestSimpleSynthesizedAttribute new.

	result := action value: (g match: 'ab' startingFrom: 'foo').
	self assert: (result first) equals: 1.
	self assert: (result second) equals: 0.
	self assert: (result third) equals: 1.