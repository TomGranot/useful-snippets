## Base-64 Ecnoded Image Flags, in JSON

I took all 255 country flags in SVG format from https://github.com/madebybowtie/FlagKit/blob/master/LICENSE, base64-encoded them (without the newlines, i.e. `base64 -w 0`) and put them in a contry-code keyed JSON object that can be pulled from JavaScript.
Good if you're trying to get flag images uploaded using the Shopify Asset API as part of your Shopify theme/app building. 

**Note:** This is MIT-licensed! Reproduce license everywhere.

