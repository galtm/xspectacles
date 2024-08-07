xquery version "4.0";
module namespace gr = "urn:x-xspectacles:functions:ixml";

(:
  Sample Code for "Testing Invisible XML using XSpec"
  https://medium.com/@xspectacles/testing-invisible-xml-using-xspec-e2b11b24b486
:)

declare variable $gr:parser as function(*) :=
unparsed-text('my-ixml-grammar.txt') => invisible-xml();

(: Copyright © 2024 by Amanda Galtman. :)