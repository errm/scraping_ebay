# Ebay Phone Scraper

This is an example to ilustrate some features of [wombat](https://github.com/felipecsl/wombat) a ruby web scraping gem.

This is clearly a toy example, In real life it would make more sense to use the [Ebay Shopping API](http://developer.ebay.com/Devzone/shopping/docs/Concepts/ShoppingAPIGuide.html)

## Usage

Install the gems:
`bundle install`

Run it:

```
$ bundle exec ruby scraper.rb nokia
The Cheepest nokia
Nokia XpressMusic 5310 - Red (Unlocked) Mobile Phone - £12.50
The Dearest nokia
Nokia Lumia 820 - 8 GB - Black (Orange) Smartphone - £34.00
```

or

```
$ bundle exec ruby scraper.rb iphone
The Cheepest iphone
apple iphone 3 - £26.00
The Dearest iphone
Apple iPhone 5s - 16 GB - Gold (Unlocked) Smartphone - £299.99
```
