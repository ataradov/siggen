<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.3.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="6" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ataradov_mcu">
<description>Alex Taradov Library (MCUs)</description>
<packages>
<package name="SO-14">
<description>SO-14</description>
<wire x1="4.305" y1="-1.9" x2="-4.305" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-4.305" y1="-1.9" x2="-4.305" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-4.305" y1="-1.4" x2="-4.305" y2="1.9" width="0.2032" layer="51"/>
<wire x1="4.305" y1="-1.4" x2="-4.305" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="4.305" y1="1.9" x2="4.305" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="4.305" y1="-1.4" x2="4.305" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-4.305" y1="1.9" x2="4.305" y2="1.9" width="0.2032" layer="51"/>
<smd name="2" x="-2.54" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="13" x="-2.54" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-3.81" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="-1.27" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="0" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="14" x="-3.81" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="12" x="-1.27" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="11" x="0" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="2.54" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="9" x="2.54" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.27" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="3.81" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="10" x="1.27" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="3.81" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-4.826" y="0" size="1.27" layer="25" font="vector" rot="R90" align="bottom-center">&gt;NAME</text>
<text x="6.096" y="0" size="1.27" layer="27" font="vector" rot="R90" align="bottom-center">&gt;VALUE</text>
<rectangle x1="-4.0551" y1="-3.1001" x2="-3.5649" y2="-2" layer="51"/>
<rectangle x1="-2.7851" y1="-3.1001" x2="-2.2949" y2="-2" layer="51"/>
<rectangle x1="-1.5151" y1="-3.1001" x2="-1.0249" y2="-2" layer="51"/>
<rectangle x1="-0.2451" y1="-3.1001" x2="0.2451" y2="-2" layer="51"/>
<rectangle x1="-0.2451" y1="2" x2="0.2451" y2="3.1001" layer="51"/>
<rectangle x1="-1.5151" y1="2" x2="-1.0249" y2="3.1001" layer="51"/>
<rectangle x1="-2.7851" y1="2" x2="-2.2949" y2="3.1001" layer="51"/>
<rectangle x1="-4.0551" y1="2" x2="-3.5649" y2="3.1001" layer="51"/>
<rectangle x1="1.0249" y1="-3.1001" x2="1.5151" y2="-2" layer="51"/>
<rectangle x1="2.2949" y1="-3.1001" x2="2.7851" y2="-2" layer="51"/>
<rectangle x1="3.5649" y1="-3.1001" x2="4.0551" y2="-2" layer="51"/>
<rectangle x1="3.5649" y1="2" x2="4.0551" y2="3.1001" layer="51"/>
<rectangle x1="2.2949" y1="2" x2="2.7851" y2="3.1001" layer="51"/>
<rectangle x1="1.0249" y1="2" x2="1.5151" y2="3.1001" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="ATSAMDXXC">
<description>Atmel SAM D09C/D10C/D11C Cortex-M0+ microcontroller</description>
<wire x1="-12.7" y1="10.16" x2="12.7" y2="10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="10.16" x2="12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="-12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-10.16" x2="-12.7" y2="10.16" width="0.254" layer="94"/>
<pin name="PA28/RST" x="-17.78" y="-5.08" length="middle"/>
<pin name="PA8" x="-17.78" y="5.08" length="middle"/>
<pin name="PA9" x="-17.78" y="2.54" length="middle"/>
<pin name="PA14" x="-17.78" y="0" length="middle"/>
<pin name="PA15" x="-17.78" y="-2.54" length="middle"/>
<pin name="PA5" x="-17.78" y="7.62" length="middle"/>
<pin name="PA04" x="17.78" y="7.62" length="middle" rot="R180"/>
<pin name="PA02" x="17.78" y="5.08" length="middle" rot="R180"/>
<text x="0" y="10.922" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0" y="-12.192" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="PA30/SCK" x="-17.78" y="-7.62" length="middle"/>
<pin name="VDD" x="17.78" y="2.54" length="middle" rot="R180"/>
<pin name="GND" x="17.78" y="0" length="middle" rot="R180"/>
<pin name="PA25" x="17.78" y="-2.54" length="middle" rot="R180"/>
<pin name="PA24" x="17.78" y="-5.08" length="middle" rot="R180"/>
<pin name="PA31/SIO" x="17.78" y="-7.62" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ATSAMD11C" prefix="IC">
<gates>
<gate name="G$1" symbol="ATSAMDXXC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SO-14">
<connects>
<connect gate="G$1" pin="GND" pad="11"/>
<connect gate="G$1" pin="PA02" pad="13"/>
<connect gate="G$1" pin="PA04" pad="14"/>
<connect gate="G$1" pin="PA14" pad="4"/>
<connect gate="G$1" pin="PA15" pad="5"/>
<connect gate="G$1" pin="PA24" pad="9"/>
<connect gate="G$1" pin="PA25" pad="10"/>
<connect gate="G$1" pin="PA28/RST" pad="6"/>
<connect gate="G$1" pin="PA30/SCK" pad="7"/>
<connect gate="G$1" pin="PA31/SIO" pad="8"/>
<connect gate="G$1" pin="PA5" pad="1"/>
<connect gate="G$1" pin="PA8" pad="2"/>
<connect gate="G$1" pin="PA9" pad="3"/>
<connect gate="G$1" pin="VDD" pad="12"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ataradov_pwr">
<description>Alex Taradov Library (Power Symbols)</description>
<packages>
</packages>
<symbols>
<symbol name="+3V3">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="0" y="0.762" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="0" y="-2.032" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="V_BAT">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="0" y="0.762" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="V_USB" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="+3V3" prefix="P_">
<gates>
<gate name="1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="P_">
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="V_BAT" prefix="P_">
<gates>
<gate name="1" symbol="V_BAT" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ataradov_conn">
<description>Alex Taradov Library (Connectors)</description>
<packages>
<package name="PIN-TH">
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<pad name="1" x="0" y="0" drill="1.016" shape="octagon"/>
<text x="0" y="1.524" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.794" size="1.27" layer="27" font="vector" align="bottom-center">&gt;VALUE</text>
</package>
<package name="JUMPER-TH">
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="octagon"/>
<text x="0" y="1.524" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="octagon"/>
</package>
<package name="HEADER-5X2-1.27MM">
<wire x1="-3.81" y1="1.905" x2="3.81" y2="1.905" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.127" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="-3.175" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-3.175" y1="-1.905" x2="-3.81" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-1.27" x2="-3.81" y2="1.905" width="0.127" layer="21"/>
<pad name="1" x="-2.54" y="-0.635" drill="0.6604" diameter="1.0668"/>
<pad name="2" x="-2.54" y="0.635" drill="0.6604" diameter="1.0668"/>
<pad name="3" x="-1.27" y="-0.635" drill="0.6604" diameter="1.0668"/>
<pad name="4" x="-1.27" y="0.635" drill="0.6604" diameter="1.0668"/>
<pad name="5" x="0" y="-0.635" drill="0.6604" diameter="1.0668"/>
<pad name="6" x="0" y="0.635" drill="0.6604" diameter="1.0668"/>
<pad name="7" x="1.27" y="-0.635" drill="0.6604" diameter="1.0668"/>
<pad name="8" x="1.27" y="0.635" drill="0.6604" diameter="1.0668"/>
<pad name="9" x="2.54" y="-0.635" drill="0.6604" diameter="1.0668"/>
<pad name="10" x="2.54" y="0.635" drill="0.6604" diameter="1.0668"/>
<text x="0" y="2.54" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
<package name="HEADER-5X2-2.54MM">
<wire x1="-6.35" y1="0" x2="-3.81" y2="0" width="0.127" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.81" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-6.35" y1="2.54" x2="6.35" y2="2.54" width="0.127" layer="21"/>
<wire x1="6.35" y1="2.54" x2="6.35" y2="-2.54" width="0.127" layer="21"/>
<wire x1="6.35" y1="-2.54" x2="-6.35" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-2.54" x2="-6.35" y2="2.54" width="0.127" layer="21"/>
<pad name="1" x="-5.08" y="-1.27" drill="1.016" shape="square"/>
<pad name="2" x="-5.08" y="1.27" drill="1.016"/>
<pad name="3" x="-2.54" y="-1.27" drill="1.016"/>
<pad name="4" x="-2.54" y="1.27" drill="1.016"/>
<pad name="5" x="0" y="-1.27" drill="1.016"/>
<pad name="6" x="0" y="1.27" drill="1.016"/>
<pad name="7" x="2.54" y="-1.27" drill="1.016"/>
<pad name="8" x="2.54" y="1.27" drill="1.016"/>
<pad name="9" x="5.08" y="-1.27" drill="1.016"/>
<pad name="10" x="5.08" y="1.27" drill="1.016"/>
<text x="0" y="3.175" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="CONN-SINGLE">
<wire x1="-2.54" y1="0.762" x2="0.127" y2="0" width="0.254" layer="94"/>
<wire x1="0.127" y1="0" x2="-2.4765" y2="-0.762" width="0.254" layer="94"/>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<text x="1.27" y="-0.508" size="1.27" layer="95">&gt;NAME</text>
<text x="6.096" y="-0.508" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="JUMPER">
<wire x1="-1.524" y1="1.778" x2="1.524" y2="1.778" width="0.254" layer="94"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<text x="0" y="-2.286" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<wire x1="-1.016" y1="2.286" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="1.016" y1="2.286" x2="1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="1.016" y2="0" width="0.1524" layer="94"/>
</symbol>
<symbol name="HEADER-5X2">
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="-5.08" y2="7.62" width="0.254" layer="94"/>
<pin name="1" x="-7.62" y="5.08" length="short" direction="pas"/>
<pin name="2" x="7.62" y="5.08" length="short" direction="pas" rot="R180"/>
<pin name="3" x="-7.62" y="2.54" length="short" direction="pas"/>
<pin name="4" x="7.62" y="2.54" length="short" direction="pas" rot="R180"/>
<pin name="5" x="-7.62" y="0" length="short" direction="pas"/>
<pin name="6" x="7.62" y="0" length="short" direction="pas" rot="R180"/>
<pin name="7" x="-7.62" y="-2.54" length="short" direction="pas"/>
<pin name="8" x="7.62" y="-2.54" length="short" direction="pas" rot="R180"/>
<pin name="9" x="-7.62" y="-5.08" length="short" direction="pas"/>
<pin name="10" x="7.62" y="-5.08" length="short" direction="pas" rot="R180"/>
<text x="0" y="8.382" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="CONN-SINGLE" prefix="J" uservalue="yes">
<gates>
<gate name="G$1" symbol="CONN-SINGLE" x="0" y="0"/>
</gates>
<devices>
<device name="-TH" package="PIN-TH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JUMPER-TH" prefix="JP">
<gates>
<gate name="G$1" symbol="JUMPER" x="0" y="0"/>
</gates>
<devices>
<device name="-TH" package="JUMPER-TH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="HEADER-5X2" prefix="J">
<gates>
<gate name="G$1" symbol="HEADER-5X2" x="0" y="0"/>
</gates>
<devices>
<device name="-TH-1.27" package="HEADER-5X2-1.27MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-TH-2.54" package="HEADER-5X2-2.54MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ataradov_rlc">
<description>Alex Taradov Library (R, L and C)</description>
<packages>
<package name="SMD0402">
<wire x1="-1" y1="0.5" x2="1" y2="0.5" width="0.1" layer="21"/>
<wire x1="1" y1="0.5" x2="1" y2="-0.5" width="0.1" layer="21"/>
<wire x1="1" y1="-0.5" x2="-1" y2="-0.5" width="0.1" layer="21"/>
<wire x1="-1" y1="-0.5" x2="-1" y2="0.5" width="0.1" layer="21"/>
<smd name="1" x="-0.5" y="0" dx="0.6" dy="0.6" layer="1"/>
<smd name="2" x="0.5" y="0" dx="0.6" dy="0.6" layer="1"/>
<text x="0" y="0.762" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
<package name="SMD0508">
<wire x1="-1" y1="1.25" x2="1" y2="1.25" width="0.1" layer="21"/>
<wire x1="1" y1="1.25" x2="1" y2="-1.25" width="0.1" layer="21"/>
<wire x1="1" y1="-1.25" x2="-1" y2="-1.25" width="0.1" layer="21"/>
<wire x1="-1" y1="-1.25" x2="-1" y2="1.25" width="0.1" layer="21"/>
<smd name="1" x="-0.5" y="0" dx="2" dy="0.5" layer="1" rot="R90"/>
<smd name="2" x="0.5" y="0" dx="2" dy="0.5" layer="1" rot="R90"/>
<text x="0" y="1.524" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
<package name="SMD0603">
<wire x1="-1.5" y1="0.75" x2="1.5" y2="0.75" width="0.1" layer="21"/>
<wire x1="1.5" y1="0.75" x2="1.5" y2="-0.75" width="0.1" layer="21"/>
<wire x1="1.5" y1="-0.75" x2="-1.5" y2="-0.75" width="0.1" layer="21"/>
<wire x1="-1.5" y1="-0.75" x2="-1.5" y2="0.75" width="0.1" layer="21"/>
<smd name="1" x="-0.8" y="0" dx="0.9" dy="0.9" layer="1"/>
<smd name="2" x="0.8" y="0" dx="0.9" dy="0.9" layer="1"/>
<text x="0" y="1.016" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
<package name="SMD0612">
<wire x1="-1.8" y1="1.4" x2="1.8" y2="1.4" width="0.1" layer="21"/>
<wire x1="1.8" y1="1.4" x2="1.8" y2="-1.4" width="0.1" layer="21"/>
<wire x1="1.8" y1="-1.4" x2="-1.8" y2="-1.4" width="0.1" layer="21"/>
<wire x1="-1.8" y1="-1.4" x2="-1.8" y2="1.4" width="0.1" layer="21"/>
<smd name="1" x="0" y="0.8" dx="3.2" dy="0.8" layer="1"/>
<smd name="2" x="0" y="-0.8" dx="3.2" dy="0.8" layer="1"/>
<text x="0" y="1.778" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
<package name="SMD0805">
<wire x1="-2" y1="1" x2="2" y2="1" width="0.1" layer="21"/>
<wire x1="2" y1="1" x2="2" y2="-1" width="0.1" layer="21"/>
<wire x1="2" y1="-1" x2="-2" y2="-1" width="0.1" layer="21"/>
<wire x1="-2" y1="-1" x2="-2" y2="1" width="0.1" layer="21"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="0" y="1.27" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
<package name="SMD1206">
<wire x1="-2.5" y1="1.5" x2="2.5" y2="1.5" width="0.1" layer="21"/>
<wire x1="2.5" y1="1.5" x2="2.5" y2="-1.5" width="0.1" layer="21"/>
<wire x1="2.5" y1="-1.5" x2="-2.5" y2="-1.5" width="0.1" layer="21"/>
<wire x1="-2.5" y1="-1.5" x2="-2.5" y2="1.5" width="0.1" layer="21"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2" layer="1"/>
<text x="0" y="1.778" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
<package name="SMD2512">
<wire x1="-5.5" y1="2.5" x2="5.5" y2="2.5" width="0.1" layer="21"/>
<wire x1="5.5" y1="2.5" x2="5.5" y2="-2.5" width="0.1" layer="21"/>
<wire x1="5.5" y1="-2.5" x2="-5.5" y2="-2.5" width="0.1" layer="21"/>
<wire x1="-5.5" y1="-2.5" x2="-5.5" y2="2.5" width="0.1" layer="21"/>
<smd name="1" x="-3.25" y="0" dx="3.5" dy="3" layer="1" rot="R90"/>
<smd name="2" x="3.25" y="0" dx="3.5" dy="3" layer="1" rot="R90"/>
<text x="0" y="2.794" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="C">
<rectangle x1="-1.524" y1="-0.254" x2="2.54" y2="0.254" layer="94" rot="R90"/>
<rectangle x1="-2.54" y1="-0.254" x2="1.524" y2="0.254" layer="94" rot="R90"/>
<wire x1="-2.54" y1="0" x2="-0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.1524" layer="94"/>
<pin name="1" x="-2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1"/>
<pin name="2" x="2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1" rot="R180"/>
<text x="0" y="2.413" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0" y="-3.683" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
</symbol>
<symbol name="R">
<wire x1="-2.54" y1="-1.016" x2="-2.54" y2="1.016" width="0.254" layer="94"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<text x="0" y="1.524" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0" y="0" size="1.016" layer="96" align="center">&gt;VALUE</text>
<wire x1="2.54" y1="-1.016" x2="2.54" y2="1.016" width="0.254" layer="94"/>
<wire x1="-2.54" y1="1.016" x2="2.54" y2="1.016" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.016" x2="2.54" y2="-1.016" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="C" x="0" y="0"/>
</gates>
<devices>
<device name="-0402" package="SMD0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0508" package="SMD0508">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0603" package="SMD0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0612" package="SMD0612">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0805" package="SMD0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1206" package="SMD1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2512" package="SMD2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="R" x="0" y="0"/>
</gates>
<devices>
<device name="-0402" package="SMD0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0508" package="SMD0508">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0603" package="SMD0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0612" package="SMD0612">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-0805" package="SMD0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-1206" package="SMD1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-2512" package="SMD2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ataradov_crystal">
<description>Alex Taradov Library (Crystals, Oscillators, Resonators)</description>
<packages>
<package name="CTS406">
<description>6.0x3.5mm Surface Mount Crystal</description>
<wire x1="-2.475" y1="1.65" x2="-1.05" y2="1.65" width="0.2032" layer="51"/>
<wire x1="-1.05" y1="1.65" x2="1.05" y2="1.65" width="0.2032" layer="21"/>
<wire x1="1.05" y1="1.65" x2="2.475" y2="1.65" width="0.2032" layer="51"/>
<wire x1="2.9" y1="1.225" x2="2.9" y2="0.3" width="0.2032" layer="51"/>
<wire x1="2.9" y1="0.3" x2="2.9" y2="-0.3" width="0.2032" layer="21"/>
<wire x1="2.9" y1="-0.3" x2="2.9" y2="-1.225" width="0.2032" layer="51"/>
<wire x1="2.475" y1="-1.65" x2="1.05" y2="-1.65" width="0.2032" layer="51"/>
<wire x1="1.05" y1="-1.65" x2="-1.05" y2="-1.65" width="0.2032" layer="21"/>
<wire x1="-1.05" y1="-1.65" x2="-2.475" y2="-1.65" width="0.2032" layer="51"/>
<wire x1="-2.9" y1="-1.225" x2="-2.9" y2="-0.3" width="0.2032" layer="51"/>
<wire x1="-2.9" y1="-0.3" x2="-2.9" y2="0.3" width="0.2032" layer="21"/>
<wire x1="-2.9" y1="0.3" x2="-2.9" y2="1.225" width="0.2032" layer="51"/>
<wire x1="-2.9" y1="1.225" x2="-2.475" y2="1.65" width="0.2032" layer="51" curve="89.516721"/>
<wire x1="2.475" y1="1.65" x2="2.9" y2="1.225" width="0.2032" layer="51" curve="89.516721"/>
<wire x1="2.9" y1="-1.225" x2="2.475" y2="-1.65" width="0.2032" layer="51" curve="89.516721"/>
<wire x1="-2.475" y1="-1.65" x2="-2.9" y2="-1.225" width="0.2032" layer="51" curve="89.516721"/>
<circle x="-2.05" y="-0.2" radius="0.182" width="0" layer="21"/>
<smd name="1" x="-2.2" y="-1.2" dx="1.9" dy="1.4" layer="1"/>
<smd name="2" x="2.2" y="-1.2" dx="1.9" dy="1.4" layer="1"/>
<smd name="3" x="2.2" y="1.2" dx="1.9" dy="1.4" layer="1"/>
<smd name="4" x="-2.2" y="1.2" dx="1.9" dy="1.4" layer="1"/>
<text x="0" y="2.54" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="OSC">
<wire x1="-7.62" y1="5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-2.54" width="0.254" layer="94"/>
<wire x1="7.62" y1="-2.54" x2="-7.62" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-2.54" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="0" y="5.842" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0" y="-4.572" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="VCC" x="-10.16" y="2.54" length="short" direction="pwr"/>
<pin name="OUT" x="10.16" y="2.54" length="short" direction="out" rot="R180"/>
<pin name="GND" x="-10.16" y="0" length="short" direction="pwr"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="OSC" prefix="IC" uservalue="yes">
<description>Generic oscillator</description>
<gates>
<gate name="G$1" symbol="OSC" x="0" y="0"/>
</gates>
<devices>
<device name="-CTS406" package="CTS406">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="OUT" pad="3"/>
<connect gate="G$1" pin="VCC" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ataradov_semi">
<description>Alex Taradov Library (Semiconductors)</description>
<packages>
<package name="SOT23">
<description>SOT-23</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.1524" x2="-1.4224" y2="0.6604" width="0.1524" layer="21"/>
<wire x1="-1.4224" y1="0.6604" x2="-0.8636" y2="0.6604" width="0.1524" layer="21"/>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.1524" width="0.1524" layer="21"/>
<wire x1="0.8636" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="21"/>
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="0" y="2.286" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="N-MOS">
<wire x1="-1.27" y1="0" x2="-0.254" y2="0.381" width="0.1524" layer="94"/>
<wire x1="-0.254" y1="0.381" x2="-0.254" y2="-0.381" width="0.1524" layer="94"/>
<wire x1="-0.254" y1="-0.381" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="0" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="0" x2="-0.889" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.889" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.032" x2="0" y2="-2.794" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="3.048" x2="1.27" y2="3.048" width="0.1524" layer="94"/>
<wire x1="1.27" y1="3.048" x2="1.27" y2="0.762" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.762" x2="1.27" y2="0.508" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.508" x2="1.27" y2="-2.794" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.794" x2="0" y2="-2.794" width="0.1524" layer="94"/>
<wire x1="1.778" y1="0" x2="0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="0.762" y1="0" x2="1.27" y2="0.762" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.762" x2="1.778" y2="0" width="0.1524" layer="94"/>
<wire x1="1.778" y1="0.762" x2="0.762" y2="0.762" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="2.032" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="2.032" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="-2.032" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="0" x2="-0.381" y2="-0.254" width="0.254" layer="94"/>
<wire x1="-0.381" y1="-0.254" x2="-0.381" y2="0.254" width="0.254" layer="94"/>
<wire x1="-0.381" y1="0.254" x2="-0.889" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0.508" x2="1.016" y2="0.127" width="0.254" layer="94"/>
<wire x1="1.016" y1="0.127" x2="1.524" y2="0.127" width="0.254" layer="94"/>
<wire x1="1.524" y1="0.127" x2="1.27" y2="0.508" width="0.254" layer="94"/>
<circle x="0" y="-2.794" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="-2.032" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="3.048" radius="0.3592" width="0" layer="94"/>
<text x="2.54" y="0" size="1.27" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.27" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="1.27" x2="-1.524" y2="2.54" layer="94"/>
<rectangle x1="-2.032" y1="-2.54" x2="-1.524" y2="-1.27" layer="94"/>
<rectangle x1="-2.032" y1="-0.762" x2="-1.524" y2="0.762" layer="94"/>
<pin name="G" x="-5.08" y="-2.54" visible="off" length="short" direction="pas"/>
<pin name="D" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="S" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="P-MOS">
<wire x1="-0.254" y1="0" x2="-1.27" y2="0.381" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="0.381" x2="-1.27" y2="-0.381" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="-0.381" x2="-0.254" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="0" x2="-0.254" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.254" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.032" x2="0" y2="-2.794" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="0" x2="-0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="3.048" x2="1.27" y2="3.048" width="0.1524" layer="94"/>
<wire x1="1.27" y1="3.048" x2="1.27" y2="0.254" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.254" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-2.794" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.794" x2="0" y2="-2.794" width="0.1524" layer="94"/>
<wire x1="1.778" y1="0.762" x2="0.762" y2="0.762" width="0.1524" layer="94"/>
<wire x1="0.762" y1="0.762" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="1.778" y2="0.762" width="0.1524" layer="94"/>
<wire x1="1.778" y1="0" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0" x2="0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="2.032" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="2.032" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-1.524" y1="-2.032" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="0" x2="-1.143" y2="-0.254" width="0.254" layer="94"/>
<wire x1="-1.143" y1="-0.254" x2="-1.143" y2="0.254" width="0.254" layer="94"/>
<wire x1="-1.143" y1="0.254" x2="-0.635" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0.254" x2="1.016" y2="0.635" width="0.254" layer="94"/>
<wire x1="1.016" y1="0.635" x2="1.524" y2="0.635" width="0.254" layer="94"/>
<wire x1="1.524" y1="0.635" x2="1.27" y2="0.254" width="0.254" layer="94"/>
<circle x="0" y="-2.794" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="-2.032" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="3.048" radius="0.3592" width="0" layer="94"/>
<text x="2.54" y="0" size="1.27" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.27" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="1.27" x2="-1.524" y2="2.54" layer="94"/>
<rectangle x1="-2.032" y1="-2.54" x2="-1.524" y2="-1.27" layer="94"/>
<rectangle x1="-2.032" y1="-0.762" x2="-1.524" y2="0.762" layer="94"/>
<pin name="G" x="-5.08" y="-2.54" visible="off" length="short" direction="pas"/>
<pin name="D" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="S" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="SD_ARRAY_CC">
<wire x1="-3.81" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0" x2="-3.81" y2="1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="1.27" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="1.016" x2="-0.635" y2="1.27" width="0.254" layer="94"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-1.016" x2="-1.905" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-1.27" x2="-1.905" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.635" y1="-1.016" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.635" y1="-1.27" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.016" x2="1.905" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.905" y2="1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.1524" layer="94"/>
<circle x="0" y="0" radius="0.127" width="0.4064" layer="94"/>
<text x="0" y="-3.302" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0" y="-5.08" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="A1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="A2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="CC" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<wire x1="3.81" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="3.81" y2="-1.27" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.27" x2="3.81" y2="1.27" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="N-MOSFET" prefix="Q" uservalue="yes">
<description>N-CHANNEL Small Signal MOSFET</description>
<gates>
<gate name="G$1" symbol="N-MOS" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="P-MOSFET" prefix="Q" uservalue="yes">
<description>N-CHANNEL Small Signal MOSFET</description>
<gates>
<gate name="G$1" symbol="P-MOS" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="BAT54C" prefix="D">
<description>BAT54C</description>
<gates>
<gate name="G$1" symbol="SD_ARRAY_CC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="A1" pad="1"/>
<connect gate="G$1" pin="A2" pad="2"/>
<connect gate="G$1" pin="CC" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ataradov_switch">
<description>Alex Taradov Library (Switches and buttons)</description>
<packages>
<package name="TACT-SMD-6MM">
<description>6mm SMD Tact Switch</description>
<circle x="0" y="0" radius="1.2764" width="0.1016" layer="21"/>
<circle x="0" y="0" radius="1.6475" width="0.1016" layer="21"/>
<smd name="3" x="-4.2" y="-2.25" dx="1.6" dy="1.4" layer="1"/>
<smd name="4" x="4.2" y="-2.25" dx="1.6" dy="1.4" layer="1"/>
<smd name="2" x="4.2" y="2.25" dx="1.6" dy="1.4" layer="1"/>
<smd name="1" x="-4.2" y="2.25" dx="1.6" dy="1.4" layer="1"/>
<text x="0" y="3.302" size="1.27" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
<rectangle x1="-3.9925" y1="1.6772" x2="-2.7755" y2="2.4341" layer="51"/>
<rectangle x1="-3.9925" y1="-2.4341" x2="-2.7903" y2="-1.6623" layer="51"/>
<rectangle x1="2.7755" y1="-2.4192" x2="3.9925" y2="-1.6623" layer="51"/>
<rectangle x1="2.7903" y1="1.6772" x2="3.9925" y2="2.4341" layer="51"/>
<rectangle x1="-3.3246" y1="1.6771" x2="-2.7755" y2="2.4341" layer="21"/>
<rectangle x1="-3.3246" y1="-2.4341" x2="-2.7903" y2="-1.6623" layer="21"/>
<rectangle x1="2.7903" y1="1.6771" x2="3.3246" y2="2.4341" layer="21"/>
<rectangle x1="2.7755" y1="-2.4192" x2="3.3246" y2="-1.6623" layer="21"/>
<circle x="-1.778" y="1.778" radius="0.381" width="0.1016" layer="21"/>
<circle x="1.778" y="1.778" radius="0.381" width="0.1016" layer="21"/>
<circle x="1.778" y="-1.778" radius="0.381" width="0.1016" layer="21"/>
<circle x="-1.778" y="-1.778" radius="0.381" width="0.1016" layer="21"/>
<wire x1="2.794" y1="3.048" x2="2.794" y2="2.794" width="0.127" layer="21"/>
<wire x1="2.794" y1="2.794" x2="2.794" y2="-2.794" width="0.127" layer="21"/>
<wire x1="2.794" y1="-2.794" x2="2.794" y2="-3.048" width="0.127" layer="21"/>
<wire x1="2.794" y1="-3.048" x2="1.016" y2="-3.048" width="0.127" layer="21"/>
<wire x1="1.016" y1="-3.048" x2="-1.016" y2="-3.048" width="0.127" layer="21"/>
<wire x1="-1.016" y1="-3.048" x2="-2.794" y2="-3.048" width="0.127" layer="21"/>
<wire x1="-2.794" y1="-3.048" x2="-2.794" y2="-2.794" width="0.127" layer="21"/>
<wire x1="-2.794" y1="-2.794" x2="-2.794" y2="2.794" width="0.127" layer="21"/>
<wire x1="-2.794" y1="2.794" x2="-2.794" y2="3.048" width="0.127" layer="21"/>
<wire x1="-2.794" y1="3.048" x2="-1.016" y2="3.048" width="0.127" layer="21"/>
<wire x1="-1.016" y1="3.048" x2="1.016" y2="3.048" width="0.127" layer="21"/>
<wire x1="1.016" y1="3.048" x2="2.794" y2="3.048" width="0.127" layer="21"/>
<wire x1="-2.794" y1="2.794" x2="-1.016" y2="2.794" width="0.127" layer="21"/>
<wire x1="-1.016" y1="2.794" x2="-1.016" y2="2.54" width="0.127" layer="21"/>
<wire x1="-1.016" y1="2.54" x2="1.016" y2="2.54" width="0.127" layer="21"/>
<wire x1="1.016" y1="2.54" x2="1.016" y2="2.794" width="0.127" layer="21"/>
<wire x1="1.016" y1="2.794" x2="2.794" y2="2.794" width="0.127" layer="21"/>
<wire x1="-1.016" y1="2.794" x2="-1.016" y2="3.048" width="0.127" layer="21"/>
<wire x1="1.016" y1="2.794" x2="1.016" y2="3.048" width="0.127" layer="21"/>
<wire x1="-2.794" y1="-2.794" x2="-1.016" y2="-2.794" width="0.127" layer="21"/>
<wire x1="-1.016" y1="-2.794" x2="-1.016" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-1.016" y1="-2.54" x2="1.016" y2="-2.54" width="0.127" layer="21"/>
<wire x1="1.016" y1="-2.54" x2="1.016" y2="-2.794" width="0.127" layer="21"/>
<wire x1="1.016" y1="-2.794" x2="2.794" y2="-2.794" width="0.127" layer="21"/>
<wire x1="1.016" y1="-2.794" x2="1.016" y2="-3.048" width="0.127" layer="21"/>
<wire x1="-1.016" y1="-2.794" x2="-1.016" y2="-3.048" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="TACT_SWITCH">
<wire x1="-1.27" y1="0" x2="3.048" y2="1.778" width="0.2032" layer="94"/>
<wire x1="3.048" y1="0.508" x2="3.048" y2="0" width="0.2032" layer="94"/>
<wire x1="0.762" y1="1.016" x2="0.762" y2="1.524" width="0.2032" layer="94"/>
<wire x1="0.762" y1="2.032" x2="0.762" y2="2.794" width="0.2032" layer="94"/>
<wire x1="0.762" y1="2.794" x2="0.762" y2="3.048" width="0.2032" layer="94"/>
<wire x1="0.762" y1="3.556" x2="0.762" y2="4.064" width="0.2032" layer="94"/>
<wire x1="1.27" y1="4.064" x2="0.762" y2="4.064" width="0.2032" layer="94"/>
<wire x1="0.762" y1="4.064" x2="0.254" y2="4.064" width="0.2032" layer="94"/>
<wire x1="0.254" y1="2.286" x2="0.762" y2="2.794" width="0.1524" layer="94"/>
<wire x1="0.762" y1="2.794" x2="1.27" y2="2.286" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.2032" layer="94"/>
<wire x1="3.048" y1="0" x2="5.08" y2="0" width="0.2032" layer="94"/>
<text x="0.762" y="4.572" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0.762" y="-1.778" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="7.62" y="0" visible="off" length="short" direction="pas" swaplevel="2" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TACT_SWITCH_6MM" prefix="S" uservalue="yes">
<gates>
<gate name="G$1" symbol="TACT_SWITCH" x="0" y="0"/>
</gates>
<devices>
<device name="-SMD" package="TACT-SMD-6MM">
<connects>
<connect gate="G$1" pin="1" pad="1 2" route="any"/>
<connect gate="G$1" pin="2" pad="3 4" route="any"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ataradov_ic">
<description>Alex Taradov Library (ICs)</description>
<packages>
<package name="SC70">
<description>SC-70 Package</description>
<wire x1="-1.1" y1="0.5" x2="1.1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="1.1" y1="0.5" x2="1.1" y2="-0.5" width="0.2032" layer="21"/>
<wire x1="1.1" y1="-0.5" x2="-1.1" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="-1.1" y1="-0.5" x2="-1.1" y2="0.5" width="0.2032" layer="21"/>
<circle x="-0.65" y="-0.2" radius="0.15" width="0" layer="21"/>
<smd name="1" x="-0.65" y="-0.85" dx="0.35" dy="0.8" layer="1"/>
<smd name="2" x="0" y="-0.85" dx="0.35" dy="0.8" layer="1"/>
<smd name="3" x="0.65" y="-0.85" dx="0.35" dy="0.8" layer="1"/>
<smd name="4" x="0.65" y="0.85" dx="0.35" dy="0.8" layer="1"/>
<smd name="5" x="0" y="0.85" dx="0.35" dy="0.8" layer="1"/>
<smd name="6" x="-0.65" y="0.85" dx="0.35" dy="0.8" layer="1"/>
<text x="0" y="1.524" size="1.016" layer="25" font="vector" align="bottom-center">&gt;NAME</text>
<rectangle x1="-0.8" y1="-1.1" x2="-0.5" y2="-0.6" layer="51"/>
<rectangle x1="-0.15" y1="-1.1" x2="0.15" y2="-0.6" layer="51"/>
<rectangle x1="0.5" y1="-1.1" x2="0.8" y2="-0.6" layer="51"/>
<rectangle x1="0.5" y1="0.6" x2="0.8" y2="1.1" layer="51"/>
<rectangle x1="-0.15" y1="0.6" x2="0.15" y2="1.1" layer="51"/>
<rectangle x1="-0.8" y1="0.6" x2="-0.5" y2="1.1" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="NC7WZ17">
<wire x1="-7.62" y1="5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="0" y="5.842" size="1.27" layer="95" align="bottom-center">&gt;NAME</text>
<text x="0" y="-7.112" size="1.27" layer="96" align="bottom-center">&gt;VALUE</text>
<pin name="I1" x="-10.16" y="2.54" length="short" direction="in"/>
<pin name="I2" x="-10.16" y="0" length="short" direction="in"/>
<pin name="O2" x="10.16" y="0" length="short" direction="out" rot="R180"/>
<pin name="O1" x="10.16" y="2.54" length="short" direction="out" rot="R180"/>
<pin name="VCC" x="10.16" y="-2.54" length="short" direction="pwr" rot="R180"/>
<pin name="GND" x="-10.16" y="-2.54" length="short" direction="pwr"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="NC7WZ17" prefix="IC">
<gates>
<gate name="G$1" symbol="NC7WZ17" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SC70">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="I1" pad="1"/>
<connect gate="G$1" pin="I2" pad="3"/>
<connect gate="G$1" pin="O1" pad="6"/>
<connect gate="G$1" pin="O2" pad="4"/>
<connect gate="G$1" pin="VCC" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC2" library="ataradov_mcu" deviceset="ATSAMD11C" device=""/>
<part name="P_27" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="C2" library="ataradov_rlc" deviceset="C" device="-0603" value="100nF"/>
<part name="C3" library="ataradov_rlc" deviceset="C" device="-0603" value="100nF"/>
<part name="R6" library="ataradov_rlc" deviceset="R" device="-0603" value="10K"/>
<part name="R1" library="ataradov_rlc" deviceset="R" device="-0603" value="10K"/>
<part name="P_33" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="IC3" library="ataradov_crystal" deviceset="OSC" device="-CTS406" value="FOX924B-12.000"/>
<part name="Q2" library="ataradov_semi" deviceset="N-MOSFET" device=""/>
<part name="Q1" library="ataradov_semi" deviceset="P-MOSFET" device=""/>
<part name="D1" library="ataradov_semi" deviceset="BAT54C" device=""/>
<part name="S1" library="ataradov_switch" deviceset="TACT_SWITCH_6MM" device="-SMD"/>
<part name="S3" library="ataradov_switch" deviceset="TACT_SWITCH_6MM" device="-SMD"/>
<part name="S4" library="ataradov_switch" deviceset="TACT_SWITCH_6MM" device="-SMD"/>
<part name="S5" library="ataradov_switch" deviceset="TACT_SWITCH_6MM" device="-SMD"/>
<part name="S2" library="ataradov_switch" deviceset="TACT_SWITCH_6MM" device="-SMD" value="BTN_C"/>
<part name="IC1" library="ataradov_ic" deviceset="NC7WZ17" device=""/>
<part name="R5" library="ataradov_rlc" deviceset="R" device="-0603" value="100K"/>
<part name="R8" library="ataradov_rlc" deviceset="R" device="-0603" value="100K"/>
<part name="J1" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH"/>
<part name="J2" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH"/>
<part name="P_15" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_6" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_14" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_16" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="R2" library="ataradov_rlc" deviceset="R" device="-0603" value="10K"/>
<part name="R3" library="ataradov_rlc" deviceset="R" device="-0603" value="10K"/>
<part name="R4" library="ataradov_rlc" deviceset="R" device="-0603" value="10K"/>
<part name="P_7" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_1" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_2" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_3" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_4" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_10" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_9" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_21" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_17" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_20" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_18" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="J3" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH" value="OUT"/>
<part name="J4" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH" value="GND"/>
<part name="J5" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH" value="IN"/>
<part name="J6" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH" value="GND"/>
<part name="P_19" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_22" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_11" library="ataradov_pwr" deviceset="V_BAT" device=""/>
<part name="P_12" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="JP2" library="ataradov_conn" deviceset="JUMPER-TH" device="-TH"/>
<part name="J11" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH"/>
<part name="J12" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH"/>
<part name="J13" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH"/>
<part name="J14" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH"/>
<part name="P_47" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="R12" library="ataradov_rlc" deviceset="R" device="-0603" value="1K"/>
<part name="R11" library="ataradov_rlc" deviceset="R" device="-0603" value="1K"/>
<part name="P_38" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_39" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_40" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="C4" library="ataradov_rlc" deviceset="C" device="-0603" value="100nF"/>
<part name="C5" library="ataradov_rlc" deviceset="C" device="-0603" value="100nF"/>
<part name="C6" library="ataradov_rlc" deviceset="C" device="-0603" value="1uF"/>
<part name="C7" library="ataradov_rlc" deviceset="C" device="-0603" value="1uF"/>
<part name="P_23" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_24" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_25" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_26" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_34" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_35" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_28" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_29" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_30" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_31" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_42" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_43" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="C8" library="ataradov_rlc" deviceset="C" device="-0805" value="10uF"/>
<part name="C9" library="ataradov_rlc" deviceset="C" device="-0805" value="10uF"/>
<part name="P_36" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_37" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_44" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="P_45" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="R9" library="ataradov_rlc" deviceset="R" device="-0603" value="0"/>
<part name="R10" library="ataradov_rlc" deviceset="R" device="-0603" value="0"/>
<part name="J10" library="ataradov_conn" deviceset="HEADER-5X2" device="-TH-1.27"/>
<part name="JP1" library="ataradov_conn" deviceset="JUMPER-TH" device="-TH"/>
<part name="P_41" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_46" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="R7" library="ataradov_rlc" deviceset="R" device="-0603" value="10K"/>
<part name="P_8" library="ataradov_pwr" deviceset="+3V3" device=""/>
<part name="P_13" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="C1" library="ataradov_rlc" deviceset="C" device="-0603" value="100nF"/>
<part name="P_5" library="ataradov_pwr" deviceset="V_BAT" device=""/>
<part name="J8" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH" value="TX"/>
<part name="J9" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH" value="GND"/>
<part name="P_32" library="ataradov_pwr" deviceset="GND" device=""/>
<part name="J7" library="ataradov_conn" deviceset="CONN-SINGLE" device="-TH" value="RX"/>
</parts>
<sheets>
<sheet>
<plain>
<frame x1="0" y1="0" x2="203.2" y2="152.4" columns="8" rows="5" layer="97"/>
<text x="10.16" y="10.16" size="1.778" layer="97">Copyright (c) 2017, Alex Taradov &lt;alex@taradov.com&gt;

