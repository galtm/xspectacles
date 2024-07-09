(:
  Sample code for "XQuery Makeover to Improve Testability with XSpec" section
  https://medium.com/@xspectacles/xquery-makeover-to-improve-testability-with-xspec-dfd36432c3c7
:)

xquery version "3.1";
module namespace f = "urn:x-xspec-book:functions:xquery-modules";
declare decimal-format spaced grouping-separator = " ";

declare function f:filter-round(
$context as document-node(),
$min as xs:integer
) as xs:string* {
for $n in $context//num/number()[. ge $min]
return
  format-number($n, '### ###', 'spaced')
};

(: Copyright © 2024 by Amanda Galtman. :)
