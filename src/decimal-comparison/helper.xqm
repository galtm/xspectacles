xquery version "3.1";
module namespace hf = "urn:x-xspectacles:functions:helper:decimal-comparison";

(:
  Sample Code for "Decimal Number Comparison in XSpec"
  https://medium.com/@xspectacles/decimal-number-comparison-in-xspec-86f3246f542b
:)

declare function hf:compare-with-tolerance-text(
$a as xs:numeric,
$b as xs:numeric,
$tolerance as xs:numeric
) as text() {
  let $abs-diff := abs($a - $b)
  return
    if ($abs-diff < $tolerance)
    then
      text {'Within tolerance'}
    else
      text {
        string-join(
        (
        'Absolute difference: ' || $abs-diff,
        'Exceeds tolerance by: ' || $abs-diff - $tolerance
        ),'&#10;')
      }
};

declare function hf:compare-with-tolerance-map(
$a as xs:numeric,
$b as xs:numeric,
$tolerance as xs:numeric
) as map(*) {
  let $abs-diff := abs($a - $b)
  return
    if ($abs-diff < $tolerance)
    then
      map {'result': 'Within tolerance'}
    else
      map {
        'absolute-difference': $abs-diff,
        'exceeds-tolerance-by': $abs-diff - $tolerance
      }
};

(: Copyright © 2025 by Amanda Galtman. :)
