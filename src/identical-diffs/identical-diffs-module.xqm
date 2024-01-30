xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:identical-diffs";
declare namespace xs = "http://www.w3.org/2001/XMLSchema";

(:
  Sample code for "But the Diffs Look the Same"
  https://medium.com/@xspectacles/but-the-diffs-look-the-same-9f03c025c547
:)

declare function mf:generate-glossentry(
  $term as xs:string
) as document-node() {
  document{
      <glossentry>
        <glossterm>{$term}</glossterm>
        <glossdef>
          <p>Definition of {$term} goes here
                as a paragraph</p>
        </glossdef>
      </glossentry>
  }
};

(: Copyright © 2024 by Amanda Galtman. :)