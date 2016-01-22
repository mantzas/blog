+++
categories = ["go", "logging", "logging", "package"]
date = "2016-01-20T00:44:10+02:00"
description = "Releasing new go logging package named adaptlog"
keywords = ["go", "log", "logging", "package"]
title = "Initial release of adaptlog"

+++
### adaptlog, a logging abstraction for go

Almost every application logs data one way or another. There are a plethora of logging packages available for [golang](https://golang.org/).  

* There is the one that comes with the standard packages which takes a simple approach.  
* There are many logging packages that follow the well established leveled approach, and there are really a lot of them.

The decision of choosing a specific library comes with the cost of a direct dependency.
But why should we depend directly on a specific package?
How painful is it to exchange a logging package for another when we already created a lot of code with a direct dependency?  
This is the reason why [apaptlog](https://github.com/mantzas/adaptlog) came to life.  

[apaptlog](https://github.com/mantzas/adaptlog) is just a logging abstraction, which itself does not implement any log related stuff.
A logger has to be provided by the developer using any of the previous mentioned logging packages or any custom implementation.
The developer has to implement only a logging interface (standard or leveled), configure it at application start and use the abstraction throughout the code.
This is hardly something new. There are many libraries in other languages that do exactly this.

[apaptlog](https://github.com/mantzas/adaptlog) is very easy to setup and to use. Follow the sample for the standard logger implementation.
Any ideas or improvements are highly welcome. Enjoy!
