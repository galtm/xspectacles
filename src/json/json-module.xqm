xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:json";

declare namespace xs = "http://www.w3.org/2001/XMLSchema";

(:
  Sample code for "6 Tips for Embedding JSON in XSpec Tests"
  https://medium.com/@xspectacles/6-tips-for-embedding-json-in-xspec-tests-97306ae5578f
:)

declare function mf:json-output() as xs:string {
  let $json1 := '{"e": 1,"f": true}'
  let $json2 := '{"a": ["b","c"],"d": ' || $json1 || '}'
  return $json2
};

declare function mf:json-in-element() as element(script) {
  <script>{ mf:json-output() }</script>
};

(: Return 'a' property of input JSON string :)
declare function mf:json-input($json as xs:string) {
  (parse-json($json))?a
};

(: Copyright © 2024 by Amanda Galtman. :)