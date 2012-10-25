Goospell
========

Goospell uses the undocumented google spell checking api at https://www.google.com/tbproxy/spell

Installation
------------

Add this line to your application's Gemfile:

    gem 'goospell'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install goospell

Usage
-----

    Goospell::spell('Thas sentnince iss spellleded awell rong')
    #{"Thas"=>["This", "Th as", "Th-as", "Thais", "Thaws", "Thad"], "sentnince"=>["sentence", "sentience", "sentences", "sentencing", "sentience's"], "iss"=>["is", "Isa", "Issi", "Issy", "OSS", "USS"], "spellleded"=>["spelled", "pelleted", "spilled", "superseded", "secluded"], "awell"=>["a well", "aw ell", "aw-ell", "awe ll", "awe-ll", "Ewell"], "rong"=>["Ring", "ring", "tong", "wrong", "Rog"]}

Prerequisites
-------------
 * uri
 * net
 * rexml

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


References
----------
* [Domain7](http://www.domain7.com)

Released under the GPLv3 license

Copyright (c) 2012 [Domain7](http://www.domain7.com)
