<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#000000" CREATED="1359982230999" ID="ID_1271875710" MODIFIED="1360282488914">
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
<font NAME="Eras Bold ITC" SIZE="48"/>
<hook NAME="accessories/plugins/AutomaticLayout.properties"/>
<node COLOR="#0033ff" CREATED="1359982377329" ID="ID_1795020779" MODIFIED="1360282488914" POSITION="right">
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
<font NAME="Georgia" SIZE="36"/>
<node COLOR="#00b439" CREATED="1360238138828" ID="ID_1039009066" MODIFIED="1360282488914" TEXT="A functional program is a just a sequence of bindings">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<icon BUILTIN="idea"/>
</node>
<node COLOR="#00b439" CREATED="1360279616734" ID="ID_1681294643" MODIFIED="1360282488915" TEXT="Avoiding mutation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360237665449" ID="ID_327473395" MODIFIED="1360282488915" TEXT="Immutable Data">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360237683576" ID="ID_1275495174" MODIFIED="1360281557639">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      This is the core of functional programming!
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161895" ID="ID_1345295613" MODIFIED="1360282488916">
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
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360279645806" ID="ID_590255026" MODIFIED="1360281557640" TEXT="be confident no one changes your code">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1360279750597" ID="ID_1480013565" MODIFIED="1360286823293" TEXT="Using functions as values">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360279930435" ID="ID_1356647071" MODIFIED="1360285669067" TEXT="First-class functions">
<font NAME="Georgia" SIZE="18"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161876" ID="ID_491676561" MODIFIED="1360288443603">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360033161863" ID="ID_1432374590" MODIFIED="1360283166191">
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
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360285441388" ID="ID_993106401" MODIFIED="1360285476264" TEXT="often polymorphic but not always">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288457456" ID="ID_76440692" MODIFIED="1360288502682">
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
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360279954516" ID="ID_160232736" MODIFIED="1360281557643" TEXT="functions are values">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360279968803" ID="ID_1297763280" MODIFIED="1360281557643" TEXT="can use them wherever we use values">
<font NAME="Arial" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360280160409" ID="ID_1955595259" MODIFIED="1360281557643" TEXT="most common use is as an argument/result  of another function">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280235474" ID="ID_133652359" MODIFIED="1360288355741">
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
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360283057960" ID="ID_1260475361" MODIFIED="1360283072219" TEXT="function as arguments">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360283092390" ID="ID_303507059" MODIFIED="1360283122003" TEXT="fun f(g,...) = g(...)">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283447075" ID="ID_305234561" MODIFIED="1360283469278" TEXT="good technique to reuse code">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360287970939" ID="ID_783793342" MODIFIED="1360287977085" TEXT="Type">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360287977546" ID="ID_323935551" MODIFIED="1360291184682">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288046266" ID="ID_1509506845" MODIFIED="1360288088918" TEXT="val n_times : (&apos;a -&gt; &apos;a) * int * &apos;a -&gt; &apos;a">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288326312" ID="ID_1677230853" MODIFIED="1360288329060" TEXT="A function of type &#x2032;a&#x2212;&gt;&#x2032;a indicates it takes one argument and returns a value of the same type as the argument.">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360288164345" ID="ID_1948875305" MODIFIED="1360288173581" TEXT="&apos;a means any type can be used">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360205516462" ID="ID_61580563" MODIFIED="1360282488919" TEXT="Closures">
<arrowlink DESTINATION="ID_1356647071" ENDARROW="Default" ENDINCLINATION="-6;24;" ID="Arrow_ID_1828335752" STARTARROW="Default" STARTINCLINATION="3;-12;"/>
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360280472759" ID="ID_771140487" MODIFIED="1360281557644" TEXT="can use bindings from outside the function definition">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360280499424" ID="ID_489499515" MODIFIED="1360281557644" TEXT="makes 1st-class functions much more powerful">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360364005729" ID="ID_55150341" MODIFIED="1360364008598" TEXT="fold">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360364012896" ID="ID_1690890120" MODIFIED="1360364019210" TEXT="private data">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360364019695" ID="ID_1402387868" MODIFIED="1360364022948" TEXT="lexical scope">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360358554152" ID="ID_1530468876" MODIFIED="1360358559584" TEXT="recomputation savings">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360292338868" ID="ID_1268681033" MODIFIED="1360292345088" TEXT="Anonymous">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360292346907" ID="ID_1082665501" MODIFIED="1360292349871" TEXT="cannot use with recursion ">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292351972" ID="ID_1977566871" MODIFIED="1360292372431" TEXT="most common use is as an argument to higher order function">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292445835" ID="ID_1797608789" MODIFIED="1360292463824" TEXT="great for use in only one place">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1360279849323" ID="ID_889804456" MODIFIED="1360282488919" TEXT="no clear yes/no for a particular language">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360279874371" ID="ID_1671089419" MODIFIED="1360282488920" TEXT="Style">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161791" ID="ID_1873965344" MODIFIED="1360282488920">
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
<font NAME="Georgia" SIZE="18"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360279779519" ID="ID_388725695" MODIFIED="1360282488920" TEXT="closer to mathematical definitions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="18"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360238258911" ID="ID_1962718393" MODIFIED="1360282488921" TEXT="Recursion affinity">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="18"/>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430637" ID="ID_629579194" MODIFIED="1360282488921" POSITION="right">
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
<font NAME="Georgia" SIZE="36"/>
<node COLOR="#00b439" CREATED="1360033223006" ID="ID_983321391" MODIFIED="1360282488921" TEXT="Idioms">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161855" ID="ID_333611860" MODIFIED="1360283155151">
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
<font NAME="Georgia" SIZE="18"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1360033227093" ID="ID_1365563441" MODIFIED="1360282488922" TEXT="Libraries">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033231542" ID="ID_1572582425" MODIFIED="1360282488922" TEXT="Tools">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360239723479" ID="ID_773106793" MODIFIED="1360282488922" TEXT="Semantics">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360239732983" ID="ID_50682881" MODIFIED="1360282488922" TEXT="What the written code means">
<font NAME="Georgia" SIZE="18"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1360245982303" ID="ID_297285607" MODIFIED="1360282488925" TEXT="Play around">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360241571299" ID="ID_817354878" MODIFIED="1360282488925" TEXT="3 Rules">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033218497" ID="ID_875308996" MODIFIED="1360282488925" TEXT="Syntax">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="18"/>
<icon BUILTIN="stop"/>
<node COLOR="#111111" CREATED="1360238767539" ID="ID_1839216680" MODIFIED="1360281557652" TEXT="type checking">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360239662960" ID="ID_942876054" MODIFIED="1360281557652" TEXT="how you write something valid">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360239813989" ID="ID_1639485916" MODIFIED="1360282488926" TEXT="Evaluation">
<font NAME="Georgia" SIZE="18"/>
<icon BUILTIN="go"/>
<node COLOR="#111111" CREATED="1360239826583" ID="ID_786276893" MODIFIED="1360281557653" TEXT="as the program runs">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360240120194" ID="ID_1136395115" MODIFIED="1360281557653" TEXT="extends the dynamic env.">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360241814745" ID="ID_1523572351" MODIFIED="1360281557653" TEXT="must type check first">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241797532" ID="ID_704096861" MODIFIED="1360281557653" TEXT="produces a value">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244179849" ID="ID_489282001" MODIFIED="1360281557654" TEXT="all values are expressions">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244237253" ID="ID_566949980" MODIFIED="1360281557654" TEXT="not all expressions are values">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244255516" ID="ID_1252301042" MODIFIED="1360281557654" TEXT="evaluates to itself in 0 steps">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360239801091" ID="ID_1559677290" MODIFIED="1360282488927" TEXT="Type Checking">
<font NAME="Georgia" SIZE="18"/>
<icon BUILTIN="prepare"/>
<node COLOR="#111111" CREATED="1360239838887" ID="ID_888927622" MODIFIED="1360281557655" TEXT="before the program runs">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360240104139" ID="ID_543078809" MODIFIED="1360281557655" TEXT="extends the static environment">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244319846" ID="ID_146160701" MODIFIED="1360281557655" TEXT="Types">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244331140" ID="ID_860706922" MODIFIED="1360281557655" TEXT="int">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244334346" ID="ID_548484441" MODIFIED="1360281557656">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      unit ( )
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244346696" ID="ID_898966498" MODIFIED="1360281557656" TEXT="the resul of using the use command in REPL">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244340228" ID="ID_1821718631" MODIFIED="1360281557656" TEXT="bool">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360247284312" ID="ID_1768979395" MODIFIED="1360281557656" TEXT="Function">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#00b439" CREATED="1360240801120" ID="ID_870681185" MODIFIED="1360282566021" TEXT="Expressions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240838543" ID="ID_533675321" MODIFIED="1360282566022" TEXT="can contain subexpressions">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360240856717" ID="ID_1026710898" MODIFIED="1360281557650" TEXT="chain subexp to make larger expressions">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240895687" ID="ID_1899943319" MODIFIED="1360282566023" TEXT="Type checking">
<font NAME="Georgia" SIZE="18"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240902832" ID="ID_1277735550" MODIFIED="1360282566023" TEXT="Evaluation rules">
<font NAME="Georgia" SIZE="18"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360241211975" ID="ID_354119442" MODIFIED="1360282566024" TEXT="Variable">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360241220275" ID="ID_865293059" MODIFIED="1360281557651" TEXT="Simplest expression">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430628" ID="ID_1435228231" MODIFIED="1360293541881" POSITION="right">
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
<font NAME="Georgia" SIZE="36"/>
<node COLOR="#00b439" CREATED="1360033161903" ID="ID_1238292414" MODIFIED="1360282488929">
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
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161882" ID="ID_944928480" MODIFIED="1360282488930">
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
<font NAME="Georgia" SIZE="18"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360248940034" ID="ID_1554032695" MODIFIED="1360282488930" TEXT="more powerful than loops">
<font NAME="Georgia" SIZE="18"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1360033161888" ID="ID_1008572280" MODIFIED="1360282488930">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161846" ID="ID_1329948428" MODIFIED="1360282488931">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161837" ID="ID_1097045453" MODIFIED="1360282488931">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161821" ID="ID_719263836" MODIFIED="1360282488932">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161800" ID="ID_1314280091" MODIFIED="1360282488932">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161784" ID="ID_431220756" MODIFIED="1360282488932">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161775" ID="ID_722622727" MODIFIED="1360282488932">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161758" ID="ID_1994567019" MODIFIED="1360282488933">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161745" ID="ID_1777262570" MODIFIED="1360282488933">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161738" ID="ID_1336278848" MODIFIED="1360282488933">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161731" ID="ID_783333515" MODIFIED="1360282488934">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161724" ID="ID_1277941858" MODIFIED="1360282488934">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161718" ID="ID_1791557834" MODIFIED="1360282488934">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161711" ID="ID_551832753" MODIFIED="1360282488934">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161704" ID="ID_139630241" MODIFIED="1360282488935">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161697" ID="ID_192820981" MODIFIED="1360282488935">
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
<font NAME="Arial" SIZE="24"/>
</node>
<node COLOR="#00b439" CREATED="1360033161683" ID="ID_541734409" MODIFIED="1360282488935">
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
<font NAME="Arial" SIZE="24"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430620" ID="ID_1783454412" MODIFIED="1360297271254" POSITION="right">
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
<font NAME="Georgia" SIZE="36"/>
<node COLOR="#00b439" CREATED="1360293066054" ID="ID_1638949918" MODIFIED="1360293076443" TEXT="Functions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360250080759" ID="ID_267825409" MODIFIED="1360293080380" TEXT="Function calls">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="18"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360279750597" ID="ID_1419365539" MODIFIED="1360297102299" TEXT="Using functions as values">
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink DESTINATION="ID_223285859" ENDARROW="Default" ENDINCLINATION="584;0;" ID="Arrow_ID_1596404302" STARTARROW="None" STARTINCLINATION="584;0;"/>
<font NAME="Arial" SIZE="12"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360292338868" ID="ID_130663740" MODIFIED="1360292847572" TEXT="Anonymous">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360292346907" ID="ID_1311954735" MODIFIED="1360292349871" TEXT="cannot use with recursion ">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292351972" ID="ID_1071664984" MODIFIED="1360292372431" TEXT="most common use is as an argument to higher order function">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292445835" ID="ID_1715354074" MODIFIED="1360292463824" TEXT="great for use in only one place">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360205516462" ID="ID_1584767849" MODIFIED="1360297056708" TEXT="Closures">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280472759" ID="ID_468020703" MODIFIED="1360281557644" TEXT="can use bindings from outside the function definition">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360280499424" ID="ID_1771214115" MODIFIED="1360281557644" TEXT="makes 1st-class functions much more powerful">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360296761774" ID="ID_979753202" MODIFIED="1360296882828" TEXT="a &apos;pair&apos;, 2 parts">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360296772819" ID="ID_1600196665" MODIFIED="1360296775493" TEXT="code">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360296775965" ID="ID_18804971" MODIFIED="1360296779525" TEXT="environment">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360302716194" ID="ID_295459354" MODIFIED="1360302721751" TEXT="Currying">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360302724066" ID="ID_1387930916" MODIFIED="1360302731254" TEXT="closure idiom">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360302745515" ID="ID_1805902983" MODIFIED="1360302771591" TEXT="take arg and return a function that takes another arg and...">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360303154151" ID="ID_1091632368" MODIFIED="1360303157336" TEXT="syntactic sugar">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161870" ID="ID_159872181" MODIFIED="1360297092189">
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
<font NAME="Arial" SIZE="12"/>
<icon BUILTIN="yes"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360150384416" ID="ID_1014542162" MODIFIED="1360296293690" TEXT="Semantics">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360148639229" ID="ID_1913484779" MODIFIED="1360281557659" TEXT="the body of a function is evaluated in the environment in which it was defined not the one from where it was called.">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360296472743" ID="ID_1749485857" MODIFIED="1360296478040" TEXT="Example">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360296478407" ID="ID_1554187860" MODIFIED="1360296684473">
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
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360299711880" ID="ID_1815392129" MODIFIED="1360299797624" TEXT="Dynamic Scope">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360299718366" ID="ID_525584557" MODIFIED="1360299730980" TEXT="use environment where function is called">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360299797624" ID="ID_338297689" MODIFIED="1360299800746" TEXT="not used much">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360300375027" ID="ID_1346595115" MODIFIED="1360300383133" TEXT="similar to raising exceptions">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360292963624" ID="ID_682671783" MODIFIED="1360293080388" TEXT="Unecessary function wrapping">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360358158848" ID="ID_1609419623" MODIFIED="1360358169436" TEXT="body is not evaluated until called">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360279930435" ID="ID_262435055" MODIFIED="1360294878350" TEXT="First-class functions">
<font NAME="Georgia" SIZE="18"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161876" ID="ID_1414150133" MODIFIED="1360288443603">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360033161863" ID="ID_723862609" MODIFIED="1360283166191">
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
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360285441388" ID="ID_1314064529" MODIFIED="1360285476264" TEXT="often polymorphic but not always">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288457456" ID="ID_251777348" MODIFIED="1360288502682">
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
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360279954516" ID="ID_223285859" MODIFIED="1360297102299" TEXT="functions are values">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360287970939" ID="ID_411307757" MODIFIED="1360287977085" TEXT="Type">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360287977546" ID="ID_35395574" MODIFIED="1360291184682">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288046266" ID="ID_1175539128" MODIFIED="1360288088918" TEXT="val n_times : (&apos;a -&gt; &apos;a) * int * &apos;a -&gt; &apos;a">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288326312" ID="ID_657188418" MODIFIED="1360288329060" TEXT="A function of type &#x2032;a&#x2212;&gt;&#x2032;a indicates it takes one argument and returns a value of the same type as the argument.">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360288164345" ID="ID_1903048264" MODIFIED="1360288173581" TEXT="&apos;a means any type can be used">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360294759962" ID="ID_146165370" MODIFIED="1360294762021" TEXT="Use">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360294717667" ID="ID_1772503323" MODIFIED="1360294725333" TEXT="can return functions as results">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294725771" ID="ID_41348300" MODIFIED="1360294751138" TEXT="can write higher-order functions that travese your own data structures">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283057960" ID="ID_775171651" MODIFIED="1360283072219" TEXT="function as arguments">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360283092390" ID="ID_1536980434" MODIFIED="1360283122003" TEXT="fun f(g,...) = g(...)">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283447075" ID="ID_1534251390" MODIFIED="1360283469278" TEXT="good technique to reuse code">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294685995" ID="ID_1382402334" MODIFIED="1360294697173" TEXT="can pass several functions as arguments">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294698068" ID="ID_1926589975" MODIFIED="1360294716211" TEXT="can put functions in data structures (list, tuples)">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360279968803" ID="ID_1080146765" MODIFIED="1360281557643" TEXT="can use them wherever we use values">
<font NAME="Arial" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360280160409" ID="ID_1773329292" MODIFIED="1360281557643" TEXT="most common use is as an argument/result  of another function">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280235474" ID="ID_1961280377" MODIFIED="1360288355741">
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
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360207705877" ID="ID_912009804" MODIFIED="1360297251994">
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
<font NAME="Georgia" SIZE="18"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204050824" ID="ID_1003407896" MODIFIED="1360292804889" TEXT="Map">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360206900923" ID="ID_525075448" MODIFIED="1360281557641">
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
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293160838" ID="ID_1855298825" MODIFIED="1360293218540" TEXT="val map : (&apos;a -&gt; &apos;b) * &apos;a list -&gt; &apos;b list">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293501228" ID="ID_638539267" MODIFIED="1360293503858" TEXT="map takes two arguments, a function and a list, and applies the function to each element of the list">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204057840" ID="ID_1455353635" MODIFIED="1360293869194" TEXT="Filter">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360206684918" ID="ID_567130293" MODIFIED="1360281557642">
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
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293652123" ID="ID_746791147" MODIFIED="1360293660601" TEXT="returns a subset">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293771946" ID="ID_1561981825" MODIFIED="1360293777367" TEXT="Type">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360293778337" ID="ID_1564379624" MODIFIED="1360293795776" TEXT="(&apos;a -&gt; bool) * &apos;a list -&gt; &apos;a list">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360293870865" ID="ID_995133773" MODIFIED="1360293874211" TEXT="filter takes two arguments, a function and a list, and applies the function to each element of the list, including the element if true">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204060048" ID="ID_1746704610" MODIFIED="1360292804892" TEXT="Fold">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360205253264" ID="ID_1962402212" MODIFIED="1360281557642">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360358734902" ID="ID_588306372" MODIFIED="1360358752023" TEXT="this goes right to left">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363300149" ID="ID_127346558" MODIFIED="1360363342492" TEXT="fun f1 xs = fold((fn (x,y) =&gt; x+y), 0, xs)">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360363342494" ID="ID_177450728" MODIFIED="1360363355742" TEXT="sums list example">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363904714" ID="ID_818974228" MODIFIED="1360363914459" TEXT="no private data use">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360363400301" ID="ID_1546561626" MODIFIED="1360363491939">
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
</html>
</richcontent>
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360363497092" ID="ID_1378338310" MODIFIED="1360363503408" TEXT="closure uses private data">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363544516" ID="ID_1132919109" MODIFIED="1360363560482" TEXT="counts items between lo and hi">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363882105" ID="ID_1287107531" MODIFIED="1360363890068" TEXT="closure makes fold more powerful">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360358645495" ID="ID_642591589" MODIFIED="1360358661904" TEXT="accumulates an answer by repeatedly applying f to a list">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360358813829" ID="ID_1647350625" MODIFIED="1360358833175" TEXT="works on different data structures tree, graph, set, array, etc.">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1360240801120" ID="ID_1977689532" MODIFIED="1360282488936" TEXT="Expressions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240838543" ID="ID_263509605" MODIFIED="1360282488936" TEXT="can contain subexpressions">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360240856717" ID="ID_1499496386" MODIFIED="1360281557666" TEXT="chain subexp to make larger expressions">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360245005569" ID="ID_1764097868" MODIFIED="1360282488937" TEXT="Kinds of Expressions">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360242113208" ID="ID_262588390" MODIFIED="1360281557667" TEXT="Addition">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360241211975" ID="ID_1303558663" MODIFIED="1360281557667" TEXT="Variable">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241220275" ID="ID_1024967488" MODIFIED="1360281557667" TEXT="Simplest expression">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244472257" ID="ID_1688797825" MODIFIED="1360281557667" TEXT="Conditional">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245054316" ID="ID_1138996395" MODIFIED="1360281557668" TEXT="Less than">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360250230304" ID="ID_511065556" MODIFIED="1360281557668" TEXT="Function calls">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276932329" ID="ID_1761191071" MODIFIED="1360281557668" TEXT="Collection">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360276941880" ID="ID_112314920" MODIFIED="1360281557668" TEXT="Tuples">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276945248" ID="ID_1279521354" MODIFIED="1360281557668" TEXT="Lists">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276908489" ID="ID_1831677667" MODIFIED="1360281557669" TEXT="need a way to collect items">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1360033161764" ID="ID_1152113752" MODIFIED="1360282488939">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Eval
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430607" ID="ID_878814675" MODIFIED="1360293580034" POSITION="right" STYLE="fork">
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
<font NAME="Georgia" SIZE="36"/>
<node COLOR="#00b439" CREATED="1359982522312" ID="ID_182957583" MODIFIED="1360282488939" TEXT="ML">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360238984907" ID="ID_1915988689" MODIFIED="1360282488940" TEXT="Dynamic &amp; Static environment">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360239002809" ID="ID_1761349363" MODIFIED="1360281557670" TEXT="Static">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360239009185" ID="ID_478573331" MODIFIED="1360281557671" TEXT="keeps track of variable types">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360247762366" ID="ID_783219452" MODIFIED="1360281557671">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <font size="13px" color="rgb(0, 0, 0)" face="sans-serif"><span style="display: inline !important; font-family: sans-serif; float: none; line-height: 19.1875px; white-space: normal; font-weight: normal; word-spacing: 0px; font-size: 13px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px">The binding of names before the program is run is called</span><span class="Apple-converted-space">&#160;</span><b style="font-family: sans-serif; line-height: 19.1875px; white-space: normal; font-size: 13px; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px">static</b></font>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360238516503" ID="ID_422150713" MODIFIED="1360281557671" TEXT="Dynamic environment">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360238533056" ID="ID_1435659147" MODIFIED="1360281557671">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      the environment you have when you're running your program
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360246448912" ID="ID_1860101807" MODIFIED="1360281557672" TEXT="Shadowing">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360246519498" ID="ID_1591562174" MODIFIED="1360281557672" TEXT="explains how variable bindings work">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360240801120" ID="ID_1482028639" MODIFIED="1360282488941" TEXT="Expressions">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360245005569" ID="ID_1993584588" MODIFIED="1360281557672" TEXT="Kinds of Expressions">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360242113208" ID="ID_28817220" MODIFIED="1360281557673" TEXT="Addition">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244472257" ID="ID_839879046" MODIFIED="1360281557673" TEXT="Conditional">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244484052" ID="ID_155437244" MODIFIED="1360281557673" TEXT="Syntax">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244499063" ID="ID_1782946491" MODIFIED="1360281557673" TEXT="if e1 then e2 else e3">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244536829" ID="ID_212029351" MODIFIED="1360281557674">
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
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244611988" ID="ID_1239891493" MODIFIED="1360281557674" TEXT="Type-checking">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244639209" ID="ID_1373974680" MODIFIED="1360281557674" TEXT="e1 must be type bool">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244653471" ID="ID_848778078" MODIFIED="1360281557675" TEXT="e2, e3 can have any type t but must be the same type t">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244745040" ID="ID_1139006463" MODIFIED="1360281557675" TEXT="Evaluation">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244756015" FOLDED="true" ID="ID_316539049" MODIFIED="1360292108330">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      evaluate&#160;e1 to a value v1
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
<icon BUILTIN="full-1"/>
</node>
<node COLOR="#111111" CREATED="1360244807157" ID="ID_1861704710" MODIFIED="1360281557675" TEXT="if it&apos;s true then e2 is the result else e3">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360245054316" ID="ID_1003857860" MODIFIED="1360281557676" TEXT="Less than">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_824789021" MODIFIED="1360281557676" TEXT="Syntax">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245068687" ID="ID_6487470" MODIFIED="1360281557676" TEXT="e1 &lt; e2">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_1833084143" MODIFIED="1360281557676" TEXT="Type-checking">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245096791" ID="ID_1307393931" MODIFIED="1360281557677" TEXT="e1 and e2 have same type int">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_1410815516" MODIFIED="1360281557677" TEXT="Evaluation">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245218685" ID="ID_1622997009" MODIFIED="1360281557677" TEXT="evaluate e2 to v1 and e2 to v2">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245179715" ID="ID_730481765" MODIFIED="1360281557677" TEXT="if v1 &lt; v2 then true else false">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360276885002" ID="ID_906408532" MODIFIED="1360281557682" TEXT="Tuples &amp; Lists">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360276997288" ID="ID_666919492" MODIFIED="1360281557682" TEXT="Tuples">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1959410498" MODIFIED="1360281557682" STYLE="fork" TEXT="Syntax">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277070632" ID="ID_1776472701" MODIFIED="1360281557683" TEXT="(e1,e2)">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_1619743197" MODIFIED="1360281557683" STYLE="fork" TEXT="Type-checking">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277081863" ID="ID_580410403" MODIFIED="1360281557683" TEXT="If e1 has type ta and e2 has type tb, then pair expression has type ta* tb">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_936342164" MODIFIED="1360281557683" STYLE="fork" TEXT="Evaluation">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277137039" ID="ID_1605223796" MODIFIED="1360281557684" TEXT="Eval e1 to v1 and e2 to v2; result is (v1,v2)">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360277185615" ID="ID_1065739060" MODIFIED="1360281557684" TEXT="is a new kind of type">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360277188718" ID="ID_17496545" MODIFIED="1360281557684" TEXT="pair of values is a value">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360277357174" ID="ID_946999057" MODIFIED="1360281557684" TEXT="Access">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1441582057" MODIFIED="1360281557685" STYLE="fork" TEXT="Syntax">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277390605" ID="ID_626384089" MODIFIED="1360281557685" TEXT="#1 e and #2e">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_969144387" MODIFIED="1360281557685" STYLE="fork" TEXT="Type-checking">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277479333" ID="ID_815094276" MODIFIED="1360281557685" TEXT="if e has type ta * tb then #1 e has type ta and #2 e has type tb">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_298765400" MODIFIED="1360281557686" STYLE="fork" TEXT="Evaluation">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277418621" ID="ID_1893484537" MODIFIED="1360281557686" TEXT="evaluate e to a pair of values and return first or second piece">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360277003640" ID="ID_1995446943" MODIFIED="1360281557686" TEXT="Lists">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277888635" ID="ID_1420604799" MODIFIED="1360281557686" TEXT="any number of elements">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1014226687" MODIFIED="1360281557687" STYLE="fork" TEXT="Syntax">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277924537" ID="ID_135622555" MODIFIED="1360281557687" TEXT="[v1, v2,...,vn]">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_161552795" MODIFIED="1360281557687" STYLE="fork" TEXT="Type-checking">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278357199" ID="ID_1733533409" MODIFIED="1360281557687" TEXT="e1::e2 e1 has type t and e2 has type t list">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278494501" ID="ID_1440689836" MODIFIED="1360281557688" TEXT="t list all elements have type t">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278532709" ID="ID_1581078460" MODIFIED="1360281557688">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      'a means <i>any</i>&#160;type
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_1925965111" MODIFIED="1360281557688" STYLE="fork" TEXT="Evaluation">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277948882" ID="ID_1145807934" MODIFIED="1360281557688" TEXT="e1::e2 adds an element to the front">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360278104921" ID="ID_750818610" MODIFIED="1360281557689" TEXT="null">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278126056" ID="ID_676240123" MODIFIED="1360281557689" TEXT="returns true if list is empty">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278676948" ID="ID_810323568" MODIFIED="1360281557689" TEXT="&apos;a list -&gt; bool">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360278167415" ID="ID_716712108" MODIFIED="1360281557689" TEXT="acessing">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278171112" ID="ID_431003745" MODIFIED="1360281557690" TEXT="hd">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278685132" ID="ID_850912887" MODIFIED="1360281557690" TEXT="&apos;a list -&gt; &apos;a">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360278175464" ID="ID_219830066" MODIFIED="1360281557690" TEXT="tl">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278178224" ID="ID_572614686" MODIFIED="1360281557690" TEXT="the rest of the list to the right of the hd">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278220055" ID="ID_479746199" MODIFIED="1360281557691" TEXT="exception e if empty">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278697037" ID="ID_1151874247" MODIFIED="1360281557691" TEXT="&apos;a list -&gt; &apos;a list">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360288632510" ID="ID_1870008175" MODIFIED="1360288638937" TEXT="Anonymous Functions">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360290690832" ID="ID_1985231392" MODIFIED="1360292161830" TEXT="fun triple_n_times (n_times(fn =&gt; 3*x),n,x)">
<font BOLD="true" NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360290829663" ID="ID_1493172640" MODIFIED="1360290842354" TEXT="fn is an expression form not a binding">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360291132309" ID="ID_755556871" MODIFIED="1360291148555" TEXT="if you used fun binding it would not compile">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360289137155" ID="ID_547505702" MODIFIED="1360289457256">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288922540" ID="ID_1294608526" MODIFIED="1360289129987">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288784088" ID="ID_237393991" MODIFIED="1360288832904">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288641046" ID="ID_1120353145" MODIFIED="1360291184682" TEXT="given the function n_times">
<arrowlink DESTINATION="ID_323935551" ENDARROW="Default" ENDINCLINATION="2408;0;" ID="Arrow_ID_949735324" STARTARROW="None" STARTINCLINATION="453;0;"/>
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360291253508" ID="ID_1989504367" MODIFIED="1360291291289">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      top level <i>triple</i>&#160;definition (poor style)
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360292226436" ID="ID_1492771571" MODIFIED="1360292252657" TEXT="Syntax">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360292254565" ID="ID_1828935685" MODIFIED="1360292291607" TEXT="fn pat =&gt; exp">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360241211975" ID="ID_865473071" MODIFIED="1360281557681" TEXT="Variable">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241220275" ID="ID_624851513" MODIFIED="1360281557681" TEXT="Simplest expression">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360239524143" ID="ID_118819988" MODIFIED="1360281557681" TEXT="variable binding">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360239532805" ID="ID_1097776630" MODIFIED="1360281557682" TEXT="val x = e">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360033161829" ID="ID_1647647581" MODIFIED="1360286761808">
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
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360286762451" ID="ID_53631507" MODIFIED="1360286777534" TEXT="inferred based on how arguments are used">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161910" ID="ID_581777638" MODIFIED="1360289561188" STYLE="fork">
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
<font NAME="Georgia" SIZE="18"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360238393585" ID="ID_440021972" MODIFIED="1360289491997" TEXT="can&apos;t use later bindings">
<font NAME="Arial" SIZE="12"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360247473754" ID="ID_1381026485" MODIFIED="1360289491997">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <font size="13px" color="rgb(0, 0, 0)" face="sans-serif"><span class="Apple-converted-space">&#160;</span><span style="display: inline !important; font-family: sans-serif; float: none; line-height: 19.1875px; white-space: normal; font-weight: normal; word-spacing: 0px; font-size: 13px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px">the association of objects (data and/or code) with</span><span class="Apple-converted-space">&#160;</span></font><u><font size="13px" face="sans-serif" color="rgb(11, 0, 128)"><a href="http://en.wikipedia.org/wiki/Identifier" style="font-family: sans-serif; background-position: initial initial; background-repeat: repeat; line-height: 19.1875px; white-space: normal; font-weight: normal; text-decoration: underline; font-size: 13px; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); background-image: none; text-transform: none; font-style: normal; color: rgb(11, 0, 128); letter-spacing: normal; text-align: start; text-indent: 0px" title="Identifier">identifiers</a></font></u><span style="font-family: sans-serif; display: inline !important; float: none; line-height: 19.1875px; white-space: normal; font-weight: normal; font-size: 13px; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px"><font size="13px" face="sans-serif" color="rgb(0, 0, 0)">.</font></span><span><sup id="cite_ref-tkac08_1-0" class="reference" style="font-family: sans-serif; line-height: 1em; white-space: normal; font-weight: normal; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px"><font face="sans-serif" color="rgb(11, 0, 128)"><a href="http://en.wikipedia.org/wiki/Name_binding#cite_note-tkac08-1" style="background-position: initial initial; background-repeat: repeat; white-space: nowrap; text-decoration: initial; background-image: none; color: rgb(11, 0, 128)">[</a></font></sup></span>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360247858091" ID="ID_1626569086" MODIFIED="1360289491998" TEXT="Kinds of Bindings">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360238387315" ID="ID_1088836687" MODIFIED="1360281557679">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      functions
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
<icon BUILTIN="yes"/>
<node COLOR="#111111" CREATED="1360248105210" ID="ID_506194620" MODIFIED="1360281557679" TEXT="fun">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360248277535" ID="ID_1048817481" MODIFIED="1360281557679" TEXT="the most important building block in the course">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360248537682" ID="ID_238604073" MODIFIED="1360281557679" TEXT="Unless a function has exactly one argument, you need to use parentheses to call it">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360248550360" ID="ID_1230768021" MODIFIED="1360281557680" TEXT="takes exactly 1 argument">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_920622251" MODIFIED="1360281557680" STYLE="fork" TEXT="Syntax">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_1794295925" MODIFIED="1360281557680" STYLE="fork" TEXT="Type-checking">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_1645328277" MODIFIED="1360281557680" STYLE="fork" TEXT="Evaluation">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360238387325" ID="ID_1878771626" MODIFIED="1360281557681">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      records
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360289520688" ID="ID_516240198" MODIFIED="1360289524270" TEXT="Variables">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360358207226" ID="ID_1601402434" MODIFIED="1360358246875" TEXT="binding evaluates its expression when the binding is evaluated not every time it is used">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360245509490" ID="ID_1360587793" MODIFIED="1360282488954" TEXT="REPL">
<font NAME="Georgia" SIZE="18"/>
<node COLOR="#111111" CREATED="1360245516195" ID="ID_1952172383" MODIFIED="1360281557692" TEXT="Error Messages">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245559135" ID="ID_818101232" MODIFIED="1360281557692" TEXT="use command">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245569762" ID="ID_932035963" MODIFIED="1360281557692" TEXT="types in the file&apos;s bindings line by line">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245651767" ID="ID_1635382740" MODIFIED="1360281557692">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Read, Eval, Print, Loop
    </p>
  </body>
