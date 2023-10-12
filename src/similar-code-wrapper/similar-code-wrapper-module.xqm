xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:similar-code-wrapper";

declare namespace db = "http://docbook.org/ns/docbook";
declare namespace h = "http://www.w3.org/1999/xhtml";
declare namespace xlink = "http://www.w3.org/1999/xlink";
declare namespace xs = "http://www.w3.org/2001/XMLSchema";

(:
  Sample code for "Testing a Thin-Wrapper XSLT Template Without Excessive Repetition"
  https://medium.com/@xspectacles/testing-a-thin-wrapper-xslt-template-without-excessive-repetition-e41d70ecaf19
:)

(: Thin wrapper around mf:link-element function :)
declare function mf:emphasis($node as element(db:emphasis)) as element(h:em) {
  <h:em>{ mf:link-element($node) }</h:em>
};

(: In reality, link resolution is complicated.
  For this example, simply output a sample link. :)
declare function mf:link-element($node as element(db:emphasis)) as element(h:a) {
  <h:a href="some-path/{$node/@xlink:href}#some-anchor">some text</h:a>
};

(: Copyright © 2023 by Amanda Galtman. :)