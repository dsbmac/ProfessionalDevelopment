<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#000000" CREATED="1359982230999" ID="ID_1271875710" MODIFIED="1360588242079">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Programming
    </p>
    <p>
      Languages
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="30"/>
<hook NAME="accessories/plugins/AutomaticLayout.properties"/>
<node COLOR="#0033ff" CREATED="1359982377329" ID="ID_1795020779" MODIFIED="1360582308847" POSITION="right">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Understand functional and
    </p>
    <p>
      object-oriented programs
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="24"/>
<node COLOR="#00b439" CREATED="1360238138828" ID="ID_1039009066" MODIFIED="1360588242080" TEXT="A functional program is a just a sequence of bindings">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<icon BUILTIN="idea"/>
</node>
<node COLOR="#00b439" CREATED="1360279616734" ID="ID_1681294643" MODIFIED="1360588242080" TEXT="Avoiding mutation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360237665449" ID="ID_327473395" MODIFIED="1360582308849" TEXT="Immutable Data">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360237683576" ID="ID_1275495174" MODIFIED="1360588242081">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      This is the core of functional programming!
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161895" ID="ID_1345295613" MODIFIED="1360582308849">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Benefits of no mutation
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360279645806" ID="ID_590255026" MODIFIED="1360588242081" TEXT="be confident no one changes your code">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1360279750597" ID="ID_1480013565" MODIFIED="1360588242081" TEXT="Using functions as values">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360279930435" ID="ID_1356647071" MODIFIED="1360582308850" TEXT="First-class functions">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161876" ID="ID_491676561" MODIFIED="1360588242082">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Higher-order functions
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360033161863" ID="ID_1432374590" MODIFIED="1360588242082">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Currying
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360285441388" ID="ID_993106401" MODIFIED="1360588242082" TEXT="often polymorphic but not always">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288457456" ID="ID_76440692" MODIFIED="1360588242083">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun times_until_zero (f,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;if x=0 then 0 else 1 + times_until_zero(f, fx)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360279954516" ID="ID_160232736" MODIFIED="1360588242083" TEXT="functions are values">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360279968803" ID="ID_1297763280" MODIFIED="1360588242083" TEXT="can use them wherever we use values">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360280160409" ID="ID_1955595259" MODIFIED="1360588242083" TEXT="most common use is as an argument/result  of another function">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280235474" ID="ID_133652359" MODIFIED="1360588242084">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      the other function is called a <i>higher-order function</i>
    </p>
  </body>
</html></richcontent>
<arrowlink DESTINATION="ID_491676561" ENDARROW="Default" ENDINCLINATION="222;8;" ID="Arrow_ID_371717414" STARTARROW="None" STARTINCLINATION="-240;-42;"/>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360283057960" ID="ID_1260475361" MODIFIED="1360588242084" TEXT="function as arguments">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360283092390" ID="ID_303507059" MODIFIED="1360588242084" TEXT="fun f(g,...) = g(...)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283447075" ID="ID_305234561" MODIFIED="1360588242084" TEXT="good technique to reuse code">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360287970939" ID="ID_783793342" MODIFIED="1360588242085" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360287977546" ID="ID_323935551" MODIFIED="1360588242085">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun n_times (f,n,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;if n = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;then x
    </p>
    <p>
      &#160;&#160;&#160;&#160;else f(n_times(f, n-1, x))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288046266" ID="ID_1509506845" MODIFIED="1360588242085" TEXT="val n_times : (&apos;a -&gt; &apos;a) * int * &apos;a -&gt; &apos;a">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288326312" ID="ID_1677230853" MODIFIED="1360588242085" TEXT="A function of type &#x2032;a&#x2212;&gt;&#x2032;a indicates it takes one argument and returns a value of the same type as the argument.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360288164345" ID="ID_1948875305" MODIFIED="1360588242085" TEXT="&apos;a means any type can be used">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360205516462" ID="ID_61580563" MODIFIED="1360582308852" TEXT="Closures">
<arrowlink DESTINATION="ID_1356647071" ENDARROW="Default" ENDINCLINATION="-6;24;" ID="Arrow_ID_1828335752" STARTARROW="Default" STARTINCLINATION="3;-12;"/>
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360280472759" ID="ID_771140487" MODIFIED="1360588242086" TEXT="can use bindings from outside the function definition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360280499424" ID="ID_489499515" MODIFIED="1360588242086" TEXT="makes 1st-class functions much more powerful">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360364005729" ID="ID_55150341" MODIFIED="1360588242086" TEXT="fold">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360364012896" ID="ID_1690890120" MODIFIED="1360588242087" TEXT="private data">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360364019695" ID="ID_1402387868" MODIFIED="1360588242087" TEXT="lexical scope">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360358554152" ID="ID_1530468876" MODIFIED="1360588242087" TEXT="recomputation savings">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360292338868" ID="ID_1268681033" MODIFIED="1360582308854" TEXT="Anonymous">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360292346907" ID="ID_1082665501" MODIFIED="1360588242087" TEXT="cannot use with recursion ">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292351972" ID="ID_1977566871" MODIFIED="1360588242088" TEXT="most common use is as an argument to higher order function">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292445835" ID="ID_1797608789" MODIFIED="1360588242088" TEXT="great for use in only one place">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1360279849323" ID="ID_889804456" MODIFIED="1360588242088" TEXT="no clear yes/no for a particular language">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360279874371" ID="ID_1671089419" MODIFIED="1360588242088" TEXT="Style">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161791" ID="ID_1873965344" MODIFIED="1360582308855">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Laziness, streams, and memoization
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360279779519" ID="ID_388725695" MODIFIED="1360582308855" TEXT="closer to mathematical definitions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360238258911" ID="ID_1962718393" MODIFIED="1360582308856" TEXT="Recursion affinity">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430637" ID="ID_629579194" MODIFIED="1360582308856" POSITION="right">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      How to learn
    </p>
    <p>
      new programming
    </p>
    <p>
      languages quickly
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="24"/>
<node COLOR="#00b439" CREATED="1360033223006" ID="ID_983321391" MODIFIED="1360588242090" TEXT="Idioms">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161855" ID="ID_333611860" MODIFIED="1360582308857">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Syntactic sugar
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1360033227093" ID="ID_1365563441" MODIFIED="1360588242090" TEXT="Libraries">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033231542" ID="ID_1572582425" MODIFIED="1360588242090" TEXT="Tools">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360239723479" ID="ID_773106793" MODIFIED="1360588242091" TEXT="Semantics">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360239732983" ID="ID_50682881" MODIFIED="1360582308858" TEXT="What the written code means">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1360245982303" ID="ID_297285607" MODIFIED="1360588242091" TEXT="Play around">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360241571299" ID="ID_817354878" MODIFIED="1360588242092" TEXT="3 Rules">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033218497" ID="ID_875308996" MODIFIED="1360582308858" TEXT="Syntax">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<icon BUILTIN="stop"/>
<node COLOR="#111111" CREATED="1360238767539" ID="ID_1839216680" MODIFIED="1360588242092" TEXT="type checking">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360239662960" ID="ID_942876054" MODIFIED="1360588242092" TEXT="how you write something valid">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360239813989" ID="ID_1639485916" MODIFIED="1360582308859" TEXT="Evaluation">
<font NAME="Georgia" SIZE="16"/>
<icon BUILTIN="go"/>
<node COLOR="#111111" CREATED="1360239826583" ID="ID_786276893" MODIFIED="1360588242093" TEXT="as the program runs">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360240120194" ID="ID_1136395115" MODIFIED="1360588242093" TEXT="extends the dynamic env.">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360241814745" ID="ID_1523572351" MODIFIED="1360588242093" TEXT="must type check first">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241797532" ID="ID_704096861" MODIFIED="1360588242093" TEXT="produces a value">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244179849" ID="ID_489282001" MODIFIED="1360588242094" TEXT="all values are expressions">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244237253" ID="ID_566949980" MODIFIED="1360588242094" TEXT="not all expressions are values">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244255516" ID="ID_1252301042" MODIFIED="1360588242094" TEXT="evaluates to itself in 0 steps">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360239801091" ID="ID_1559677290" MODIFIED="1360582308860" TEXT="Type Checking">
<font NAME="Georgia" SIZE="16"/>
<icon BUILTIN="prepare"/>
<node COLOR="#111111" CREATED="1360239838887" ID="ID_888927622" MODIFIED="1360588242095" TEXT="before the program runs">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360240104139" ID="ID_543078809" MODIFIED="1360588242095" TEXT="extends the static environment">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244319846" ID="ID_146160701" MODIFIED="1360588242095" TEXT="Types">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244331140" ID="ID_860706922" MODIFIED="1360588242095" TEXT="int">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244334346" ID="ID_548484441" MODIFIED="1360588242095">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      unit ( )
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244346696" ID="ID_898966498" MODIFIED="1360588242096" TEXT="the resul of using the use command in REPL">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244340228" ID="ID_1821718631" MODIFIED="1360588242096" TEXT="bool">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360247284312" ID="ID_1768979395" MODIFIED="1360588242096" TEXT="Function">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#00b439" CREATED="1360240801120" ID="ID_870681185" MODIFIED="1360588242096" TEXT="Expressions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240838543" ID="ID_533675321" MODIFIED="1360582308862" TEXT="can contain subexpressions">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360240856717" ID="ID_1026710898" MODIFIED="1360588242097" TEXT="chain subexp to make larger expressions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240895687" ID="ID_1899943319" MODIFIED="1360582308863" TEXT="Type checking">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240902832" ID="ID_1277735550" MODIFIED="1360582308863" TEXT="Evaluation rules">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360241211975" ID="ID_354119442" MODIFIED="1360582308863" TEXT="Variable">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360241220275" ID="ID_865293059" MODIFIED="1360588242098" TEXT="Simplest expression">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430628" ID="ID_1435228231" MODIFIED="1360582308864" POSITION="right">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Master language
    </p>
    <p>
      concepts and
    </p>
    <p>
      recognize them in
    </p>
    <p>
      strange guises
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="24"/>
<node COLOR="#00b439" CREATED="1360033161903" ID="ID_1238292414" MODIFIED="1360588242098">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Recursive functions and recursive types
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161882" ID="ID_944928480" MODIFIED="1360582308864">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Tail recursion
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360248940034" ID="ID_1554032695" MODIFIED="1360582308864" TEXT="more powerful than loops">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1360033161888" ID="ID_1008572280" MODIFIED="1360588242099">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Algebraic datatypes
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161846" ID="ID_1329948428" MODIFIED="1360588242099">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Equivalence and effects
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161837" ID="ID_1097045453" MODIFIED="1360588242100">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Parametric polymorphism and container types
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161821" ID="ID_719263836" MODIFIED="1360588242100">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Abstract types and modules
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161800" ID="ID_1314280091" MODIFIED="1360588242100">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Dynamic vs. static typing
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161784" ID="ID_431220756" MODIFIED="1360588242101">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Implementing languages, especially higher-order functions
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161775" ID="ID_722622727" MODIFIED="1360588242101">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Macros
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161758" ID="ID_1994567019" MODIFIED="1360588242101">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Abstract types via dynamic type-creation and simple contracts
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161745" ID="ID_1777262570" MODIFIED="1360588242101">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Object-oriented programming is dynamic dispatch
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161738" ID="ID_1336278848" MODIFIED="1360588242102">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Pure object-orientation
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161731" ID="ID_783333515" MODIFIED="1360588242102">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Implementing dynamic dispatch
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161724" ID="ID_1277941858" MODIFIED="1360588242102">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Multiple inheritance, interfaces, and mixins
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161718" ID="ID_1791557834" MODIFIED="1360588242103">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        OO vs. functional decomposition and extensibility
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161711" ID="ID_551832753" MODIFIED="1360588242103">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Subtyping for records, functions, and objects
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161704" ID="ID_139630241" MODIFIED="1360588242103">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Class-based subtyping
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161697" ID="ID_192820981" MODIFIED="1360588242104">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Subtyping
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360033161683" ID="ID_541734409" MODIFIED="1360588242104">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Subtyping vs. parametric polymorphism; bounded polymorphism
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#00b439" CREATED="1360584327714" ID="ID_1185248730" MODIFIED="1360588242104" TEXT="Syntactic Sugar">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360584337235" ID="ID_622121463" MODIFIED="1360584344383" TEXT="Syntactic">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360584345553" ID="ID_901369877" MODIFIED="1360588242105" TEXT="Can describe the semantics entirely by the corresponding record syntax">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360584372833" ID="ID_1185592668" MODIFIED="1360584377643" TEXT="Sugar">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360584377645" ID="ID_1287383500" MODIFIED="1360588242105" TEXT="Makes the language easier to use">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360584473056" ID="ID_646389465" MODIFIED="1360584482578" TEXT="simplifies">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360584482580" ID="ID_469398837" MODIFIED="1360588242106" TEXT="understanding the language">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360584491576" ID="ID_1123960679" MODIFIED="1360588242106" TEXT="implementing the language">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430620" ID="ID_1783454412" MODIFIED="1360582308869" POSITION="right">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Evaluate the power
    </p>
    <p>
      and elegance of
    </p>
    <p>
      languages and their
    </p>
    <p>
      constructs
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="24"/>
<node COLOR="#00b439" CREATED="1360293066054" ID="ID_1638949918" MODIFIED="1360588242106" TEXT="Functions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360250080759" ID="ID_267825409" MODIFIED="1360582308870" TEXT="Function calls">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360279750597" ID="ID_1419365539" MODIFIED="1360588242107" TEXT="Using functions as values">
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink DESTINATION="ID_223285859" ENDARROW="Default" ENDINCLINATION="584;0;" ID="Arrow_ID_1596404302" STARTARROW="None" STARTINCLINATION="584;0;"/>
<font NAME="Verdana" SIZE="12"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360292338868" ID="ID_130663740" MODIFIED="1360588242107" TEXT="Anonymous">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360292346907" ID="ID_1311954735" MODIFIED="1360588242107" TEXT="cannot use with recursion ">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292351972" ID="ID_1071664984" MODIFIED="1360588242108" TEXT="most common use is as an argument to higher order function">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292445835" ID="ID_1715354074" MODIFIED="1360588242108" TEXT="great for use in only one place">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360205516462" ID="ID_1584767849" MODIFIED="1360588242108" TEXT="Closures">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280472759" ID="ID_468020703" MODIFIED="1360588242108" TEXT="can use bindings from outside the function definition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360280499424" ID="ID_1771214115" MODIFIED="1360588242108" TEXT="makes 1st-class functions much more powerful">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360296761774" ID="ID_979753202" MODIFIED="1360588242109" TEXT="a &apos;pair&apos;, 2 parts">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360296772819" ID="ID_1600196665" MODIFIED="1360588242109" TEXT="code">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360296775965" ID="ID_18804971" MODIFIED="1360588242109" TEXT="environment">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360302716194" ID="ID_295459354" MODIFIED="1360588242109" TEXT="Currying">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360302724066" ID="ID_1387930916" MODIFIED="1360588242109" TEXT="closure idiom">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360302745515" ID="ID_1805902983" MODIFIED="1360588242110" TEXT="take arg and return a function that takes another arg and...">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360303154151" ID="ID_1091632368" MODIFIED="1360588242110" TEXT="syntactic sugar">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161870" ID="ID_159872181" MODIFIED="1360588242110">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Lexical scope
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink DESTINATION="ID_1584767849" ENDARROW="Default" ENDINCLINATION="441;0;" ID="Arrow_ID_771460947" STARTARROW="None" STARTINCLINATION="441;0;"/>
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360150384416" ID="ID_1014542162" MODIFIED="1360588242110" TEXT="Semantics">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360148639229" ID="ID_1913484779" MODIFIED="1360588242111" TEXT="the body of a function is evaluated in the environment in which it was defined not the one from where it was called.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360296472743" ID="ID_1749485857" MODIFIED="1360588242111" TEXT="Example">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360296478407" ID="ID_1554187860" MODIFIED="1360588242111">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1&#160;&#160;val x = 1 (original environment)
    </p>
    <p>
      2&#160;&#160;fun f y = x + y (uses the x in the environment it was defined (1))
    </p>
    <p>
      3&#160;&#160;val x = 2 (new x binding)
    </p>
    <p>
      4&#160;&#160;val y = 3
    </p>
    <p>
      5&#160;&#160;val z = f (x+y) (<font face="Arial, sans-serif" color="#111111"><span style="color: #111111; font-family: Arial, sans-serif">evaluates to 6)</span></font>
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360299711880" ID="ID_1815392129" MODIFIED="1360588242111" TEXT="Dynamic Scope">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360299718366" ID="ID_525584557" MODIFIED="1360588242111" TEXT="use environment where function is called">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360299797624" ID="ID_338297689" MODIFIED="1360588242112" TEXT="not used much">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360300375027" ID="ID_1346595115" MODIFIED="1360588242112" TEXT="similar to raising exceptions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360292963624" ID="ID_682671783" MODIFIED="1360588242112" TEXT="Unecessary function wrapping">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360358158848" ID="ID_1609419623" MODIFIED="1360588242112" TEXT="body is not evaluated until called">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360279930435" ID="ID_262435055" MODIFIED="1360582308874" TEXT="First-class functions">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161876" ID="ID_1414150133" MODIFIED="1360588242113">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Higher-order functions
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360033161863" ID="ID_723862609" MODIFIED="1360588242113">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Currying
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360285441388" ID="ID_1314064529" MODIFIED="1360588242113" TEXT="often polymorphic but not always">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288457456" ID="ID_251777348" MODIFIED="1360588242113">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun times_until_zero (f,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;if x=0 then 0 else 1 + times_until_zero(f, fx)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360279954516" ID="ID_223285859" MODIFIED="1360588242114" TEXT="functions are values">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360287970939" ID="ID_411307757" MODIFIED="1360588242114" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360287977546" ID="ID_35395574" MODIFIED="1360588242114">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun n_times (f,n,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;if n = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;then x
    </p>
    <p>
      &#160;&#160;&#160;&#160;else f(n_times(f, n-1, x))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288046266" ID="ID_1175539128" MODIFIED="1360588242114" TEXT="val n_times : (&apos;a -&gt; &apos;a) * int * &apos;a -&gt; &apos;a">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288326312" ID="ID_657188418" MODIFIED="1360588242115" TEXT="A function of type &#x2032;a&#x2212;&gt;&#x2032;a indicates it takes one argument and returns a value of the same type as the argument.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360288164345" ID="ID_1903048264" MODIFIED="1360588242115" TEXT="&apos;a means any type can be used">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360294759962" ID="ID_146165370" MODIFIED="1360588242115" TEXT="Use">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360294717667" ID="ID_1772503323" MODIFIED="1360588242115" TEXT="can return functions as results">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294725771" ID="ID_41348300" MODIFIED="1360588242116" TEXT="can write higher-order functions that travese your own data structures">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283057960" ID="ID_775171651" MODIFIED="1360588242116" TEXT="function as arguments">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360283092390" ID="ID_1536980434" MODIFIED="1360588242116" TEXT="fun f(g,...) = g(...)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283447075" ID="ID_1534251390" MODIFIED="1360588242116" TEXT="good technique to reuse code">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294685995" ID="ID_1382402334" MODIFIED="1360588242116" TEXT="can pass several functions as arguments">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294698068" ID="ID_1926589975" MODIFIED="1360588242117" TEXT="can put functions in data structures (list, tuples)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360279968803" ID="ID_1080146765" MODIFIED="1360588242117" TEXT="can use them wherever we use values">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360280160409" ID="ID_1773329292" MODIFIED="1360588242117" TEXT="most common use is as an argument/result  of another function">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280235474" ID="ID_1961280377" MODIFIED="1360588242117">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      the other function is called a <i>higher-order function</i>
    </p>
  </body>
</html></richcontent>
<arrowlink DESTINATION="ID_1414150133" ENDARROW="Default" ENDINCLINATION="222;8;" ID="Arrow_ID_1866289354" STARTARROW="None" STARTINCLINATION="-240;-42;"/>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360207705877" ID="ID_912009804" MODIFIED="1360582308877">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Hall of Fame
    </p>
    <p>
      Functions
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204050824" ID="ID_1003407896" MODIFIED="1360588242118" TEXT="Map">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360206900923" ID="ID_525075448" MODIFIED="1360588242118">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun map (fs, xs) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;case xs of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;[ ] =&gt; [ ]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| x::xs' =&gt; (f x)::(map(f,xs'))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293160838" ID="ID_1855298825" MODIFIED="1360588242118" TEXT="val map : (&apos;a -&gt; &apos;b) * &apos;a list -&gt; &apos;b list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293501228" ID="ID_638539267" MODIFIED="1360588242118" TEXT="map takes two arguments, a function and a list, and applies the function to each element of the list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204057840" ID="ID_1455353635" MODIFIED="1360588242119" TEXT="Filter">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360206684918" ID="ID_567130293" MODIFIED="1360588242119">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun filter (f, xs) =
    </p>
    <p>
      &#160;&#160;case xs of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;[ ] =&gt; [ ]
    </p>
    <p>
      &#160;&#160;&#160;&#160;| x::xs' =&gt; if f x
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;then x::(filter (f,xs'))
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;else filter (f,xs')
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293652123" ID="ID_746791147" MODIFIED="1360588242119" TEXT="returns a subset">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293771946" ID="ID_1561981825" MODIFIED="1360588242119" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360293778337" ID="ID_1564379624" MODIFIED="1360588242120" TEXT="(&apos;a -&gt; bool) * &apos;a list -&gt; &apos;a list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360293870865" ID="ID_995133773" MODIFIED="1360588242120" TEXT="filter takes two arguments, a function and a list, and applies the function to each element of the list, including the element if true">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204060048" ID="ID_1746704610" MODIFIED="1360588242120" TEXT="Fold">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360205253264" ID="ID_1962402212" MODIFIED="1360588242120">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun fold (f,acc,xs) =
    </p>
    <p>
      &#160;&#160;case xs of
    </p>
    <p>
      &#160;&#160;&#160;&#160;[ ] =&gt; acc
    </p>
    <p>
      &#160;&#160;| x::xs' =&gt; fold(f, f(acc,x), xs')
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360358734902" ID="ID_588306372" MODIFIED="1360588242120" TEXT="this goes right to left">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363300149" ID="ID_127346558" MODIFIED="1360588242121" TEXT="fun f1 xs = fold((fn (x,y) =&gt; x+y), 0, xs)">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360363342494" ID="ID_177450728" MODIFIED="1360588242121" TEXT="sums list example">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363904714" ID="ID_818974228" MODIFIED="1360588242121" TEXT="no private data use">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360363400301" ID="ID_1546561626" MODIFIED="1360588242121">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun f3 (xs,lo,hi) =&#160;
    </p>
    <p>
      &#160;&#160;&#160;&#160;fold ((fn (x,y) =&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;x + (if y &gt;= lo andalso y &lt;- hi then 1 else 0)), 0, xs)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360363497092" ID="ID_1378338310" MODIFIED="1360588242121" TEXT="closure uses private data">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363544516" ID="ID_1132919109" MODIFIED="1360588242122" TEXT="counts items between lo and hi">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363882105" ID="ID_1287107531" MODIFIED="1360588242122" TEXT="closure makes fold more powerful">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360358645495" ID="ID_642591589" MODIFIED="1360588242122" TEXT="accumulates an answer by repeatedly applying f to a list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360358813829" ID="ID_1647350625" MODIFIED="1360588242122" TEXT="works on different data structures tree, graph, set, array, etc.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1360240801120" FOLDED="true" ID="ID_1977689532" MODIFIED="1360589128464" TEXT="Expressions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240838543" ID="ID_263509605" MODIFIED="1360582308880" TEXT="can contain subexpressions">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360240856717" ID="ID_1499496386" MODIFIED="1360588242123" TEXT="chain subexp to make larger expressions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360245005569" ID="ID_1764097868" MODIFIED="1360582308881" TEXT="Kinds of Expressions">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360242113208" ID="ID_262588390" MODIFIED="1360588242123" TEXT="Addition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360241211975" ID="ID_1303558663" MODIFIED="1360588242123" TEXT="Variable">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241220275" ID="ID_1024967488" MODIFIED="1360588242123" TEXT="Simplest expression">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244472257" ID="ID_1688797825" MODIFIED="1360588242124" TEXT="Conditional">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245054316" ID="ID_1138996395" MODIFIED="1360588242124" TEXT="Less than">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360250230304" ID="ID_511065556" MODIFIED="1360588242124" TEXT="Function calls">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276932329" ID="ID_1761191071" MODIFIED="1360588242124" TEXT="Collection">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360276941880" ID="ID_112314920" MODIFIED="1360588242124" TEXT="Tuples">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276945248" ID="ID_1279521354" MODIFIED="1360588242125" TEXT="Lists">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276908489" ID="ID_1831677667" MODIFIED="1360588242125" TEXT="need a way to collect items">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1360033161764" ID="ID_1152113752" MODIFIED="1360589155854">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Eval
    </p>
  </body>
</html>
</richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430607" ID="ID_878814675" MODIFIED="1360582308882" POSITION="right" STYLE="fork">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Learn basic
    </p>
    <p>
      ML, Racket, and Ruby
    </p>
    <p>
      and leverage that
    </p>
    <p>
      proficiency to
    </p>
    <p>
      different languages
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="24"/>
<node COLOR="#00b439" CREATED="1359982522312" ID="ID_182957583" MODIFIED="1360588242125" TEXT="ML">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360238984907" ID="ID_1915988689" MODIFIED="1360582308882" TEXT="Dynamic &amp; Static environment">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360239002809" ID="ID_1761349363" MODIFIED="1360588242126" TEXT="Static">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360239009185" ID="ID_478573331" MODIFIED="1360588242126" TEXT="keeps track of variable types">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360247762366" ID="ID_783219452" MODIFIED="1360588242126">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <font size="13px" color="rgb(0, 0, 0)" face="sans-serif"><span style="display: inline !important; font-family: sans-serif; float: none; line-height: 19.1875px; white-space: normal; font-weight: normal; word-spacing: 0px; font-size: 13px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px">The binding of names before the program is run is called</span><span class="Apple-converted-space">&#160;</span><b style="font-family: sans-serif; line-height: 19.1875px; white-space: normal; font-size: 13px; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px">static</b></font>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360238516503" ID="ID_422150713" MODIFIED="1360588242126" TEXT="Dynamic environment">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360238533056" ID="ID_1435659147" MODIFIED="1360588242127">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      the environment you have when you're running your program
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360246448912" ID="ID_1860101807" MODIFIED="1360588242127" TEXT="Shadowing">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360246519498" ID="ID_1591562174" MODIFIED="1360588242127" TEXT="explains how variable bindings work">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240801120" ID="ID_1482028639" MODIFIED="1360582308883" TEXT="Expressions">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360245005569" ID="ID_1993584588" MODIFIED="1360588242128" TEXT="Kinds of Expressions">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360242113208" ID="ID_28817220" MODIFIED="1360588242128" TEXT="Addition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244472257" ID="ID_839879046" MODIFIED="1360588242129" TEXT="Conditional">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244484052" ID="ID_155437244" MODIFIED="1360588242129" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244499063" ID="ID_1782946491" MODIFIED="1360588242129" TEXT="if e1 then e2 else e3">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244536829" ID="ID_212029351" MODIFIED="1360588242129">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      where if, then else are keywords
    </p>
    <p>
      and e1, e2, e3 are subexpressions
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244611988" ID="ID_1239891493" MODIFIED="1360588242129" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244639209" ID="ID_1373974680" MODIFIED="1360588242129" TEXT="e1 must be type bool">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244653471" ID="ID_848778078" MODIFIED="1360588242130" TEXT="e2, e3 can have any type t but must be the same type t">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244745040" ID="ID_1139006463" MODIFIED="1360588242130" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244756015" FOLDED="true" ID="ID_316539049" MODIFIED="1360588242130">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      evaluate&#160;e1 to a value v1
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="full-1"/>
</node>
<node COLOR="#111111" CREATED="1360244807157" ID="ID_1861704710" MODIFIED="1360588242130" TEXT="if it&apos;s true then e2 is the result else e3">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360245054316" ID="ID_1003857860" MODIFIED="1360588242130" TEXT="Less than">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_824789021" MODIFIED="1360588242131" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245068687" ID="ID_6487470" MODIFIED="1360588242131" TEXT="e1 &lt; e2">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_1833084143" MODIFIED="1360588242131" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245096791" ID="ID_1307393931" MODIFIED="1360588242131" TEXT="e1 and e2 have same type int">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_1410815516" MODIFIED="1360588242131" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245218685" ID="ID_1622997009" MODIFIED="1360588242132" TEXT="evaluate e2 to v1 and e2 to v2">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245179715" ID="ID_730481765" MODIFIED="1360588242132" TEXT="if v1 &lt; v2 then true else false">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360276885002" ID="ID_906408532" MODIFIED="1360588242132" TEXT="Tuples &amp; Lists">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360276997288" ID="ID_666919492" MODIFIED="1360588242132" TEXT="Tuples">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1959410498" MODIFIED="1360588242132" STYLE="fork" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277070632" ID="ID_1776472701" MODIFIED="1360588242132" TEXT="(e1,e2)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_1619743197" MODIFIED="1360588242133" STYLE="fork" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277081863" ID="ID_580410403" MODIFIED="1360588242133" TEXT="If e1 has type ta and e2 has type tb, then pair expression has type ta* tb">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_936342164" MODIFIED="1360588242133" STYLE="fork" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277137039" ID="ID_1605223796" MODIFIED="1360588242133" TEXT="Eval e1 to v1 and e2 to v2; result is (v1,v2)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360277185615" ID="ID_1065739060" MODIFIED="1360588242133" TEXT="is a new kind of type">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360277188718" ID="ID_17496545" MODIFIED="1360588242133" TEXT="pair of values is a value">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360277357174" ID="ID_946999057" MODIFIED="1360588242134" TEXT="Access">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1441582057" MODIFIED="1360588242134" STYLE="fork" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277390605" ID="ID_626384089" MODIFIED="1360588242134" TEXT="#1 e and #2e">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_969144387" MODIFIED="1360588242134" STYLE="fork" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277479333" ID="ID_815094276" MODIFIED="1360588242134" TEXT="if e has type ta * tb then #1 e has type ta and #2 e has type tb">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_298765400" MODIFIED="1360588242134" STYLE="fork" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277418621" ID="ID_1893484537" MODIFIED="1360588242134" TEXT="evaluate e to a pair of values and return first or second piece">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360277003640" ID="ID_1995446943" MODIFIED="1360588242134" TEXT="Lists">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277888635" ID="ID_1420604799" MODIFIED="1360588242135" TEXT="any number of elements">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1014226687" MODIFIED="1360588242135" STYLE="fork" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277924537" ID="ID_135622555" MODIFIED="1360588242135" TEXT="[v1, v2,...,vn]">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_161552795" MODIFIED="1360588242135" STYLE="fork" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278357199" ID="ID_1733533409" MODIFIED="1360588242135" TEXT="e1::e2 e1 has type t and e2 has type t list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278494501" ID="ID_1440689836" MODIFIED="1360588242135" TEXT="t list all elements have type t">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278532709" ID="ID_1581078460" MODIFIED="1360588242135">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      'a means <i>any</i>&#160;type
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_1925965111" MODIFIED="1360588242135" STYLE="fork" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277948882" ID="ID_1145807934" MODIFIED="1360588242136" TEXT="e1::e2 adds an element to the front">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360278167415" ID="ID_716712108" MODIFIED="1360588242136" TEXT="accessing">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360587057910" ID="ID_2195146" MODIFIED="1360588242136" TEXT="check variant">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278104921" ID="ID_750818610" MODIFIED="1360588242136" TEXT="null">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278126056" ID="ID_676240123" MODIFIED="1360588242136" TEXT="returns true if list is empty">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278676948" ID="ID_810323568" MODIFIED="1360588242136" TEXT="&apos;a list -&gt; bool">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360587071150" ID="ID_1269489039" MODIFIED="1360588242136" TEXT="extract data">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278175464" ID="ID_219830066" MODIFIED="1360588242137" TEXT="tl">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278178224" ID="ID_572614686" MODIFIED="1360588242137" TEXT="the rest of the list to the right of the hd">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278220055" ID="ID_479746199" MODIFIED="1360588242137" TEXT="exception e if empty">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278697037" ID="ID_1151874247" MODIFIED="1360588242137" TEXT="&apos;a list -&gt; &apos;a list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360278171112" ID="ID_431003745" MODIFIED="1360588242137" TEXT="hd">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278685132" ID="ID_850912887" MODIFIED="1360588242137" TEXT="&apos;a list -&gt; &apos;a">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360288632510" ID="ID_1870008175" MODIFIED="1360588242137" TEXT="Anonymous Functions">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360290690832" ID="ID_1985231392" MODIFIED="1360588242137" TEXT="fun triple_n_times (n_times(fn =&gt; 3*x),n,x)">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360290829663" ID="ID_1493172640" MODIFIED="1360588242138" TEXT="fn is an expression form not a binding">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360291132309" ID="ID_755556871" MODIFIED="1360588242138" TEXT="if you used fun binding it would not compile">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360289137155" ID="ID_547505702" MODIFIED="1360588242138">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun triple_n_times (n,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;n_times(<font color="#cc0000">let fun triple x = 3*x in triple end</font>, <font color="#0000ff">n</font>, <font color="#00cc00">x</font>)
    </p>
    <p>
      &#160;&#160;&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288922540" ID="ID_1294608526" MODIFIED="1360588242138">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun triple_n_times (n,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;let fun triple x = 3*x
    </p>
    <p>
      &#160;&#160;&#160;&#160;in n_times(triple,n,x)
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288784088" ID="ID_237393991" MODIFIED="1360588242138">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun triple x = 3*x
    </p>
    <p>
      
    </p>
    <p>
      fun triple_n_times (n,x) = n_times(triple,n,x)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288641046" ID="ID_1120353145" MODIFIED="1360588242138" TEXT="given the function n_times">
<arrowlink DESTINATION="ID_323935551" ENDARROW="Default" ENDINCLINATION="2408;0;" ID="Arrow_ID_949735324" STARTARROW="None" STARTINCLINATION="453;0;"/>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360291253508" ID="ID_1989504367" MODIFIED="1360588242138">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      top level <i>triple</i>&#160;definition (poor style)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360292226436" ID="ID_1492771571" MODIFIED="1360588242138" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360292254565" ID="ID_1828935685" MODIFIED="1360588242139" TEXT="fn pat =&gt; exp">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360241211975" ID="ID_865473071" MODIFIED="1360588242139" TEXT="Variable">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241220275" ID="ID_624851513" MODIFIED="1360588242139" TEXT="Simplest expression">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360239524143" ID="ID_118819988" MODIFIED="1360588242139" TEXT="variable binding">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360239532805" ID="ID_1097776630" MODIFIED="1360588242139" TEXT="val x = e">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360033161829" ID="ID_1647647581" MODIFIED="1360588242139">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Type inference
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360286762451" ID="ID_53631507" MODIFIED="1360588242140" TEXT="inferred based on how arguments are used">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161910" ID="ID_581777638" MODIFIED="1360582308893" STYLE="fork">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Bindings
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360238393585" ID="ID_440021972" MODIFIED="1360588242140" TEXT="can&apos;t use later bindings">
<font NAME="Verdana" SIZE="12"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360247473754" ID="ID_1381026485" MODIFIED="1360588242140">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <font size="13px" color="rgb(0, 0, 0)" face="sans-serif"><span class="Apple-converted-space">&#160;</span><span style="display: inline !important; font-family: sans-serif; float: none; line-height: 19.1875px; white-space: normal; font-weight: normal; word-spacing: 0px; font-size: 13px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px">the association of objects (data and/or code) with</span><span class="Apple-converted-space">&#160;</span></font><u><font size="13px" face="sans-serif" color="rgb(11, 0, 128)"><a href="http://en.wikipedia.org/wiki/Identifier" style="font-family: sans-serif; background-position: initial initial; background-repeat: repeat; line-height: 19.1875px; white-space: normal; font-weight: normal; text-decoration: underline; font-size: 13px; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); background-image: none; text-transform: none; font-style: normal; color: rgb(11, 0, 128); letter-spacing: normal; text-align: start; text-indent: 0px" title="Identifier">identifiers</a></font></u><span style="font-family: sans-serif; display: inline !important; float: none; line-height: 19.1875px; white-space: normal; font-weight: normal; font-size: 13px; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px"><font size="13px" face="sans-serif" color="rgb(0, 0, 0)">.</font></span><span><sup id="cite_ref-tkac08_1-0" class="reference" style="font-family: sans-serif; line-height: 1em; white-space: normal; font-weight: normal; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px"><font face="sans-serif" color="rgb(11, 0, 128)"><a href="http://en.wikipedia.org/wiki/Name_binding#cite_note-tkac08-1" style="background-position: initial initial; background-repeat: repeat; white-space: nowrap; text-decoration: initial; background-image: none; color: rgb(11, 0, 128)">[</a></font></sup></span>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360247858091" ID="ID_1626569086" MODIFIED="1360588242140" TEXT="Kinds of Bindings">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360238387315" ID="ID_1088836687" MODIFIED="1360588242141">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      functions
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node COLOR="#111111" CREATED="1360248105210" ID="ID_506194620" MODIFIED="1360588242141" TEXT="fun">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360248277535" ID="ID_1048817481" MODIFIED="1360588242141" TEXT="the most important building block in the course">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360248537682" ID="ID_238604073" MODIFIED="1360588242141" TEXT="Unless a function has exactly one argument, you need to use parentheses to call it">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360248550360" ID="ID_1230768021" MODIFIED="1360588242141" TEXT="takes exactly 1 argument">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_920622251" MODIFIED="1360588242141" STYLE="fork" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_1794295925" MODIFIED="1360588242142" STYLE="fork" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_1645328277" MODIFIED="1360588242142" STYLE="fork" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360238387325" ID="ID_1878771626" MODIFIED="1360588242142">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      records
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360289520688" ID="ID_516240198" MODIFIED="1360588242142" TEXT="Variables">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360358207226" ID="ID_1601402434" MODIFIED="1360588242142" TEXT="binding evaluates its expression when the binding is evaluated not every time it is used">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360585685879" ID="ID_1056292024" MODIFIED="1360588242143" TEXT="Datatype">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360586640553" ID="ID_1793352456" MODIFIED="1360588242143" TEXT="Building">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360585966502" ID="ID_1717065222" MODIFIED="1360588242143">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      datatype mytype = TwoInts of int * int
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Str of string
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Pizza
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360586358795" ID="ID_1409066586" MODIFIED="1360588242143" TEXT="any value of type mytype is made from one of the constructors">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360586388467" ID="ID_447604245" MODIFIED="1360588242143" TEXT="Constructors">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360586088974" ID="ID_1272880046" MODIFIED="1360588242143" TEXT="TwoInts : int * int -&gt; mytype">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360586123597" ID="ID_1305304219" MODIFIED="1360588242144" TEXT="Str : string -&gt; mytype">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360586132092" ID="ID_180304570" MODIFIED="1360588242144" TEXT="Pizza : mytype">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360585772170" ID="ID_1332315139" MODIFIED="1360588242144" TEXT="Constructors aka tags">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360585786070" ID="ID_988150779" MODIFIED="1360588242144" TEXT="Capitalized">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360585864039" ID="ID_1634133314" MODIFIED="1360588242144" TEXT="is either">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360585831071" ID="ID_1816759760" MODIFIED="1360588242144" TEXT="a function that makes values of the new type">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360585883711" ID="ID_1343960199" MODIFIED="1360588242145" TEXT="or a value of the new type">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360585957678" ID="ID_183307320" MODIFIED="1360588242145" TEXT="can be named anything">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360594814175" ID="ID_1548837243" MODIFIED="1360594840475" TEXT="Syntax: datatype t = C1 of t1 | C2 of t2 | ... | Cn of tn">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595060726" ID="ID_923286670" MODIFIED="1360595081837" TEXT="adds type t and constructors Ci of type ti -&gt; t">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595081838" ID="ID_1131886673" MODIFIED="1360595101052" TEXT="Ci v is a value ie the result includes the tag">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360586644760" ID="ID_882539264" MODIFIED="1360588242145" TEXT="Access">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595324316" ID="ID_1461513027" MODIFIED="1360595415580" TEXT="Case Expression">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360586665089" ID="ID_1905638132" MODIFIED="1360588242145" TEXT="check what variant it is (what constructor made it)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360586682216" ID="ID_764239212" MODIFIED="1360595339316" TEXT="extract the data (if that variant has any)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360245509490" ID="ID_1360587793" MODIFIED="1360582308896" TEXT="REPL">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360245516195" ID="ID_1952172383" MODIFIED="1360588242146" TEXT="Error Messages">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245559135" ID="ID_818101232" MODIFIED="1360588242146" TEXT="use command">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245569762" ID="ID_932035963" MODIFIED="1360588242146" TEXT="types in the file&apos;s bindings line by line">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245651767" ID="ID_1635382740" MODIFIED="1360588242146">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Read, Eval, Print, Loop
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245781759" ID="ID_926846695" MODIFIED="1360588242146" TEXT="always restart the REPL C-d">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360295024160" ID="ID_738944707" MODIFIED="1360588242147" TEXT="never parentheses it doesn&apos;t have to">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360366734757" ID="ID_92543980" MODIFIED="1360582308898" TEXT="Idioms">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360366718390" ID="ID_1252997074" MODIFIED="1360588242147" TEXT="infix">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360366907140" ID="ID_1988508449" MODIFIED="1360588242147" TEXT="o">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360366910812" ID="ID_1165531687" MODIFIED="1360588242147" TEXT="combines functions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360582343730" ID="ID_459527501" MODIFIED="1360582455863" TEXT="Types">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360582347632" ID="ID_866102204" MODIFIED="1360588242147" TEXT="Basic">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582356215" ID="ID_238655209" MODIFIED="1360591886044" TEXT="int">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582361799" ID="ID_1687051999" MODIFIED="1360591886524" TEXT="bool">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582382400" ID="ID_1770783880" MODIFIED="1360591887059" TEXT="unit">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582384384" ID="ID_1229500554" MODIFIED="1360591887516" TEXT="char">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582397391" ID="ID_237858056" MODIFIED="1360591887996" TEXT="real">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360582351656" ID="ID_837302319" MODIFIED="1360588242148" TEXT="Compound">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582480998" ID="ID_1991010376" MODIFIED="1360588242148" TEXT="Each of">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582425878" ID="ID_1631583264" MODIFIED="1360588242148" TEXT="list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582434711" ID="ID_1724111495" MODIFIED="1360591867404" TEXT="records">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583194034" ID="ID_372435282" MODIFIED="1360588242149" TEXT="order of fields doesn&apos;t matter">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360583211577" ID="ID_1789279333" MODIFIED="1360588242149" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583444023" ID="ID_556999141" MODIFIED="1360588242149" TEXT="{f1 : t1, ..., fn : tn}">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583719398" ID="ID_129562148" MODIFIED="1360588242149" TEXT="{id : int, name : string}">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360583312928" ID="ID_1531193735" MODIFIED="1360588242149" TEXT="access with #id recordname">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360583423248" ID="ID_1395071106" MODIFIED="1360588242149" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583365232" ID="ID_736716949" MODIFIED="1360588242149" TEXT="{f1 = v1, ..., vn = vn}">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583116851" ID="ID_1064907499" MODIFIED="1360588242149" TEXT="val x = {bar=exp, foo=exp2, baz=exp3">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360583223842" ID="ID_1754664636" MODIFIED="1360588242150" TEXT="{name = &quot;Amelia&quot;, id = 41123 -12}">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583705741" ID="ID_796045829" MODIFIED="1360588242150" TEXT="Evaluates to">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583650814" ID="ID_978213712" MODIFIED="1360588242150" TEXT="{id = 41111, name = &quot;Amelia&quot;}">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360583820245" ID="ID_1498434304" MODIFIED="1360588242150" TEXT="better for many fields use">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582422871" ID="ID_343566070" MODIFIED="1360588242150" TEXT="tuples">
<arrowlink DESTINATION="ID_1724111495" ENDARROW="Default" ENDINCLINATION="91;0;" ID="Arrow_ID_1788499725" STARTARROW="Default" STARTINCLINATION="91;0;"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583810788" ID="ID_127722144" MODIFIED="1360588242150" TEXT="good for short fields">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360584077218" ID="ID_1758178047" MODIFIED="1360588242150" TEXT="syntactic sugar for records">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360584246266" ID="ID_813579088" MODIFIED="1360588242150" TEXT="just a record with particular field names 1=e, 2=e, etc.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360582485470" ID="ID_1230419323" MODIFIED="1360588242151" TEXT="One of">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582429494" ID="ID_1015464258" MODIFIED="1360588242151" TEXT="options">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582958115" ID="ID_1885709979" MODIFIED="1360588242151" TEXT="list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582438135" ID="ID_632169948" MODIFIED="1360591858366" TEXT="datatypes">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591613215" ID="ID_1966307824" MODIFIED="1360591625190" TEXT="simlilar to enums in other languages">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360591626189" ID="ID_1476996650" MODIFIED="1360591704571" TEXT="examples">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591704573" ID="ID_1689301236" MODIFIED="1360591727070" TEXT="datatype suit = Club | Diamond | Heart | Spade">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591806453" ID="ID_219767132" MODIFIED="1360591815614" TEXT="this ex carries no data">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360591777564" ID="ID_278041945" MODIFIED="1360591796813" TEXT="datatype rank = Jack | Queen | King | Ace | Num of int">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591817845" ID="ID_1102295326" MODIFIED="1360591836150" TEXT="this carries data via Num tag">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360592532647" ID="ID_1207811638" MODIFIED="1360592677007">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      datatype exp = Constant of int
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Negate&#160;&#160;&#160;&#160;of exp
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Add&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;of exp * exp
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Multiply&#160;&#160;&#160;of exp * exp
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592570625" ID="ID_958071008" MODIFIED="1360592574160" TEXT="recursive">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360592677503" ID="ID_1918350055" MODIFIED="1360592928618" TEXT="defines a set of trees">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360592929997" ID="ID_266085842" MODIFIED="1360592953871" TEXT="Add (Constant (10+9), Negate (Constant 4))">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592884021" ID="ID_1140435824" MODIFIED="1360592889644">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="../../../Users/Denis/Pictures/trees.png" />
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593056868" ID="ID_630326759" MODIFIED="1360593114415" TEXT="every value of type exp will have this tree shape">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360593766455" ID="ID_1125953356" MODIFIED="1360593769308" TEXT="Add">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593770431" ID="ID_1185584026" MODIFIED="1360593774858" TEXT="Constant">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593774860" ID="ID_478343470" MODIFIED="1360593777294" TEXT="19">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360593780262" ID="ID_1869297387" MODIFIED="1360593784541" TEXT="Negate">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593785127" ID="ID_1113952280" MODIFIED="1360593788458" TEXT="Constant">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593788461" ID="ID_1262335387" MODIFIED="1360593790698" TEXT="4">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360593144539" ID="ID_1729759036" MODIFIED="1360593153686" TEXT="this is a mini language actually">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593153689" ID="ID_1894233083" MODIFIED="1360593282780">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun eval e =
    </p>
    <p>
      &#160;&#160;&#160;&#160;case e of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Constant i&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; i
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Negate e2&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; ~ (eval e2)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Add (e1,e2)&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; (eval e1) + (eval e2)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Multiply (e1,e2) =&gt; (eval e1) * (eval e2)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593305217" ID="ID_165859709" MODIFIED="1360593312392" TEXT="function is recursive">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360593332426" ID="ID_66836282" MODIFIED="1360593356121" TEXT="this function takes any exp type and returns the value integer">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360593566736" ID="ID_1538131971" MODIFIED="1360593717534">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun number_of_adds e =
    </p>
    <p>
      &#160;&#160;&#160;&#160;case e of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Constant i&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| Negate e2&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; number_of_adds e2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| Add(e1,e2)&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; 1 + number_of_adds e1 + number_of_adds e2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| Multiply(e1,e2)&#160;&#160;=&gt; number_of_ads e1 + number_of_adds e2
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593721279" ID="ID_1682064347" MODIFIED="1360593731640" TEXT="counts number of adds used">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360593903022" ID="ID_1362927607" MODIFIED="1360593916605" TEXT="type: exp -&gt; int">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360591926051" ID="ID_4417475" MODIFIED="1360591933213" TEXT="defines a new type">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360592063531" ID="ID_44637022" MODIFIED="1360592079285" TEXT="avoid using each of types when one-of is better">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592082490" ID="ID_550796314" MODIFIED="1360592148448">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      { student_num : int,
    </p>
    <p>
      first : string,
    </p>
    <p>
      middle : string option,
    </p>
    <p>
      last : string }
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592158250" ID="ID_806060225" MODIFIED="1360592169586" TEXT="bad style">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592214256" ID="ID_105612347" MODIFIED="1360592230836" TEXT="use the student_num and ignore other fields unless the student_num is ~1">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360592247138" ID="ID_1990641509" MODIFIED="1360592267057" TEXT="gives up the benefits of the variant checking">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360592343272" ID="ID_1400175126" MODIFIED="1360592405473">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      datatype exp = Constant of int
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Negate of exp
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Add of exp * exp
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Multiply of exp * exp
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360582490854" ID="ID_1635824615" MODIFIED="1360588242151" TEXT="Self reference">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582962563" ID="ID_1335556200" MODIFIED="1360588242151" TEXT="list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360583868766" ID="ID_1314123902" MODIFIED="1360588242151" TEXT="construct to refer to by position or field">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360590399767" ID="ID_224017698" MODIFIED="1360590403710" TEXT="Pattern Matching">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360589326129" ID="ID_125697976" MODIFIED="1360595415579" TEXT="Case Expression">
<arrowlink DESTINATION="ID_1461513027" ENDARROW="Default" ENDINCLINATION="1325;0;" ID="Arrow_ID_942115172" STARTARROW="Default" STARTINCLINATION="1325;0;"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589374050" ID="ID_451320586" MODIFIED="1360589390724" TEXT="keywords">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589390725" ID="ID_970839562" MODIFIED="1360589392042" TEXT="key">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360589394062" ID="ID_1439296718" MODIFIED="1360589394864" TEXT="of">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360590171376" ID="ID_159769859" MODIFIED="1360590175877" TEXT="Patterns">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360590175878" ID="ID_754043053" MODIFIED="1360590179732" TEXT="are not expressions">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360590184784" ID="ID_789078591" MODIFIED="1360590216290" TEXT="Constructor name followed by the right number of variables">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360595440499" ID="ID_1603042469" MODIFIED="1360595442262" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589991162" ID="ID_587766825" MODIFIED="1360590065659">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      case <b>e0</b>&#160;of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<b>p1</b>&#160;=&gt; e1
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| <b>p2</b>&#160;=&gt; e2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;...
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| <b>pn</b>&#160;=&gt; en
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589539925" ID="ID_702930895" MODIFIED="1360589754245">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun f x =&#160;(* f has type mytype -&gt; int *)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;case x of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Pizza =&gt; 3
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| TwoInts(i1,i2) =&gt; i1+i2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Str s =&gt; String.size s
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589756291" ID="ID_1600129935" MODIFIED="1360589766823" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589767211" ID="ID_28393341" MODIFIED="1360589774777" TEXT="all branches must have same type">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360589808074" ID="ID_125029325" MODIFIED="1360589824485" TEXT="x is an expression. you evaluate the exp and match it">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360595677378" ID="ID_1195508857" MODIFIED="1360595702782" TEXT="1. evaluate e to a value (v)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360595703536" ID="ID_22998486" MODIFIED="1360595737654" TEXT="2. if pi is the first pattern to match v then result is evaluation of ei in env &quot;extended by the match&quot;">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360595754240" ID="ID_1145353774" MODIFIED="1360595807801" TEXT="Pattern Ci (x1, ..., xn) matches value Ci(v1, ..., vn) and extends the env with x1 to v1 ... xn to vn">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595820832" ID="ID_1512955465" MODIFIED="1360595840235" TEXT="for &quot;no data&quot; constructors, pat Ci matches value Ci">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360595502907" ID="ID_802110630" MODIFIED="1360595526372" TEXT="can use anywhere an expression goes">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595526375" ID="ID_742897915" MODIFIED="1360595539554" TEXT="does not need to be the whole function body">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360590981210" ID="ID_1099880790" MODIFIED="1360590988433" TEXT="Benefits">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360590989938" ID="ID_74206002" MODIFIED="1360591232683" TEXT="cannot forget a case">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node COLOR="#111111" CREATED="1360591488672" ID="ID_1683160984" MODIFIED="1360597817602" TEXT="Warning: match nonexhaustive">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360597892098" ID="ID_111403440" MODIFIED="1360597922995" TEXT="if you try and match a variant not specified you will get an error">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360597931778" ID="ID_857006923" MODIFIED="1360597953194" TEXT="uncaught exception Match [nonexhaustive match failure]">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360590995874" ID="ID_1123648482" MODIFIED="1360591237580" TEXT="cannot duplicate a case">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node COLOR="#111111" CREATED="1360591197575" ID="ID_191348077" MODIFIED="1360597750441" TEXT="Error: match redundant">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591151518" ID="ID_844676026" MODIFIED="1360591156632" TEXT="compile time error">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360591001691" ID="ID_1700323265" MODIFIED="1360595369389" TEXT="will not forget to test the variant correctly and get an exception (like hd [])">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360591023506" ID="ID_618544865" MODIFIED="1360591059334" TEXT="can be generalized and made more powerful, leading to elegant and concise code">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1359982527259" FOLDED="true" ID="ID_628526100" MODIFIED="1360588242151" TEXT="Racket">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161807" ID="ID_318290288" MODIFIED="1360582308899">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Racket basics
    </p>
  </body>
</html></richcontent>
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1359982533086" FOLDED="true" ID="ID_56951974" MODIFIED="1360588242152" TEXT="Ruby">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161751" ID="ID_908277988" MODIFIED="1360582308900">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Ruby basics
      </li>
    </ul>
  </body>
</html></richcontent>
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
</node>
</node>
</map>
