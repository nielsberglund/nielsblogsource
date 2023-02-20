---
type: post
layout: "post"
title: "Revolutionizing My Blog: Why I Changed my Hugo Theme"
author: nielsb
date: 2023-01-07T12:19:12+02:00
comments: true
highlight: true
draft: false
image: images/banner/posts/blogging.jpg
thumbnail: images/banner/posts/blogging.jpg
tags:
  - hugo
description: A couple of days ago I switched to a new Hugo theme. In this post I look at the reasoning behind that.
---

Revolutionizing in the title of this post may be a bit strong, but I guess that is what you get when you ask [ChatGPT][13] to write you a "catchy" blog post title :smile:.

Anyway, if you have followed my blog for a while (for the last 10 years or so) you know that I have been switching blog engines a couple of times:

* [Moving to a New Blog Engine][1]: Moved from WordPress to OctoPress/Jekyll (2013).
* [Goodbye Jekyll, Welcome Hugo!][2]: From [Jekyll][3] to [Hugo][4] (2018).

As you see from the above timeline it is around 5 years between each move. Seeing that it is now 2023 you may think I am switching blog engine again. Well, I am **NOT** switching engine.

> **NOTE:** Having written the above (not switching), I had to, for sh*t and giggles, browse around to see what engines are out there in 2023 :smile:. I did, however, not find anything that took my liking.

What I am doing, though, is upgrading to the latest Hugo executable and, at the same time, switching the blog theme. This post is like a "Hello World" using the new theme and ensuring everything works.

## Hugo

Hugo is an open-source static site generator written in Go. It is designed to be fast and easy to use, and as I mentioned above, I switched to it in 2018. One of the significant benefits is that even though Hugo is written in Go, the executable with which you build your site(s) is entirely self-contained. In Jekyll, you must have Ruby and some other "stuff" installed on the machine where you build your site.

When I switched to Hugo, the most recent version was [0.46][5]. The theme I used was the [**hyde-hyde**][6] theme, and as I had some specific ideas about how I wanted my blog to look, I customized the theme to a certain degree. To say I customized it makes it sound like I knew what I was doing (I didn't), so the right way to describe it is that I hacked the theme. Below you'll see how this was a mistake.

Anyway, my blog looked like I wanted it to, and everything worked fine. 

## Problems

That is until a couple of months later when I re-formatted my PC (I do it a couple of times a year) and re-installed Hugo. Suddenly I could not build my site anymore, and the errors pointed to some problems with the theme I was using. 

Easily fixed, I thought. I will do a `git pull` against the theme repository, and all should be good. Well, it wasn't! After the `git pull` the good thing was that I did not get any errors. The bad thing was that the site did not show, just an empty page :unamused:!

The problem I experienced was that when I reformatted my PC and reinstalled Hugo, I got the latest version of Hugo. The issue was that breaking changes were introduced between my original version (0.46) and the newest version. Amongst them were changes related to how templates were handled. That is why I originally got errors.

From a theme perspective, the author changed the theme to handle the breaking changes. That's why I didn't get any errors after pulling the latest theme version. The reason for the site not loading was due to the hacks I had done initially.

Realizing this, I decided that to "re-hack" the theme would be too much work, so I decided to go back to the old executable (0.46) and theme. That's how it has been since late 2018/early 2019. I have kept the old executable and theme around and have been happy with the status quo. So what changed?

## MacBook M1

What made me realize I may have to drag my blog into the "modern world" was the purchase of the [MacBook Pro M1][7]. 

![](/images/posts/mbp-box.png)

**Figure 1:** *MacBook Pro*

As you know, the M1 silicone is based on the ARM64 architecture. Even though Hugo runs natively on the M1, there is no ARM64 version of Hugo 0.46. I found out this the hard way a month or so ago when I was in Seattle for the SQL PASS conference and wanted to do a blog post (I couldn't).

This in itself was not that much of a "train smash", but as I most likely will spend more time away from my home PC and still want to publish blog posts, I concluded I need to make some changes.

So, during the holiday, I upgraded to the latest Hugo version (0.109). Part of that change was also to change the theme.

## Hugo Theme

Why did I want to change the theme? There was nothing wrong with the theme (apart from me having "hacked" around in it), but I had seen the theme [Robin Moffat][8] uses, where the theme supported banner/header images, and I quite liked that. That theme is the [**Story**][14] theme. Why I, in the end, didn't go for it was that it is no longer actively maintained.

Apart from the Story theme, I also looked at the following themes:

* [Ananke][9]
* [Clean White][10]

I ended up using the [**Clean White**][10] theme, as it was the least complex theme and gave me almost everything I needed.

## The Setup

I will not go into details how I setup the theme - if I can do it then everyone else can as well :smile:. What I will do however is to share some links:

* [Blog repo][11]
* [Blog config][12]

Speaking of setup. Please let me know if you come across links that are not working etc.

## ~ Finally

If you have comments, questions etc., please comment on this post or [ping][ma] me.

[ma]: mailto:niels.it.berglund@gmail.com
[mp]: https://blog.acolyer.org
[iq]: https://www.infoq.com/
[ew]: http://sqlonice.com/
[re]: http://blog.revolutionanalytics.com
[sqsk]: https://www.sqlskills.com

[1]: {{< relref "2013-10-02-moving-to-a-new-blog-engine.markdown" >}}
[2]: {{< relref "2018-08-18-goodbye-jekyll-welcome-hugo.md" >}} 
[3]: https://jekyllrb.com/
[4]: https://gohugo.io/
[5]: https://github.com/gohugoio/hugo/releases/tag/v0.46
[6]: https://github.com/htr3n/hyde-hyde
[7]: {{< relref "2022-04-03-interesting-stuff---week-13-2022.md" >}}
[8]: https://rmoff.net/
[9]: https://github.com/theNewDynamic/gohugo-theme-ananke
[10]: https://github.com/zhaohuabing/hugo-theme-cleanwhite
[11]: https://github.com/nielsberglund/nielsblogsource
[12]: https://github.com/nielsberglund/nielsblogsource/blob/master/config.toml
[13]: https://chat.openai.com/chat
[14]: https://github.com/xaprb/story
