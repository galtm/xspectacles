xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:out-of-scope";

(:
  Sample code for "Content Outside the Selection in XSpec"
  https://medium.com/@xspectacles/content-outside-the-selection-in-xspec-058643f390d5
:)

declare function mf:parent(
  $node as node()
) as node()? {
  $node/parent::node()
};

declare function mf:following-sibling(
  $node as node()
) as node()* {
  $node/following-sibling::node()
};

(: Copyright © 2024 by Amanda Galtman. :)