<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1372642494825" ID="ID_259374195" MODIFIED="1372642511306" TEXT="Introduction to Systematic Program Design">
<node CREATED="1372642535120" ID="ID_976139510" MODIFIED="1372642648271" POSITION="left" TEXT="Testing">
<node CREATED="1372642520896" ID="ID_1115415536" MODIFIED="1372642602622" TEXT="Enumeration Functions">
<node CREATED="1372642572168" ID="ID_1893666052" MODIFIED="1372642574447" TEXT="normal rule">
<node CREATED="1372642551126" ID="ID_731742044" MODIFIED="1372642567376" TEXT="test every case of the enumeration"/>
</node>
<node CREATED="1372642603607" ID="ID_1536002558" MODIFIED="1372642609042" TEXT="Large enumerations">
<node CREATED="1372642609045" ID="ID_262407123" MODIFIED="1372642615635" TEXT="white box">
<node CREATED="1372642615638" ID="ID_542755130" MODIFIED="1372642637799" TEXT="base thests on our knowledge of how the function is coded not just what it is supposed to do"/>
</node>
</node>
</node>
</node>
<node CREATED="1372992441889" ID="ID_1948324729" MODIFIED="1372992450880" POSITION="right" TEXT="Design Recipes">
<node CREATED="1372992450883" FOLDED="true" ID="ID_1514753891" MODIFIED="1372994315181" TEXT="Data">
<node CREATED="1372992455265" ID="ID_1738571159" MODIFIED="1372992473461" TEXT="choose the form"/>
<node CREATED="1372992490971" FOLDED="true" ID="ID_1517371500" MODIFIED="1372994287989" TEXT="A possible structure definition (not until compound data)&#xa;&#xa;&#xa;">
<icon BUILTIN="full-1"/>
<node CREATED="1372992628583" ID="ID_1644526025" MODIFIED="1372992644505" TEXT="select form">
<node CREATED="1372992644855" ID="ID_1540280630" MODIFIED="1372993269289">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          is atomic
        </td>
      </tr>
    </table>
  </body>
</html></richcontent>
<node CREATED="1372993269294" ID="ID_1705920404" MODIFIED="1372993269300">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          <a style="text-decoration: none; color: rgb(0, 136, 204)" href="https://class.coursera.org/programdesign-001/wiki/view?page=HtDData#S1"><font color="rgb(0, 136, 204)">Simple Atomic Data</font></a>
        </td>
      </tr>
    </table>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1372993222479" ID="ID_1219296595" MODIFIED="1372993222485">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          is numbers within a certain range
        </td>
        <td>
          <a style="text-decoration: none; color: rgb(0, 136, 204)" href="https://class.coursera.org/programdesign-001/wiki/view?page=HtDData#S2"><font color="rgb(0, 136, 204)">Interval</font></a>
        </td>
      </tr>
    </table>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1372993218933" ID="ID_143789387" MODIFIED="1372993218936">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          consists of a fixed number of distinct values
        </td>
        <td>
          <a style="text-decoration: none; color: rgb(0, 136, 204)" href="https://class.coursera.org/programdesign-001/wiki/view?page=HtDData#S3"><font color="rgb(0, 136, 204)">Enumeration</font></a>
        </td>
      </tr>
    </table>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1372993215145" ID="ID_1637825973" MODIFIED="1372993215151">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          is comprised of 2 or more subclasses, at least one of which is not a distinct data item
        </td>
        <td>
          <a style="text-decoration: none; color: rgb(0, 136, 204)" href="https://class.coursera.org/programdesign-001/wiki/view?page=HtDData#S4"><font color="rgb(0, 136, 204)">Itemization</font></a>
        </td>
      </tr>
    </table>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1372993204562" ID="ID_527171099" MODIFIED="1372993204565">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          consists of two or more values that naturally belong together
        </td>
        <td>
          <a style="text-decoration: none; color: rgb(0, 136, 204)" href="https://class.coursera.org/programdesign-001/wiki/view?page=HtDData#S5"><font color="rgb(0, 136, 204)">Compound data</font></a>
        </td>
      </tr>
    </table>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1372993197247" ID="ID_1369100514" MODIFIED="1372993197251">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          is naturally composed of different parts
        </td>
        <td>
          <a style="text-decoration: none; color: rgb(0, 136, 204)" href="https://class.coursera.org/programdesign-001/wiki/view?page=HtDData#S6"><font color="rgb(0, 136, 204)">References to other defined type</font></a>
        </td>
      </tr>
    </table>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1372993178929" ID="ID_12094976" MODIFIED="1372993306904">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          is of arbitrary (unknown) size
        </td>
      </tr>
    </table>
  </body>
