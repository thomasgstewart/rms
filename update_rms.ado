/***

Title
======

__update_rms__ -- Update RMS without using the Github API.

Syntax
------

__update_rms__

- - -

Description
-----------

__update_rms__ will update RMS without using the Github API.

Example(s)
----------
update_rms

***/

*capture program drop update_rms
program update_rms
net install rms, replace from("https://raw.githubusercontent.com/thomasgstewart/rms/master")
end
