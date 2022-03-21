
# CSI 3540 Lab 08

This lab provides a jumping off point for creating AJAX calls between an website and a web service.

We have stripped the functionality down to the bare bones so that you can focus on the underlying technologies (namely XMLHttpRequest) directly.

## Requirements

This requires at least PHP 5.4+, and has been tested with PHP 7.4.  The scripts located in `./bin` have only been tested on a Mac OS X (using BASH).  They should work on any linux distribution as well.  For a Windows machine, you will need to translate or run an emulated environment.

## Setup

To the start the server.

```
./bin/server
```

That will launch the application and make it available at:

```
http://localhost:4000
```

When you launch your browser you should see the message

```
Lab08 API v1.1
```

If you only see 

```
Loading ...
```

Then *Inspect* the network communication in your browser to look for any errors with the AJAX call back to the server.

## Code

### public/index.php

This is your web application.  At present it shows little more than `Loading ...` and makes a sample REST
call to the API to retrieve and present the version on the page

### public/api.php

This is a simple server where you will write your REST API functions, everything will flow through `api.php` (so not properly names resource endpoints), but otherwise please follow the REST conventions for HTTP Verbs and Status Codes

### public/assets

All client side assets go here.  Namely 

* `public/assets/styles.css` for any styling you wish to do.
* `public/assets/library.js` for your javascript functions
* `public/assets/events.js` for your page events (onclick, onchange, etc)

