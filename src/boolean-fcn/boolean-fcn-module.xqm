xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:boolean-fcn";

declare namespace xs = "http://www.w3.org/2001/XMLSchema";

(:
    Sample code for "Testing Boolean-Valued Functions"
    https://medium.com/@xspectacles/testing-boolean-valued-functions-xspec-blooper-4c27b2055f0b
:)

declare function mf:is-pos($int as xs:integer) as xs:boolean {
    $int gt 0    
};

(: Copyright © 2023 by Amanda Galtman. :)