</html></richcontent>
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245781759" ID="ID_926846695" MODIFIED="1360281557693" TEXT="always restart the REPL C-d">
<font NAME="Arial" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360295024160" ID="ID_738944707" MODIFIED="1360295035095" TEXT="never parentheses it doesn&apos;t have to">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360205643662" ID="ID_1187539605" MODIFIED="1360291197760">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      pattern matching
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="18"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360366734757" ID="ID_92543980" MODIFIED="1360366737601" TEXT="Idioms">
<font NAME="Georgia" SIZE="18"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360366718390" ID="ID_1252997074" MODIFIED="1360366740896" TEXT="infix">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360366907140" ID="ID_1988508449" MODIFIED="1360366910810" TEXT="o">
<font NAME="Arial" SIZE="12"/>
<node COLOR="#111111" CREATED="1360366910812" ID="ID_1165531687" MODIFIED="1360366915148" TEXT="combines functions">
<font NAME="Arial" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#00b439" CREATED="1359982527259" FOLDED="true" ID="ID_628526100" MODIFIED="1360282488955" TEXT="Racket">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161807" ID="ID_318290288" MODIFIED="1360282488955">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Racket basics
    </p>
  </body>
</html></richcontent>
<font NAME="Georgia" SIZE="18"/>
</node>
</node>
<node COLOR="#00b439" CREATED="1359982533086" FOLDED="true" ID="ID_56951974" MODIFIED="1360282488955" TEXT="Ruby">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Arial" SIZE="24"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#990000" CREATED="1360033161751" ID="ID_908277988" MODIFIED="1360282488956">
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
<font NAME="Georgia" SIZE="18"/>
</node>
</node>
</node>
</node>
</map>
