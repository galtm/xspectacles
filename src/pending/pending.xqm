xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:pending";

(:
  Sample code for 'Saying "Not Yet" in XSpec'
  https://medium.com/@xspectacles/saying-not-yet-in-xspec-759dff9ed50d
:)

declare function mf:myfunc(
  $arg as node()
) as node() {
  $arg
};

(: Copyright © 2024 by Amanda Galtman. :)