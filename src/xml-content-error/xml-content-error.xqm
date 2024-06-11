xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:xml-content-error";

(:
  Sample code for "My XML Content in XSpec Causes an Error"
  https://medium.com/@xspectacles/my-xml-content-in-xspec-causes-an-error-90028056d6a0
:)

declare function mf:attr-value($elem as element()) as text() {
  text {$elem/@attr}
};

(: Copyright © 2024 by Amanda Galtman. :)
