package gohelpers

// Copyright 2022 mikeee
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import (
	"context"
	"regexp"

	"github.com/chromedp/cdproto/dom"
	"github.com/chromedp/chromedp"
)

func RegexMatch(url string, matchString string, matchIndex int) (rawRegex string, err error) {
	ctx, cancel := chromedp.NewContext(context.Background())
	defer cancel()

	var res string

	err = chromedp.Run(
		ctx,
		chromedp.Navigate(url),
		chromedp.ActionFunc(
			func(ctx context.Context) error {
				node, err := dom.GetDocument().Do(ctx)
				if err == nil {
					res, err = dom.GetOuterHTML().WithNodeID(node.NodeID).Do(ctx)
				}
				return err
			}),
	)

	if err == nil {
		re := regexp.MustCompile(matchString)

		rawRegex = re.FindStringSubmatch(res)[matchIndex]

		return
	}

	return "", err
}
