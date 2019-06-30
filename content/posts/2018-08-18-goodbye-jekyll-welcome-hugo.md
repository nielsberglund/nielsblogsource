---
type: post
layout: "post"
title: Goodbye Jekyll, Welcome Hugo!
author: nielsb
date: 2018-08-18T05:03:30+02:00
comments: true
highlight: true
draft: false
categories:
  - blogging
tags:
  - Jekyll
  - Hugo
  - static site generators
description: A post about my switch from Jekyll to Hugo as blog site generator.
keywords:
  - Jekyll
  - Hugo
  - static site generators   
---

Back in 2013 I wrote a [post][1] about how I moved from a self hosted **WordPress** blog to a static blog; [**OctoPress**][2]. OctoPress spoke to my "geeky" side, as the foundation of it is the static blog-generator [**Jekyll**][3], which in turn is Ruby based. In fact, OctoPress is more or less just some extra Ruby plugins on top of Jekyll, and to generate sites with OctoPress / Ruby you need Ruby installed on you machine. 

I thought that by changing the blog platform, I might write more posts just due to the "geekiness" of the blog engine. Fast forward to the end of 2016, and the number of posts I had written since the switch came to a grand total of three. Those three includes the post where I announced the switch. Yeah, switching increased indeed my productivity - NOT!

So what does this have to do with anything?

<!--more-->

Before I get into the reason for this post, let us look at what a static site generator is.

## Static Site

A static site generator is a framework that takes source files and generates an entirely static website. We deploy the files that make up the site to the web server, and when a user requests a page, the web server returns that page to the user. This opposed to something like WordPress, where WordPress builds the page from a number of templates, gets the content and other site data from the database and sends the complete HTML page back to the user.

The advantages of a static site are that it is usually less complicated than a dynamic site; no templates, no database and so forth. Quite often serving a page to the user is better performing as the page is not dynamically created.

The downside of a static site is that you build it for each time you do a change to a page, adding a post, and so on, and depending on the size of your site (number of pages etc.), the build can take a while. So that is where my problem lies and the reason for this post.

## Problem

I mentioned above how I didn't manage to write any blog posts up to the end of 2016. Since then, however, I have been reasonably productive in my writing - and managed at least one post per week. It helps when you have cool stuff like **SQL Server Machine Learning Services** to write about. While it is cool that I produce posts, what I noticed was that the build time of the site took longer and longer. I did not think much about it until a couple of weeks ago when I had just finished the [sp_execute_external_script and SQL Compute Context - III][ctx3] post and tried to generate the site. It did not work; it just hung, what to do?

I ended up removing all OctoPress plugins and edited all files that referenced the plugins, to be able to run a bare-bones Jekyll generated site. I eventually managed to get it to work again, but this made me look around for other site generators. 

## Hugo

In my looking around for static site generators I came across [Hugo][5]. Like Jekyll it is an open source static site generator, but it is built on [**Go**][6] instead of Ruby. One of the differences between Hugo and Jekyll is that when you generate a site with Jekyll you execute Ruby commands, and, as I mentioned above, you need Ruby installed. Hugo, on the other hand, comes as an executable `Hugo.exe` and you do not need Go installed at all. That Hugo is a self contained executable is a big plus in my book, since I have had versioning issues with Ruby a couple of times.

The most significant difference between Jekyll and Hugo though is speed when generating a site, or at least that is what the Hugo website says: "*The world’s fastest framework for building websites*". 

With the above points in mind, I decided to try and convert this blog from Jekyll to Hugo.

## Blog Conversion

So, I spent a couple of hours a day for around a week converting my posts and pages to Hugo, and it was not that difficult. The biggest issue was how Jekyll refers to posts: `{% post_url 2018-08-04-sp-execute-external-script-and-sql-compute-context---iii %}` versus `{{< relref "2018-08-04-sp-execute-external-script-and-sql-compute-context---iii.markdown" >}}`, and I had a lot of those. I eventually wrote a small `C#` console application that trawled through the posts and did the conversion. Apart from that everything is pretty straightforward. Obviously there are differences, but nothing earthshattering, as far as I can tell.

What about the speed then? Well, to build the Jekyll site took around 20 seconds, to build the site using Hugo takes around 2 seconds! Based on this, I decided to switch to Hugo, and this is the first post that I publish using Hugo as blog site generator. I hope I have not missed anything and that all is Ok. If not, well then, hopefully, you, my readers, [tell me][ma] if you notice something amiss.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com


[1]: {{< relref "2013-10-02-moving-to-a-new-blog-engine.markdown" >}}
[2]: http://octopress.org
[3]: https://jekyllrb.com/
[4]: https://learn.cloudcannon.com/jekyll/why-use-a-static-site-generator/ 
[5]: https://gohugo.io/
[6]: https://golang.org/

[ctx3]: {{< relref "2018-08-04-sp-execute-external-script-and-sql-compute-context---iii.markdown" >}}
