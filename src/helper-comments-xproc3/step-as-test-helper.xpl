<?xml version="1.0" encoding="UTF-8"?>
<p:library xmlns:p="http://www.w3.org/ns/xproc" version="3.0"
  xmlns:frc="urn:x-xspectacles:functions:helper:remove-comments:xproc">

  <!--
    Sample Code for "XProc 3 Steps as XSpec Test Helper Functions"
    https://medium.com/@xspectacles/xproc-3-steps-as-xspec-test-helper-functions-1ff197c445af
  -->

  <p:declare-step type="frc:remove-comments">

    <!--
      To use this step as an XSpec test helper function using a
      feature of XML Calabash, import the steps that execute XSpec
      test suites. The URIs below can be resolved with catalog.xml
      at the root of the XSpec installation. Specify the catalog
      when invoking XML Calabash.
    -->    
    <p:import
        href="http://www.jenitennison.com/xslt/xspec/xproc/steps/run-xslt"/>
    <p:import
        href="http://www.jenitennison.com/xslt/xspec/xproc/steps/run-xquery"/>

    <p:input port="source"/>
    <p:output port="result"/>

    <p:delete match="descendant::comment()
      [starts-with(normalize-space(.), 'TEST NOTE:')]"/>
  </p:declare-step>
    
</p:library>
<!-- Copyright © 2025 by Amanda Galtman. -->