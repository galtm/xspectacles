xquery version "3.1";
module namespace my-xq = "x-urn:my-xq";
declare namespace db = "http://docbook.org/ns/docbook";
declare namespace h = "http://www.w3.org/1999/xhtml";

(:
    Sample code for 'Saying "Whatever" in XSpec: How, Why, When'
    https://medium.com/@xspectacles/saying-whatever-in-xspec-how-why-when-979ef97294e
:)

declare function my-xq:product-row($products as element(db:productname)+) as element(h:tr) {
    <h:tr>
        <h:td>
            <h:strong class="plabel">Products</h:strong>
        </h:td>
        <h:td>{
            if (count($products) eq 1)
            then my-xq:productname($products)
            else (
                <h:ul>
                    { for $p in $products return
                        <h:li>
                            { my-xq:productname($p) }
                        </h:li>
                    }
                </h:ul>
            )
        }</h:td>
    </h:tr>
};

declare function my-xq:productname($product as element(db:productname)) as element(h:span) {
    <h:span class="pname">{ string($product) }</h:span>
};

(: Copyright © 2023 by Amanda Galtman. :)