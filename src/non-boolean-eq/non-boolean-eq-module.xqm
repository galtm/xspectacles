xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:non-boolean-eq";

declare namespace xs = "http://www.w3.org/2001/XMLSchema";

(:
  Sample Code for "The Equality Check that's Neither True Nor False"
  https://medium.com/@xspectacles/the-equality-check-thats-neither-true-nor-false-c32a8d0de760
:)

declare function mf:stub() as element(some-result-element) {
  <some-result-element/>
};

declare function mf:stub($idvalue as xs:string) as element(some-result-element) {
  <some-result-element id="{$idvalue}"/>
};

(: Copyright © 2023 by Amanda Galtman. :)