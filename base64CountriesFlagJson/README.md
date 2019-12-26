## Base-64 Ecnoded Image Flags, in JSON

I took all 255 country flags in SVG format from https://github.com/madebybowtie/FlagKit/blob/master/LICENSE, base64-encoded them (without the newlines, i.e. `base64 -w 0`) and put them in a country-code keyed JSON object.
Good if you're trying to get flag images uploaded to a Shopify theme using the [Shopify Asset API](https://help.shopify.com/en/api/reference/online-store/asset#update-2019-10), as part of building a Shopify app/theme.

**Note:** This is MIT-licensed! Reproduce license everywhere.

