= route_name_for

http://thoughtpropulsion.com

== DESCRIPTION:

Rails helper to look up (named) route name given current request URI. Adds route_name_for method to controllers and views.

== FEATURES/PROBLEMS:

It only finds named routes of course, so sometimes it'll return nothing (if you give a path for which there)
is no named route.

== SYNOPSIS:

If you have routes like this:

map.home '', :controller => 'home'
map.login 'login', :controller => 'home'

You might like to define this helper in your ApplicationController:

def body_class
  route_name_for request.request_uri, {}
end

And then call it from your application layout like this:

<body class='<%=body_class%>'>

So that when you browse to '/login', your page will have:

<body class='login'>…
   
And when you you browse to '' or '/', your page will have:

<body class='home'>…

Then you can match that in your CSS rules with a selector like this:

body.login … { … }

== REQUIREMENTS:

Rails 2.1.0 or later.

Also note: this code is highly dependent upon Rails' implementation of the ActionController::Routing::RouteSet implementation. In particular, the optimization to that class found in recognition_optimisation.rb (sic). The upside of this tight coupling is that this add-on performs as well as Rails native routing. The downside is that Rails may (will) change and this RubyGem will have to track those changes.

== INSTALL:

sudo gem install Bill-route_name_for

See also http://gems.github.com/

== LICENSE:

(The BSD License)

* Copyright (c) 2008, Thought Propulsion
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the Thought Propulsion nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY Thought Propulsion ''AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL Thought Propulsion BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.