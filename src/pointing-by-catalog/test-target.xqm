xquery version "1.0";
module namespace f = "urn:x-xspectacles:functions:pointing-by-catalog";

(:
  Sample code for "Portable and Importable File References in XSpec"
  https://medium.com/@xspectacles/portable-and-importable-file-references-in-xspec-c2aa0adc50fc
:)

declare function f:output-some-xml() as element(created) {
  <created>2025-03-21</created>
};

declare function f:output-some-text() as text() {
  text {'Created 2025-03-21'}
};

declare function f:output-some-json() as map(*) {
  map {'created': '2025-03-21'}
};

(: Copyright © 2025 by Amanda Galtman. :)
