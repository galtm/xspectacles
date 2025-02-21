xquery version "1.0";
module namespace f = "urn:x-xspectacles:functions:decimal-comparison";

(:
  Sample Code for "Decimal Number Comparison in XSpec"
  https://medium.com/@xspectacles/decimal-number-comparison-in-xspec-86f3246f542b
:)

declare function f:slope(
$P as xs:decimal+,
$Q as xs:decimal+
) as xs:decimal {
  ($P[2] - $Q[2]) div ($P[1] - $Q[1])
};

(: Copyright © 2025 by Amanda Galtman. :)
