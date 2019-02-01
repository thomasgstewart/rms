/***

Title
======

__fussydrop__ -- a helper function to drop only those variables that exactly match the variable name.

Syntax
------

__syntax__ varname

- - -

Required:

>    __varname__ : a variable name

- - -

Description
-----------

__fussydrop__ will drop only drop those variables that exactly match the variable name.  This function was written by NJ Cox in response to a question on the STATA help list [here](http://www.stata.com/statalist/archive/2002-08/msg00184.html).  I use this function often within the __rms__ family of commands which is why it is included in the package.

***/


*capture program drop fussydrop
program def fussydrop
*! NJC 1.1.0 9 August 2002
//http://www.stata.com/statalist/archive/2002-08/msg00184.html
 	version 7
 	syntax varname
 	args myvar
 	if "`varlist'" == "`myvar'" { drop `myvar' }
end
