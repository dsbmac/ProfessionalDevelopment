#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import webapp2


routes = [ ('/cs253/unit3/ascii_chan', 'apps.ascii chan.ascii_chan.MainPage'),
           ('/cs253/unit3/blog/(\d+)', 'apps.blog.handlers.Permalink'),
           ('/cs253/unit3/blog/newpost', 'apps.blog.handlers.NewPost'),
           ]

config = {}

app = webapp2.WSGIApplication(routes=routes, debug=True, config=config) 
