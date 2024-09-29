xquery version "3.1";
module namespace frc = "urn:x-xspectacles:functions:helper:remove-comments";

(:
  Sample Code for "Ignoring Code Comments During XSpec Testing"
  https://medium.com/@xspectacles/ignoring-code-comments-during-xspec-testing-a460f35a25bb
:)

declare variable $frc:prefix as xs:string := 'TEST NOTE:';
(:
Removes certain comments from $node, assumed to be an element,
document node, or empty sequence. The comments to remove are those
whose space-normalized content starts with 'TEST NOTE:'.
:)
declare %public function frc:remove-comments(
$node as node()?
) {
  typeswitch ($node)
    case comment()
      return
        frc:comment-handler($node)
    case document-node()
      return
        frc:doc-node-handler($node)
    case element()
      return
        frc:element-handler($node)
    default
      return
        $node
};

declare %private function frc:element-handler(
$node as element()
) as element() {
  element {node-name($node)} {
    for $n in in-scope-prefixes($node)
    return
      namespace {$n} {namespace-uri-for-prefix($n, $node)},
    $node/@*,
    for $child in $node/node()
    return
      frc:remove-comments($child)
  }
};

declare %private function frc:doc-node-handler(
$node as document-node()
) as document-node() {
  document {
    for $child in $node/node()
    return
      frc:remove-comments($child)
  }
};

declare %private function frc:comment-handler(
$node as comment()
) as comment()? {
  if (starts-with(normalize-space($node), $frc:prefix))
  then
    ()
  else
    $node
};

(: Copyright © 2024 by Amanda Galtman. :)