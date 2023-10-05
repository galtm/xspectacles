xquery version "3.1";
module namespace mf = "urn:x-xspectacles:functions:code-reuse-call";

declare namespace xs = "http://www.w3.org/2001/XMLSchema";

(:
    Sample code for "Inheritance as a Form of Reuse in XSpec"
    https://medium.com/@xspectacles/inheritance-as-a-form-of-reuse-in-xspec-63dd3717bbe3
:)

declare function mf:id-by-name-and-class(
    $elem as element()+,
    $localname as xs:string+,
    $class as xs:string+,
    $flag as xs:string*
    ) as xs:string* {
    
    (:
        Isolate "first" case in case it helps processor
        stop searching beyond first match.
    :)
    if ($flag eq "first")
    then head($elem/descendant-or-self::*[local-name() = $localname]
        [@class = $class][@xml:id])/@xml:id/string()
    else
        let $matches := $elem/descendant-or-self::*
            [local-name() = $localname]
            [@class = $class][@xml:id]/@xml:id
        return
            switch ($flag)
                case "all"
                    return $matches/string()
                case "last"
                    return $matches[last()]/string()
                default
                    return ()
};

(: Copyright © 2023 by Amanda Galtman. :)