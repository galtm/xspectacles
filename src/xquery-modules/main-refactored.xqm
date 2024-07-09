(:
  Sample code for "XQuery Makeover to Improve Testability with XSpec" section
  https://medium.com/@xspectacles/xquery-makeover-to-improve-testability-with-xspec-dfd36432c3c7
:)

xquery version "3.1";
import module namespace f = "urn:x-xspec-book:functions:xquery-modules"
at "library.xqm";
declare namespace output =
"http://www.w3.org/2010/xslt-xquery-serialization";
declare context item as document-node() external := document {
  <root>
    <num>1000</num>
    <num>5000</num>
    <num>500</num>
    <num>2000.75</num>
  </root>
};
declare variable $min as xs:integer external := 1000;
declare option output:method "text";

(: Query body :)
f:filter-round(., $min)

(: Copyright © 2024 by Amanda Galtman. :)