MCU firmware source code is available at https://github.com/ataradov/siggen</text>
</plain>
<instances>
<instance part="IC2" gate="G$1" x="50.8" y="78.74"/>
<instance part="P_27" gate="1" x="60.96" y="58.42"/>
<instance part="C2" gate="G$1" x="17.78" y="53.34" rot="R90"/>
<instance part="C3" gate="G$1" x="25.4" y="53.34" rot="R90"/>
<instance part="R6" gate="G$1" x="86.36" y="127" rot="R90"/>
<instance part="R1" gate="G$1" x="154.94" y="132.08" rot="R90"/>
<instance part="P_33" gate="1" x="60.96" y="45.72"/>
<instance part="IC3" gate="G$1" x="73.66" y="50.8"/>
<instance part="Q2" gate="G$1" x="53.34" y="114.3" rot="MR0"/>
<instance part="Q1" gate="G$1" x="55.88" y="132.08" rot="MR90"/>
<instance part="D1" gate="G$1" x="63.5" y="121.92" rot="MR90"/>
<instance part="S1" gate="G$1" x="177.8" y="124.46"/>
<instance part="S3" gate="G$1" x="177.8" y="116.84"/>
<instance part="S4" gate="G$1" x="177.8" y="109.22"/>
<instance part="S5" gate="G$1" x="177.8" y="101.6"/>
<instance part="S2" gate="G$1" x="71.12" y="121.92"/>
<instance part="IC1" gate="G$1" x="124.46" y="83.82"/>
<instance part="R5" gate="G$1" x="45.72" y="127"/>
<instance part="R8" gate="G$1" x="63.5" y="106.68" rot="R90"/>
<instance part="J1" gate="G$1" x="15.24" y="132.08" rot="MR0"/>
<instance part="J2" gate="G$1" x="15.24" y="129.54" rot="MR0"/>
<instance part="P_15" gate="1" x="63.5" y="99.06"/>
<instance part="P_6" gate="1" x="63.5" y="137.16"/>
<instance part="P_14" gate="1" x="53.34" y="99.06"/>
<instance part="P_16" gate="1" x="187.96" y="99.06"/>
<instance part="R2" gate="G$1" x="160.02" y="132.08" rot="R90"/>
<instance part="R3" gate="G$1" x="165.1" y="132.08" rot="R90"/>
<instance part="R4" gate="G$1" x="170.18" y="132.08" rot="R90"/>
<instance part="P_7" gate="1" x="86.36" y="137.16"/>
<instance part="P_1" gate="1" x="154.94" y="139.7"/>
<instance part="P_2" gate="1" x="160.02" y="139.7"/>
<instance part="P_3" gate="1" x="165.1" y="139.7"/>
<instance part="P_4" gate="1" x="170.18" y="139.7"/>
<instance part="P_10" gate="1" x="78.74" y="119.38"/>
<instance part="P_9" gate="1" x="20.32" y="124.46"/>
<instance part="P_21" gate="1" x="83.82" y="68.58"/>
<instance part="P_17" gate="1" x="83.82" y="91.44"/>
<instance part="P_20" gate="1" x="111.76" y="76.2"/>
<instance part="P_18" gate="1" x="137.16" y="91.44"/>
<instance part="J3" gate="G$1" x="180.34" y="86.36"/>
<instance part="J4" gate="G$1" x="180.34" y="83.82"/>
<instance part="J5" gate="G$1" x="180.34" y="71.12"/>
<instance part="J6" gate="G$1" x="180.34" y="68.58"/>
<instance part="P_19" gate="1" x="175.26" y="81.28"/>
<instance part="P_22" gate="1" x="175.26" y="66.04"/>
<instance part="P_11" gate="1" x="20.32" y="111.76"/>
<instance part="P_12" gate="1" x="35.56" y="111.76"/>
<instance part="JP2" gate="G$1" x="27.94" y="106.68"/>
<instance part="J11" gate="G$1" x="111.76" y="25.4"/>
<instance part="J12" gate="G$1" x="111.76" y="22.86"/>
<instance part="J13" gate="G$1" x="111.76" y="20.32"/>
<instance part="J14" gate="G$1" x="111.76" y="17.78"/>
<instance part="P_47" gate="1" x="106.68" y="15.24"/>
<instance part="R12" gate="G$1" x="101.6" y="33.02" rot="R90"/>
<instance part="R11" gate="G$1" x="96.52" y="33.02" rot="R90"/>
<instance part="P_38" gate="1" x="96.52" y="40.64"/>
<instance part="P_39" gate="1" x="101.6" y="40.64"/>
<instance part="P_40" gate="1" x="106.68" y="40.64"/>
<instance part="C4" gate="G$1" x="33.02" y="53.34" rot="R90"/>
<instance part="C5" gate="G$1" x="40.64" y="53.34" rot="R90"/>
<instance part="C6" gate="G$1" x="17.78" y="35.56" rot="R90"/>
<instance part="C7" gate="G$1" x="25.4" y="35.56" rot="R90"/>
<instance part="P_23" gate="1" x="17.78" y="58.42"/>
<instance part="P_24" gate="1" x="25.4" y="58.42"/>
<instance part="P_25" gate="1" x="33.02" y="58.42"/>
<instance part="P_26" gate="1" x="40.64" y="58.42"/>
<instance part="P_34" gate="1" x="17.78" y="40.64"/>
<instance part="P_35" gate="1" x="25.4" y="40.64"/>
<instance part="P_28" gate="1" x="17.78" y="48.26"/>
<instance part="P_29" gate="1" x="25.4" y="48.26"/>
<instance part="P_30" gate="1" x="33.02" y="48.26"/>
<instance part="P_31" gate="1" x="40.64" y="48.26"/>
<instance part="P_42" gate="1" x="17.78" y="30.48"/>
<instance part="P_43" gate="1" x="25.4" y="30.48"/>
<instance part="C8" gate="G$1" x="33.02" y="35.56" rot="R90"/>
<instance part="C9" gate="G$1" x="40.64" y="35.56" rot="R90"/>
<instance part="P_36" gate="1" x="33.02" y="40.64"/>
<instance part="P_37" gate="1" x="40.64" y="40.64"/>
<instance part="P_44" gate="1" x="33.02" y="30.48"/>
<instance part="P_45" gate="1" x="40.64" y="30.48"/>
<instance part="R9" gate="G$1" x="134.62" y="66.04"/>
<instance part="R10" gate="G$1" x="134.62" y="60.96"/>
<instance part="J10" gate="G$1" x="147.32" y="30.48"/>
<instance part="JP1" gate="G$1" x="27.94" y="132.08"/>
<instance part="P_41" gate="1" x="137.16" y="40.64"/>
<instance part="P_46" gate="1" x="137.16" y="20.32"/>
<instance part="R7" gate="G$1" x="111.76" y="127" rot="R90"/>
<instance part="P_8" gate="1" x="111.76" y="137.16"/>
<instance part="P_13" gate="1" x="111.76" y="106.68"/>
<instance part="C1" gate="G$1" x="111.76" y="114.3" rot="R90"/>
<instance part="P_5" gate="1" x="40.64" y="137.16"/>
<instance part="J8" gate="G$1" x="180.34" y="53.34"/>
<instance part="J9" gate="G$1" x="180.34" y="50.8"/>
<instance part="P_32" gate="1" x="175.26" y="48.26"/>
<instance part="J7" gate="G$1" x="180.34" y="55.88"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<pinref part="P_15" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="Q2" gate="G$1" pin="S"/>
<pinref part="P_14" gate="1" pin="GND"/>
<wire x1="53.34" y1="109.22" x2="53.34" y2="101.6" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="S1" gate="G$1" pin="2"/>
<wire x1="185.42" y1="124.46" x2="187.96" y2="124.46" width="0.1524" layer="91"/>
<wire x1="187.96" y1="124.46" x2="187.96" y2="116.84" width="0.1524" layer="91"/>
<wire x1="187.96" y1="116.84" x2="187.96" y2="109.22" width="0.1524" layer="91"/>
<wire x1="187.96" y1="109.22" x2="187.96" y2="101.6" width="0.1524" layer="91"/>
<pinref part="S5" gate="G$1" pin="2"/>
<wire x1="185.42" y1="101.6" x2="187.96" y2="101.6" width="0.1524" layer="91"/>
<pinref part="S4" gate="G$1" pin="2"/>
<wire x1="185.42" y1="109.22" x2="187.96" y2="109.22" width="0.1524" layer="91"/>
<pinref part="S3" gate="G$1" pin="2"/>
<wire x1="185.42" y1="116.84" x2="187.96" y2="116.84" width="0.1524" layer="91"/>
<junction x="187.96" y="101.6"/>
<junction x="187.96" y="109.22"/>
<junction x="187.96" y="116.84"/>
<pinref part="P_16" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="GND"/>
<wire x1="63.5" y1="50.8" x2="60.96" y2="50.8" width="0.1524" layer="91"/>
<pinref part="P_33" gate="1" pin="GND"/>
<wire x1="60.96" y1="50.8" x2="60.96" y2="48.26" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="S2" gate="G$1" pin="2"/>
<pinref part="P_10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="17.78" y1="129.54" x2="20.32" y2="129.54" width="0.1524" layer="91"/>
<wire x1="20.32" y1="129.54" x2="20.32" y2="127" width="0.1524" layer="91"/>
<pinref part="P_9" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="GND"/>
<wire x1="68.58" y1="78.74" x2="83.82" y2="78.74" width="0.1524" layer="91"/>
<pinref part="P_21" gate="1" pin="GND"/>
<wire x1="83.82" y1="78.74" x2="83.82" y2="71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="GND"/>
<pinref part="P_20" gate="1" pin="GND"/>
<wire x1="114.3" y1="81.28" x2="111.76" y2="81.28" width="0.1524" layer="91"/>
<wire x1="111.76" y1="81.28" x2="111.76" y2="78.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J6" gate="G$1" pin="1"/>
<pinref part="P_22" gate="1" pin="GND"/>
<wire x1="177.8" y1="68.58" x2="175.26" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J4" gate="G$1" pin="1"/>
<pinref part="P_19" gate="1" pin="GND"/>
<wire x1="177.8" y1="83.82" x2="175.26" y2="83.82" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J14" gate="G$1" pin="1"/>
<wire x1="109.22" y1="17.78" x2="106.68" y2="17.78" width="0.1524" layer="91"/>
<pinref part="P_47" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="1"/>
<pinref part="P_28" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="1"/>
<pinref part="P_29" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="1"/>
<pinref part="P_30" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="1"/>
<pinref part="P_42" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="1"/>
<pinref part="P_43" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="1"/>
<pinref part="P_31" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="1"/>
<pinref part="P_44" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="1"/>
<pinref part="P_45" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="J10" gate="G$1" pin="3"/>
<wire x1="139.7" y1="33.02" x2="137.16" y2="33.02" width="0.1524" layer="91"/>
<pinref part="P_46" gate="1" pin="GND"/>
<wire x1="137.16" y1="33.02" x2="137.16" y2="30.48" width="0.1524" layer="91"/>
<pinref part="J10" gate="G$1" pin="5"/>
<wire x1="137.16" y1="30.48" x2="137.16" y2="25.4" width="0.1524" layer="91"/>
<wire x1="137.16" y1="25.4" x2="137.16" y2="22.86" width="0.1524" layer="91"/>
<wire x1="139.7" y1="30.48" x2="137.16" y2="30.48" width="0.1524" layer="91"/>
<pinref part="J10" gate="G$1" pin="9"/>
<wire x1="139.7" y1="25.4" x2="137.16" y2="25.4" width="0.1524" layer="91"/>
<junction x="137.16" y="30.48"/>
<junction x="137.16" y="25.4"/>
</segment>
<segment>
<pinref part="P_13" gate="1" pin="GND"/>
<wire x1="111.76" y1="109.22" x2="111.76" y2="111.76" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="J9" gate="G$1" pin="1"/>
<pinref part="P_32" gate="1" pin="GND"/>
<wire x1="177.8" y1="50.8" x2="175.26" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="D"/>
<wire x1="60.96" y1="132.08" x2="63.5" y2="132.08" width="0.1524" layer="91"/>
<pinref part="P_6" gate="1" pin="+3V3"/>
<wire x1="63.5" y1="132.08" x2="63.5" y2="134.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="2"/>
<pinref part="P_7" gate="1" pin="+3V3"/>
<wire x1="86.36" y1="132.08" x2="86.36" y2="134.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="P_1" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="P_2" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="P_3" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="2"/>
<pinref part="P_4" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="P_27" gate="1" pin="+3V3"/>
<wire x1="60.96" y1="55.88" x2="60.96" y2="53.34" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="VCC"/>
<wire x1="60.96" y1="53.34" x2="63.5" y2="53.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="VDD"/>
<wire x1="68.58" y1="81.28" x2="83.82" y2="81.28" width="0.1524" layer="91"/>
<pinref part="P_17" gate="1" pin="+3V3"/>
<wire x1="83.82" y1="81.28" x2="83.82" y2="88.9" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="VCC"/>
<wire x1="134.62" y1="81.28" x2="137.16" y2="81.28" width="0.1524" layer="91"/>
<pinref part="P_18" gate="1" pin="+3V3"/>
<wire x1="137.16" y1="81.28" x2="137.16" y2="88.9" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="JP2" gate="G$1" pin="2"/>
<pinref part="P_12" gate="1" pin="+3V3"/>
<wire x1="35.56" y1="109.22" x2="35.56" y2="106.68" width="0.1524" layer="91"/>
<wire x1="35.56" y1="106.68" x2="33.02" y2="106.68" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="2"/>
<pinref part="P_38" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="2"/>
<pinref part="P_39" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="J13" gate="G$1" pin="1"/>
<wire x1="109.22" y1="20.32" x2="106.68" y2="20.32" width="0.1524" layer="91"/>
<wire x1="106.68" y1="20.32" x2="106.68" y2="38.1" width="0.1524" layer="91"/>
<pinref part="P_40" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="P_23" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="P_24" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="P_25" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="P_26" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="P_34" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<pinref part="P_35" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="P_36" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="P_37" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="P_41" gate="1" pin="+3V3"/>
<wire x1="137.16" y1="38.1" x2="137.16" y2="35.56" width="0.1524" layer="91"/>
<pinref part="J10" gate="G$1" pin="1"/>
<wire x1="137.16" y1="35.56" x2="139.7" y2="35.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="P_8" gate="1" pin="+3V3"/>
<wire x1="111.76" y1="132.08" x2="111.76" y2="134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="RESET" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA28/RST"/>
<wire x1="33.02" y1="73.66" x2="30.48" y2="73.66" width="0.1524" layer="91"/>
<label x="30.48" y="73.66" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="J10" gate="G$1" pin="10"/>
<wire x1="154.94" y1="25.4" x2="157.48" y2="25.4" width="0.1524" layer="91"/>
<label x="157.48" y="25.4" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="111.76" y1="116.84" x2="111.76" y2="119.38" width="0.1524" layer="91"/>
<wire x1="111.76" y1="119.38" x2="111.76" y2="121.92" width="0.1524" layer="91"/>
<wire x1="111.76" y1="119.38" x2="116.84" y2="119.38" width="0.1524" layer="91"/>
<junction x="111.76" y="119.38"/>
<pinref part="C1" gate="G$1" pin="2"/>
<label x="116.84" y="119.38" size="1.27" layer="95"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="G"/>
<pinref part="Q2" gate="G$1" pin="D"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="53.34" y1="127" x2="53.34" y2="119.38" width="0.1524" layer="91"/>
<wire x1="50.8" y1="127" x2="53.34" y2="127" width="0.1524" layer="91"/>
<junction x="53.34" y="127"/>
<pinref part="D1" gate="G$1" pin="A2"/>
<wire x1="63.5" y1="127" x2="53.34" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PWR_EN" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="G"/>
<wire x1="58.42" y1="111.76" x2="63.5" y2="111.76" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
<wire x1="63.5" y1="111.76" x2="88.9" y2="111.76" width="0.1524" layer="91"/>
<junction x="63.5" y="111.76"/>
<label x="88.9" y="111.76" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA02"/>
<wire x1="68.58" y1="83.82" x2="71.12" y2="83.82" width="0.1524" layer="91"/>
<label x="71.12" y="83.82" size="1.27" layer="95"/>
</segment>
</net>
<net name="V_BAT" class="0">
<segment>
<pinref part="JP2" gate="G$1" pin="1"/>
<pinref part="P_11" gate="1" pin="V_USB"/>
<wire x1="20.32" y1="109.22" x2="20.32" y2="106.68" width="0.1524" layer="91"/>
<wire x1="20.32" y1="106.68" x2="22.86" y2="106.68" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="40.64" y1="127" x2="40.64" y2="132.08" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="S"/>
<wire x1="50.8" y1="132.08" x2="40.64" y2="132.08" width="0.1524" layer="91"/>
<junction x="40.64" y="132.08"/>
<pinref part="JP1" gate="G$1" pin="2"/>
<wire x1="33.02" y1="132.08" x2="40.64" y2="132.08" width="0.1524" layer="91"/>
<pinref part="P_5" gate="1" pin="V_USB"/>
<wire x1="40.64" y1="132.08" x2="40.64" y2="134.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="BTN_U" class="0">
<segment>
<pinref part="S1" gate="G$1" pin="1"/>
<wire x1="172.72" y1="124.46" x2="170.18" y2="124.46" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="170.18" y1="124.46" x2="149.86" y2="124.46" width="0.1524" layer="91"/>
<wire x1="170.18" y1="127" x2="170.18" y2="124.46" width="0.1524" layer="91"/>
<junction x="170.18" y="124.46"/>
<label x="149.86" y="124.46" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA25"/>
<wire x1="68.58" y1="76.2" x2="71.12" y2="76.2" width="0.1524" layer="91"/>
<label x="71.12" y="76.2" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="1"/>
<wire x1="177.8" y1="55.88" x2="175.26" y2="55.88" width="0.1524" layer="91"/>
<label x="175.26" y="55.88" size="1.27" layer="95" rot="MR0"/>
</segment>
</net>
<net name="BTN_D" class="0">
<segment>
<pinref part="S3" gate="G$1" pin="1"/>
<wire x1="172.72" y1="116.84" x2="165.1" y2="116.84" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="165.1" y1="116.84" x2="149.86" y2="116.84" width="0.1524" layer="91"/>
<wire x1="165.1" y1="127" x2="165.1" y2="116.84" width="0.1524" layer="91"/>
<junction x="165.1" y="116.84"/>
<label x="149.86" y="116.84" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA24"/>
<wire x1="68.58" y1="73.66" x2="71.12" y2="73.66" width="0.1524" layer="91"/>
<label x="71.12" y="73.66" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="J8" gate="G$1" pin="1"/>
<wire x1="177.8" y1="53.34" x2="175.26" y2="53.34" width="0.1524" layer="91"/>
<label x="175.26" y="53.34" size="1.27" layer="95" rot="MR0"/>
</segment>
</net>
<net name="BTN_L_SCK" class="0">
<segment>
<pinref part="S4" gate="G$1" pin="1"/>
<wire x1="172.72" y1="109.22" x2="160.02" y2="109.22" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="160.02" y1="109.22" x2="149.86" y2="109.22" width="0.1524" layer="91"/>
<wire x1="160.02" y1="127" x2="160.02" y2="109.22" width="0.1524" layer="91"/>
<junction x="160.02" y="109.22"/>
<label x="149.86" y="109.22" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA30/SCK"/>
<wire x1="33.02" y1="71.12" x2="30.48" y2="71.12" width="0.1524" layer="91"/>
<label x="30.48" y="71.12" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="J10" gate="G$1" pin="4"/>
<wire x1="154.94" y1="33.02" x2="157.48" y2="33.02" width="0.1524" layer="91"/>
<label x="157.48" y="33.02" size="1.27" layer="95"/>
</segment>
</net>
<net name="BTN_R_SIO" class="0">
<segment>
<pinref part="S5" gate="G$1" pin="1"/>
<wire x1="172.72" y1="101.6" x2="154.94" y2="101.6" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="154.94" y1="101.6" x2="149.86" y2="101.6" width="0.1524" layer="91"/>
<wire x1="154.94" y1="127" x2="154.94" y2="101.6" width="0.1524" layer="91"/>
<junction x="154.94" y="101.6"/>
<label x="149.86" y="101.6" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA31/SIO"/>
<wire x1="68.58" y1="71.12" x2="71.12" y2="71.12" width="0.1524" layer="91"/>
<label x="71.12" y="71.12" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="J10" gate="G$1" pin="2"/>
<wire x1="154.94" y1="35.56" x2="157.48" y2="35.56" width="0.1524" layer="91"/>
<label x="157.48" y="35.56" size="1.27" layer="95"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="CC"/>
<pinref part="S2" gate="G$1" pin="1"/>
</segment>
</net>
<net name="BTN_C" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="A1"/>
<wire x1="63.5" y1="116.84" x2="63.5" y2="114.3" width="0.1524" layer="91"/>
<wire x1="63.5" y1="114.3" x2="86.36" y2="114.3" width="0.1524" layer="91"/>
<label x="88.9" y="114.3" size="1.27" layer="95"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="86.36" y1="114.3" x2="88.9" y2="114.3" width="0.1524" layer="91"/>
<wire x1="86.36" y1="121.92" x2="86.36" y2="114.3" width="0.1524" layer="91"/>
<junction x="86.36" y="114.3"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="PA9"/>
<wire x1="33.02" y1="81.28" x2="30.48" y2="81.28" width="0.1524" layer="91"/>
<label x="30.48" y="81.28" size="1.27" layer="95" rot="MR0"/>
</segment>
</net>
<net name="OLED_SDA" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA04"/>
<wire x1="68.58" y1="86.36" x2="71.12" y2="86.36" width="0.1524" layer="91"/>
<label x="71.12" y="86.36" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="J11" gate="G$1" pin="1"/>
<wire x1="109.22" y1="25.4" x2="101.6" y2="25.4" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="101.6" y1="25.4" x2="91.44" y2="25.4" width="0.1524" layer="91"/>
<wire x1="101.6" y1="27.94" x2="101.6" y2="25.4" width="0.1524" layer="91"/>
<junction x="101.6" y="25.4"/>
<label x="91.44" y="25.4" size="1.27" layer="95" rot="MR0"/>
</segment>
</net>
<net name="OLED_SCL" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA5"/>
<wire x1="33.02" y1="86.36" x2="30.48" y2="86.36" width="0.1524" layer="91"/>
<label x="30.48" y="86.36" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="J12" gate="G$1" pin="1"/>
<wire x1="109.22" y1="22.86" x2="96.52" y2="22.86" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="96.52" y1="22.86" x2="91.44" y2="22.86" width="0.1524" layer="91"/>
<wire x1="96.52" y1="27.94" x2="96.52" y2="22.86" width="0.1524" layer="91"/>
<junction x="96.52" y="22.86"/>
<label x="91.44" y="22.86" size="1.27" layer="95" rot="MR0"/>
</segment>
</net>
<net name="XOSC" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA8"/>
<wire x1="33.02" y1="83.82" x2="30.48" y2="83.82" width="0.1524" layer="91"/>
<label x="30.48" y="83.82" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="OUT"/>
<wire x1="83.82" y1="53.34" x2="86.36" y2="53.34" width="0.1524" layer="91"/>
<label x="86.36" y="53.34" size="1.27" layer="95"/>
</segment>
</net>
<net name="F_OUT" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA14"/>
<wire x1="33.02" y1="78.74" x2="30.48" y2="78.74" width="0.1524" layer="91"/>
<label x="30.48" y="78.74" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="I1"/>
<wire x1="114.3" y1="86.36" x2="111.76" y2="86.36" width="0.1524" layer="91"/>
<label x="111.76" y="86.36" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="129.54" y1="66.04" x2="127" y2="66.04" width="0.1524" layer="91"/>
<label x="127" y="66.04" size="1.27" layer="95" rot="MR0"/>
</segment>
</net>
<net name="F_IN" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="PA15"/>
<wire x1="33.02" y1="76.2" x2="30.48" y2="76.2" width="0.1524" layer="91"/>
<label x="30.48" y="76.2" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="O2"/>
<wire x1="134.62" y1="83.82" x2="139.7" y2="83.82" width="0.1524" layer="91"/>
<label x="139.7" y="83.82" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="129.54" y1="60.96" x2="127" y2="60.96" width="0.1524" layer="91"/>
<label x="127" y="60.96" size="1.27" layer="95" rot="MR0"/>
</segment>
</net>
<net name="F_IN_BUF" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="I2"/>
<wire x1="114.3" y1="83.82" x2="111.76" y2="83.82" width="0.1524" layer="91"/>
<label x="111.76" y="83.82" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="J5" gate="G$1" pin="1"/>
<wire x1="177.8" y1="71.12" x2="175.26" y2="71.12" width="0.1524" layer="91"/>
<label x="175.26" y="71.12" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="2"/>
<wire x1="139.7" y1="60.96" x2="142.24" y2="60.96" width="0.1524" layer="91"/>
<label x="142.24" y="60.96" size="1.27" layer="95"/>
</segment>
</net>
<net name="F_OUT_BUF" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="O1"/>
<wire x1="134.62" y1="86.36" x2="139.7" y2="86.36" width="0.1524" layer="91"/>
<label x="139.7" y="86.36" size="1.27" layer="95"/>
</segment>
<segment>
<pinref part="J3" gate="G$1" pin="1"/>
<wire x1="177.8" y1="86.36" x2="175.26" y2="86.36" width="0.1524" layer="91"/>
<label x="175.26" y="86.36" size="1.27" layer="95" rot="MR0"/>
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="2"/>
<wire x1="139.7" y1="66.04" x2="142.24" y2="66.04" width="0.1524" layer="91"/>
<label x="142.24" y="66.04" size="1.27" layer="95"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="JP1" gate="G$1" pin="1"/>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="22.86" y1="132.08" x2="17.78" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
