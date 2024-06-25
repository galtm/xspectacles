xquery version "3.1";
module namespace f = "urn:x-xspectacles:functions:catch-error";

(:
  Sample Code for "How to Test Error Handling in XSpec"
  https://medium.com/@xspectacles/how-to-test-error-handling-in-xspec-cdd83f498204
:)

declare function f:one-over(
$n as xs:numeric
) as xs:numeric {
  if ($n eq 0)
  then
    error((), concat('one-over() does not support n=', $n))
  else
    1 div $n
};

(: Copyright © 2024 by Amanda Galtman. :)
