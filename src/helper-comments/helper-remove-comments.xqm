xquery version "1.0";
module namespace frc = "urn:x-xspectacles:functions:helper:remove-comments";

(:
  Sample Code for "Ignoring Code Comments During XSpec Testing, Part 2"
  https://medium.com/@xspectacles/ignoring-code-comments-during-xspec-testing-part-2-8266ee8ceccc
:)

declare variable $frc:prefix as xs:string := 'TEST NOTE:';

(:
Remove certain comments from $node, assumed to be an element,
document node, or empty sequence. The comments to remove are those
whose space-normalized content starts with 'TEST NOTE:'.
:)
declare function frc:remove-comments(
$node as node()?
) as node()? {
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

(: Discard comment nodes that start with specified prefix. :)
declare function frc:comment-handler(
$node as comment()
) as comment()? {
  if (starts-with(normalize-space($node), $frc:prefix))
  then
    ()
  else
    $node
};

(: Create document node and process children. :)
declare function frc:doc-node-handler(
$node as document-node()
) as document-node() {
  document {
    for $child in $node/node()
    return
      frc:remove-comments($child)
  }
};

(: Create element wrapper and process children. :)
declare function frc:element-handler(
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

(: Copyright © 2024 by Amanda Galtman. :)
