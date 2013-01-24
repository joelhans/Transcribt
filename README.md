# [Transcribt](http://designbyjoel.com/transcribt/) #

Transcribt is a very simple web-based transcription tool that helps journalists, writers, podcasters, and anyone else with audio to transcribe get their job done faster and easier.

It has two main features: speed/ease-of-use and privacy.

Transcribt was built and is maintained by [Joel Hans](http://designbyjoel.com). Feel free to make pull requests for bugfixes and additional features.

Try it out at [http://designbyjoel.com/transcribt/](http://designbyjoel.com/transcribt/).

Or, read the [blog post](http://designbyjoel.com/blog/2013-01-24-better-transcribe/).

## Speed ##

Transcribt strongly encourages the use of keyboard shortcuts in order to make transcriptions easier and faster. Press <em>&#60;Control&#62; + /</em> to see them for yourself. By utilizing shortcuts&mdash;and not that pesky mouse&mdash;you can keep your fingers on the keys, right where they need to be.

## Privacy ##

Transcribt is built so that your recording and your transcription never leaves your browser. No data is ever transmitted to Transcribt, which means that your work is as safe and private as your computer and your choice of browser. Use an &ldquo;incognito&rdquo; or &ldquo;private browsing&rdquo; mode for even greater privacy.

## TODO ##

There are a few features I would like to add that are still pending.

* Ability to customize shortcuts (using localStorage to "save" them).
* A "save" button that opens a "Save As" dialog for hard drive safekeeping (if that is even possible).
* HTML5 drag-and-drop option for instancing files.

## Running it locally and/or contributing ##

First, install Middleman.

    gem install middleman

Clone the repository.

    git clone git://github.com/joelhans/Transcribt.git

cd into the repository

    cd Transcribt/

Run Middleman in server mode.

    middleman server

Make your changes. Submit pull request.

## License ##

Transcribt is distributed under the MIT license. See LICENSE file for details.