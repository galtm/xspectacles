<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0"
  xmlns:x="http://www.jenitennison.com/xslt/xspec">

  <!--
    Sample Code for "XProc 3 Steps as XSpec Test Helper Functions"
    https://medium.com/@xspectacles/xproc-3-steps-as-xspec-test-helper-functions-1ff197c445af
  -->

  <p:import href="step-as-test-helper.xpl"/>
  <p:import
      href="http://www.jenitennison.com/xslt/xspec/xproc/steps/run-xslt"/>

  <p:input port="source"><!-- XSpec file --></p:input>
  <p:output port="result"><!-- HTML test result report --></p:output>
  <x:run-xslt/>
</p:declare-step>
<!-- Copyright © 2025 by Amanda Galtman. -->