</html>
</richcontent>
<node CREATED="1372993306908" ID="ID_1239935889" MODIFIED="1372993306914">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table>
      <tr>
        <td>
          <a style="text-decoration: none; color: rgb(0, 136, 204)" href="https://class.coursera.org/programdesign-001/wiki/view?page=HtDData#S7"><font color="rgb(0, 136, 204)">self-referential or mutually referential</font></a>
        </td>
      </tr>
    </table>
  </body>
</html></richcontent>
<node CREATED="1372993393498" ID="ID_1647875464" MODIFIED="1372993427504">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      
    </p>
    <p>
      ;; ListOfString is one of:
    </p>
    <p>
      ;;&#160;&#160;- empty
    </p>
    <p>
      ;;&#160;&#160;- (cons String ListOfString)
    </p>
    <p>
      ;; interp. a list of strings
    </p>
    <p>
      
    </p>
    <p>
      (define LOS-1 empty)
    </p>
    <p>
      (define LOS-2 (cons &quot;a&quot; empty))
    </p>
    <p>
      (define LOS-3 (cons &quot;b&quot; (cons &quot;c&quot; empty)))
    </p>
    <p>
      
    </p>
    <p>
      #;
    </p>
    <p>
      (define (fn-for-los los)
    </p>
    <p>
      &#160;&#160;(cond [(empty? los) (...)]&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;;BASE CASE
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;[else (... (first los)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(fn-for-los (rest los)))])) ;NATURAL RECURSION
    </p>
    <p>
      ;;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;/
    </p>
    <p>
      ;;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;/
    </p>
    <p>
      ;;&#160;&#160;&#160;&#160;&#160;&#160;&#160;COMBINATION
    </p>
    <p>
      ;; Template rules used:
    </p>
    <p>
      ;;&#160;&#160;- one of: 2 cases
    </p>
    <p>
      ;;&#160;&#160;- atomic distinct: empty
    </p>
    <p>
      ;;&#160;&#160;- compound: (cons String ListOfString)
    </p>
    <p>
      ;;&#160;&#160;- atomic non-distinct: (first los) is String
    </p>
    <p>
      ;;&#160;&#160;- self-reference: (rest los) is ListOfString
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1372992578302" ID="ID_1502794681" MODIFIED="1372992622405" TEXT="A type comment that defines a new type name and describes how to form data of that type.&#xa;">
<icon BUILTIN="full-2"/>
</node>
<node CREATED="1372992589454" ID="ID_1304130335" MODIFIED="1372992623173" TEXT="An interpretation that describes the correspondence between information and data.">
<icon BUILTIN="full-3"/>
</node>
<node CREATED="1372992570899" ID="ID_1111298964" MODIFIED="1372992623893" TEXT="One or more examples of the data.&#xa;">
<icon BUILTIN="full-4"/>
</node>
<node CREATED="1372992552446" ID="ID_820422664" MODIFIED="1372992624541" TEXT="A template for a 1 argument function operating on data of this type.">
<icon BUILTIN="full-5"/>
</node>
</node>
<node CREATED="1372994179180" ID="ID_1718404246" MODIFIED="1372994181303" TEXT="Function">
<node CREATED="1372994181305" ID="ID_274231936" MODIFIED="1372994264401">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Signature, purpose and stub.
    </p>
  </body>
</html>
</richcontent>
<icon BUILTIN="full-1"/>
<node CREATED="1372994338347" ID="ID_1783353065" MODIFIED="1372994355015">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ;; Number -&gt; Number
    </p>
    <p>
      ;; produces n times 2
    </p>
    <p>
      
    </p>
    <p>
      (define (double n)&#160;&#160;0)&#160;&#160;; this is the stub
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1372994250130" ID="ID_1438580849" MODIFIED="1372994267097">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Define examples, wrap each in check-expect.
    </p>
  </body>
</html>
</richcontent>
<icon BUILTIN="full-2"/>
<node CREATED="1372994679240" ID="ID_1602938336" MODIFIED="1372994684492">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (check-expect (double 0) (* 0 2))
    </p>
    <p>
      (check-expect (double 1) (* 1 2))
    </p>
    <p>
      (check-expect (double 3) (* 3 2))
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1372994247678" ID="ID_1136748254" MODIFIED="1372994269241">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Template and inventory.
    </p>
  </body>
</html>
</richcontent>
<icon BUILTIN="full-3"/>
</node>
<node CREATED="1372994245059" ID="ID_656710193" MODIFIED="1372994270881">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Code the function body.
    </p>
  </body>
</html>
</richcontent>
<icon BUILTIN="full-4"/>
</node>
<node CREATED="1372994241548" ID="ID_388146300" MODIFIED="1372994272617">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Test and debug until correct
    </p>
  </body>
</html>
</richcontent>
<icon BUILTIN="full-5"/>
</node>
</node>
</node>
</node>
</map>
