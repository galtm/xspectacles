<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">

  <!--
    Sample Code for "How to Test Error Handling in XSpec"
    https://medium.com/@xspectacles/how-to-test-error-handling-in-xspec-cdd83f498204
  -->

  <sch:pattern id="root">
    <sch:rule context="/*">
      <sch:assert id="unknown-type"
        test="local-name() = ('topic','procedure','reference','example')"
        ><sch:value-of select="error((QName('http://www.w3.org/2005/xqt-errors','blah')),'Document is an unknown type!')"/></sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>

<!-- Copyright © 2024 by Amanda Galtman. -->