xquery version "3.1";
module namespace mytest = "urn:x-xspectacles:basex:relaxng";

(:
  Sample Code for "Testing a RELAX NG Schema Using XSpec"
  https://medium.com/@xspectacles/testing-a-relax-ng-schema-using-xspec-f238df8bd103
:)
declare variable $mytest:rng-schema as xs:string :=
  'palette-schema.rnc';

declare %unit:test function mytest:valid-doc() {
  let $s as document-node() := doc('document-valid.xml')
  let $val as element(report) :=
    validate:rng-report($s, $mytest:rng-schema, true())
  return unit:assert-equals($val/status/string(), 'valid', $val)
};

declare %unit:test function mytest:invalid-doc() {
  let $s as document-node() := doc('document-invalid.xml')
  let $val as element(report) :=
    validate:rng-report($s, $mytest:rng-schema, true())
  let $actual-error-strings as xs:string+ :=
    $val/message/string()
  let $expected-string1 as xs:string :=
    'element "color" missing required attribute "red"'
  let $expected-string2 as xs:string :=
    'element "name" not allowed here; expected the element end-tag'
  let $expected-string2-partial as xs:string :=
    'element "name" not allowed here'
  return (
    unit:assert-equals($val/status/string(), 'invalid', $val),
    unit:assert($actual-error-strings = $expected-string1, $val),
    unit:assert(some $s in $actual-error-strings satisfies
      contains($s, $expected-string2-partial), $val)
  )
};

(: Copyright © 2024 by Amanda Galtman. :)