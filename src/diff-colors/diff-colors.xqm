xquery version "1.0";
module namespace mf = "urn:x-xspectacles:functions:diff-colors";

(:
  Sample Code for "Interpreting XML Diffs in XSpec Test Reports"
  https://medium.com/@xspectacles/interpreting-xml-diffs-in-xspec-test-reports-ce37358ac2bd
:)

declare function mf:make-doc() as document-node(element(doc)) {
  document{
    <doc>
      <section class="sect1">
        <title class="heading">Elements</title>
        <para>Alpha</para>
        <para>Beta</para>
      </section>
      <section class="sect1">
        <title class="heading">Text</title>
        <para>Some text</para>
        <para>More text</para>
      </section>
      <section class="sect1">
        <title class="heading">Attributes</title>
        <para id="p1">First</para>
        <para>Second</para>
        <para id="p3">Third</para>
      </section>
    </doc>
  }
};

(: Copyright © 2025 by Amanda Galtman. :)