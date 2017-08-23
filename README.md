# Makers Academy Skeleton

[ ![Codeship Status for makersacademy/website](https://codeship.com/projects/393106b0-8d52-0134-481b-5a2b4a15ac25/status?branch=master)](https://codeship.com/projects/184953)

A skelton structure for scaffolding new Makers Academy websites.

## Setting up the site locally

* Clone the repo
* Run `bundle` to install gems
* Run `npm install` to install node packages
* Create a **.env** file - you can copy the [.env.example file](https://github.com/makersacademy/site-mvp/blob/master/.env.example) provided as an example to get you started
* Start the server with `middleman s`
* Go to __http://localhost:4567__ to view the site in your browser

## Running tests

* You'll need to run Ruby tests using `bundle exec rspec` rather than just `rspec`
* JS is tested using jasmine_node - run `npm test` to run them

## Deploying

* Make sure you have submitted a pull request and had it approved by another engineer.
* Merge the pull request into master
* Once our [CI server](https://codeship.com/projects/184953) has passed the tests, it will automatically deploy to Github Pages by using the `rake publish` command provided by the [Middleman GitHub pages extension](https://github.com/neo/middleman-gh-pages). This builds a Middleman site and pushes the built repo onto a gh-pages branch.

##### Alternative deployment

There is an interactive script for deployment as well. To use it, run `rake publish:domain` and follow the instructions. You will need to have various things set up already; check the `Rakefile` for more information.

## Technologies used

* [Ruby](https://www.ruby-lang.org/en/) as our server side language
* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)/[jQuery](http://jquery.com/) for client side scripts
* [Middleman](https://middlemanapp.com/) for compiling our code into a static website we can host on [GitHub pages](https://pages.github.com/)
* [RSpec](http://rspec.info/) for testing
* [Bower](http://bower.info/) for installing shared assets
* [Sass](http://sass-lang.com/) to help write our CSS
* [Bourbon](http://bourbon.io/)/[Neat](http://neat.bourbon.io/)/[Bitters](http://bitters.bourbon.io/) as a framework for our CSS
* [Typekit](http://typekit.com) for typefaces

## Building pages

Use the components available at `/source/elements` to build new pages using design-compliant blocks. By running `middleman server`, you can visit `http://localhost:4567/elements.html` and view both the rendered component, and its associated copy-pastable code.

## Adding images

Our images are stored on the [makers assets GitHub repo](https://github.com/makersacademy/makers-assets) - we've split them out to a seperate repository to keep the size of this repository down. All assets from that repository can be accessed from http://assets.makersacademy.com.

When adding a new image, add it to the [images directory](https://github.com/makersacademy/makers-assets/tree/gh-pages/images) of the [makers assets GitHub repo](https://github.com/makersacademy/makers-assets), and make sure that the image has been compressed using [image optim](https://imageoptim.com/) and are good quality images that fit the look and feel of the site.

## Using Bower Styles

We use Bower to share our assets across the various Makers Academy websites. Instructions for updating Bower Styles can be found on the [Makers Academy Website repository README](http://github.com/makersacademy/website).

This skeleton should use the latest version of `makers_styles` wherever possible. You can update the Makers Styles version in `bower.json`, and then run `bower install` to upgrade.

You can override Bower Styles locally, inside the `/source/sass` directory. An `overrides.scss` has been provided for that use.

# Segment.io tracking

Look at [`tracking.js`](source/javascripts/tracking.js) to see how to enable Segment.io tracking for websites that use `makers_styles` bower package.

## How to create a form

1. Use [Fridge raiders example](source/fridge-raiders.html.haml) as a form that works and copy over and adapt. Put this code on top of a form.

```haml
%form.trackable-form{action: "/"name of your page"/success.html.haml”}
```

2. Include Javascript tag at the bottom:

```haml
= javascript_include_tag "track-form/save-for-later-submit"
```

3. Create submit page `source/"name of your page"/success.html.haml”`


4. On success page put your copy and include this code, editing the details inside of the submitFormDataToAnalytics function

```haml
=javascript_include_tag "track-form/submit-to-analytics"
:javascript
  function submitFormDataToAnalytics (formData) {
    analytics.alias(formData.email);
    analytics.identify(formData.email, formData)
    analytics.track("Submitted "Name of form" form")
  }
```

# Segment.io tracking

Look at [`tracking.js`](source/javascripts/tracking.js) to see how to enable Segment.io tracking for websites that use `makers_styles` bower package.
