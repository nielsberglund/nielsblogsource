---
layout: post
title: "Installing Octopress on Windows"
author: nielsb
date: 2013-10-23T09:27:56+02:00
comments: true
categories:
  - Blogging
  - Windows Azure
  - Octopress
tags:
  - Octopress
  - Windows Azure
  - Git
  - GitHub
description: "A post how to install Octopress on Windows"
keywords: "Octopress on Windows, Ruby Windows, Python Windows, WordPress to OctoPress, Hosting Blog on Windows Azure, OctoPress on Windows Azure"
---
In an earlier [post][1], I wrote how I had changed blog-engine from WordPress to [**OctoPress**][op]. At the moment I am running Windows as my main OS (mostly due to work related requirements), and - as OctoPress is very much Ruby and Python based - there are certain things to be aware of when installing this on Windows. Furthermore, my blog is now hosted on **Windows Azure** - so, with all this in mind, I thought I'd put together a blog post about the set-up of OctoPress on Windows, running on Windows Azure.

<!--more-->

## Pre-Reqs
Before you begin the installation there are some pre-req's:

### Git and GitHub
Octopress is a developers blog engine, and central to everything Octopress is **Git**. Make sure you have the latest version of [Git][git] for Windows installed. You also need a **GitHub** account, so if you don't have a GitHub account, you should [sign up][github] for one. While you probably will do most of the Octopress Git and GitHub related tasks from command-line, it will not hurt to have the [GitHub for Windows UI application][github-w] installed as well.

### Ruby
Octopress is built on Ruby, and when you eventually create blog-posts you will execute Ruby commands, so you need to install [Ruby][ruby-w] and the Ruby Development Kit. Octopress seems somewhat "picky" about what Ruby version to use, personally I am running version 1.9.3-p448, and it works fine.

You also need to install the Ruby Development Kit (DevKit) so you can use some of the native C/C++ extensions. Which version to download is dependent on the Ruby version, but I am running 4.5.2, [DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe][dev-kit].

After you have downloaded and installed both Ruby as well as the DevKit, you need to run two installation scripts for the DevKit:

* change to the directory where the devkit is installed, and run: ```ruby dk.rb init```.
* then - still in the same directory - run ```ruby dk.rb install```.

For more information about the installation of Ruby and the DevKit, GitHub has a great [wiki page][wiki]. 

### Python
In addition to Ruby you need Python (this mostly for syntax highlighting). When installing Python, the version is **very** important. Download and install Python 2.7 from [here][py].

Having installed all the above you should now be set for the actual installation of Octopress!!

## Install Octopress 
To install Octopress you need to clone the "original" Octopress repo from GitHub. From command-line you ```cd``` to the directory where you want clone the Octopress repo into, alternatively you create a directory for this and ```cd``` into it. 

In the code below the assumption is that the directory exists and it is named **MyGitHubRepos**. As you can see from the code, after you have changed into that directory you ```clone``` the original Octopress directory into a new directory with a name of your choice. In the example below, the name is ```myoctopressblog```.

```
$ cd MyGitHubRepos
$ git clone git://github.com/imathis/octopress.git myoctopressblog
```

After having cloned the original GitHub repo, you need to install a Ruby bundler. The Bundler maintains a consistent environment for Ruby applications, and you install it into the directory you cloned Octopress into (in the case above: myoctopressblog). BTW, ```gem``` is like a package installer:

```
$ cd .\myoctopressblog
$ gem install bundler
$ bundle install
```

By now your blog is almost 100% complete. What remains is an Octopress theme. For the initial setup, the default theme will do. To install this you run the equivalent of a ```MAKE``` file, a ```rake``` file:

```
$ rake install
```

**Congratulations** you now have an Octopress blog!! If you are curious what it looks like you can now run ```rake``` commands to generate and preview the blog pages:

```
$ rake generate
$ rake preview
```

After you have executed the ```rake preview``` command you can browse to ```localhost:4000``` and see the blog in all its glory. If you did browse to ```localhost:4000```, you can see that you have a very basic blog. By now you definitely want to configure the blog, and maybe also write - at least - a **Hello World** post.

## Configuring Octopress and writing an initial post
The official [Octopress][op] site has very good [documentation][docs] about all things Octopress. So, instead of me re-iterating everything about configuration and using Octopress for blogging, I rather point to the official documentation for [configuration][cfg] and basics about [blogging][blg] with Octopress.

Right, by now you should have  fairly good idea how to use Octopress - it's awesome, right?! But ... hang on a second, we are missing something - right; as awesome it is, the blog is still only on your local machine. So what do we do if we want to host the blog somewhere out on the interwebz?

## Deploying Octopress
In order to get a fully functional blog, we need to host it somewhere, and with Octopress there are some nice and easy ways to deploy and host the blog. As with the secion about configuring the blog, I'll let the official documentation do the talking for some of the ways Octopress can be deployed:

* [GitHub pages][gh-pages]
* [Heroku][hu]
* [Rsync][rs]

In order to publish posts to all of the options above you need to run ```rake generate``` followed by ```rake deploy``` after having written a post(s).

I mentioned up at the top how I was hosting this blog on Windows Azure, how is that done?

## Hosting Octopress on Windows Azure
I initially thought I would host the blog on GitHub pages, and I did set up the blog to be deployed to my GitHub pages. Then, somehow, I thought that maybe I should check out Windows Azure - seeing that I have - through my work at [**Derivco**](/derivco) - an MSDN subscription (Derivco rocks!), and the subscription gives me Windows Azure credits.

So, on to the wisdom of all world (Google), and lo and behold - there were quite a few posts / articles how to link a blog to Windows Azure. Seeing that I already published / deployed to GitHub pages it was extremely easy to push this to Windows Azure:

* Set up a web-site through the Windows Azure portal
* Configure the ```deployments``` to point to the GitHub pages

That's all there is to it. Now after you have run ```rake generate``` and ```rake deploy```, when you commit, the changes will be published to Windows Azure:

```
$ git add .
$ git commit -m "Some message about the commit"
$ git push origin source
```

Oh, I almost forgot - I also needed to point a CNAME for my domain to my website on Windows Azure. But, the whole Windows Azure setup took less than 10 minutes!!






[1]: {{< relref "2013-10-02-moving-to-a-new-blog-engine.markdown" >}}
[op]: http://octopress.org/
[git]: http://git-scm.com/
[github]: https://github.com/
[github-w]: http://windows.github.com/
[ruby-w]: http://rubyinstaller.org/
[dev-kit]: https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe
[wiki]: https://github.com/oneclick/rubyinstaller/wiki/Development-Kit
[py]: http://www.python.org/download/releases/2.7.5/
[docs]: http://octopress.org/docs/
[cfg]: http://octopress.org/docs/configuring/
[blg]: http://octopress.org/docs/blogging/
[gh-pages]: http://octopress.org/docs/deploying/github/
[hu]: http://octopress.org/docs/deploying/heroku/
[rs]: http://octopress.org/docs/deploying/rsync/

