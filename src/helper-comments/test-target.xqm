xquery version "1.0";
module namespace rpt = "urn:x-xspectacles:functions:report";

(:
  Sample Code for "Ignoring Code Comments During XSpec Testing, Part 2"
  https://medium.com/@xspectacles/ignoring-code-comments-during-xspec-testing-part-2-8266ee8ceccc
:)

declare function rpt:report(
$input as node()
) as element(report) {
  let $boilerplate-comment as comment() :=
  comment {'Report about data'}
  return
    <report>{
        (
        $input/descendant::comment(),
        $boilerplate-comment
        )[1]
      }
      <report-item>Sum: {sum($input//data/number())}</report-item>
      <report-item>Mean: {avg($input//data/number())}</report-item>
    </report>
};

(: Copyright © 2024 by Amanda Galtman. :)