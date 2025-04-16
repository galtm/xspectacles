xquery version "3.1";
module namespace f = "urn:x-xspectacles:functions:namespaces-xquery";

(:
  Sample Code for "Where to Put Namespace Declarations in XSpec Tests"
  https://medium.com/@xspectacles/where-to-put-namespace-declarations-in-xspec-tests-e98c2852575b
:)

declare function f:do-something() as element(some-element) {
  <some-element/>
};

(: Copyright © 2025 by Amanda Galtman. :)