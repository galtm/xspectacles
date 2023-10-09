xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions";

declare namespace fn = "http://www.w3.org/2005/xpath-functions";
declare namespace xs = "http://www.w3.org/2001/XMLSchema";

(:
    Sample code for "Adaptable Code Reuse in XSpec, Part 2: XPath Matching"
    https://medium.com/@xspectacles/adaptable-code-reuse-in-xspec-part-2-8820b1cd255d
:)

declare function mf:options($ignore-dup as xs:boolean) as map(*) {
    map{
    'duplicates': ( if ($ignore-dup)
                    then 'use-last'
                    else 'reject' ),
    'escape': false()
    }
};

declare function mf:json-processing($json-string as xs:string)
    as element(fn:map) {
    <map xmlns="http://www.w3.org/2005/xpath-functions">
        {(: revision property :)}
        <string key="revision">1.0</string>
        {(: properties from $json-string :)}
        { json-to-xml($json-string)/fn:map/* }
    </map>
};

(: Copyright © 2023 by Amanda Galtman. :)