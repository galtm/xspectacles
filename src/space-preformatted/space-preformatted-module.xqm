xquery version "3.1";
module namespace my-xq = "urn:x-xspectacles:xquery:modules";

(:
    Sample code for "Testing Preformatted or Codelike Text in XSpec"
    https://medium.com/@xspectacles/testing-preformatted-or-codelike-text-in-xspec-ee0fa8e8bee8
:)

declare function my-xq:main($ul as document-node(element(ul))) {
    <md>{my-xq:ul($ul/ul)}</md>
};

declare function my-xq:ul($ul as element(ul)) as text() {
    text { '&#10;' || my-xq:li($ul/li) }
};

declare function my-xq:li($li as element(li)+) as text() {
    let $strings :=
        for $item in $li
        return
        '&#10;* ' || my-xq:li-content($item/node())
    return
    text { string-join($strings,'') }
};

(: For simplicity, use string contents only. :)
declare function my-xq:li-content($nodes as node()+) as xs:string+ {
    $nodes/string()
};

(: Copyright © 2023 by Amanda Galtman. :)