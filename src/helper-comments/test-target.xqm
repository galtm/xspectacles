xquery version "3.1";
module namespace rpt = "urn:x-xspectacles:functions:report";

(:
  Sample Code for "Ignoring Code Comments During XSpec Testing"
  https://medium.com/@xspectacles/ignoring-code-comments-during-xspec-testing-a460f35a25bb
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