xquery version "3.1";
module namespace frc = "urn:x-xspectacles:functions:helper:remove-comments:xquf";

(:
  Sample Code for "XQuery Update Facility Can Simplify XSpec Test Helper Functions"
  https://medium.com/@xspectacles/xquery-update-facility-can-simplify-xspec-test-helper-functions-803a7b362002
:)

(:
  This helper file requires the XQuery processor to support the
  copy modify expression in XQuery Update Facility 1.0. Processors
  with such support include:
    * BaseX
    * Saxon-EE with XQuery Update explicitly enabled (-update:on)
:)
declare variable $frc:prefix as xs:string := 'TEST NOTE:';

(:
Remove certain comments from $node, assumed to be an element or
document node. The comments to remove are those whose
space-normalized content starts with 'TEST NOTE:'.
:)
declare function frc:remove-comments(
$node as node()
) {
  copy $node-copy := $node
    modify delete node $node-copy//comment()
    [starts-with(normalize-space(.), $frc:prefix)]
    return
      $node-copy
};

(: Copyright © 2024 by Amanda Galtman. :)
