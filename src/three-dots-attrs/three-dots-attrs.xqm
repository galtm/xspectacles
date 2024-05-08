xquery version "3.1";
module namespace my-xq = "x-urn:my-xq";
declare default element namespace "http://www.w3.org/1999/xhtml";

(:
  Sample code for "Comparing Attributes Selectively in XSpec 3.0"
  https://medium.com/@xspectacles/comparing-attributes-selectively-in-xspec-3-0-f3a457fe8e04
:)

(:
  The HTML <img> element with data attributes is taken from
  https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/data-*
:)
declare function my-xq:spaceship-img() as element(img) {
  <img
    class="spaceship cruiserX3"
    src="shipX3.png"
    data-ship-id="324"
    data-weapons="laserI laserII"
    data-shields="72%"
    data-x="414354"
    data-y="85160"
    data-z="31940"
    onclick="spaceships[this.dataset.shipId].blasted()"/>
};

declare function my-xq:heading($content as node()) as element(h1) {
  <h1 class="main">{$content}</h1>
};
