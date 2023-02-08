package gohelpers

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestRegexMatch(t *testing.T) {
	url := "https://www.google.co.uk/"
	regexStr := "Google\\sSearch"
	matchIndex := 0
	
	rawRegex, err := RegexMatch(url, regexStr, matchIndex)
	if err != nil {
		t.Fatalf("error running RegexMatch: %s", err)
	}
	expectedResult := "Google Search"
	assert.Equal(t, expectedResult, rawRegex)
}
