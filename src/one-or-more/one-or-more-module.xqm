xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:one-or-more";

declare namespace xs = "http://www.w3.org/2001/XMLSchema";

(:
  Sample code for "One-or-More Ways to Foil Empty-Sequence Surprises in XSpec"
  https://medium.com/@xspectacles/one-or-more-ways-to-foil-empty-sequence-surprises-in-xspec-882e0af459ea
:)

(: To create deliberate XSpec test problems, <x:expect>
  uses ul-style instead of style-ul. :)
declare function mf:create-list() as element() {
  <div class="container">
    <div class="style-ul">
      <ul>
        <li>div contains list</li>
        <li>but no p elements</li>
      </ul>
    </div>
  </div>
};

(: To create deliberate XSpec test failures, <x:param>
  uses an empty sequence instead of a node. :)
declare function mf:punct-only-content(
  $n as node()?
  ) as xs:string {
  replace($n/string(),'\P{P}','')
};

(: Copyright © 2023 by Amanda Galtman. :)