{ config, pkgs, ... }:{
  home.file."touchegg".target = "/config/touchegg/touchegg.conf";
  home.file."touchegg".source = 
  ''
  <touchégg>
<settings>
    <property name="animation_delay">150</property>
    <property name="action_execute_threshold">20</property>



<!--
      Global animation colors can be configured to match your system colors using HEX notation:
<color>909090</color>
        <borderColor>FFFFFF</borderColor>
You can also use auto:
<property name="color">auto</property>
        <property name="borderColor">auto</property>
Notice that you can override an specific animation color.
    -->



    <property name="color">auto</property>
    <property name="borderColor">auto</property>
  </settings>
<!--
    Configuration for every application.
  -->
  <application name="All">

    <gesture type="SWIPE" fingers="3" direction="UP">
      <action type="MAXIMIZE_RESTORE_WINDOW">
        <animate>true</animate>
      </action>
    </gesture>

    <gesture type="SWIPE" fingers="3" direction="DOWN">
      <action type="MINIMIZE_WINDOW">
        <animate>true</animate>
      </action>
    </gesture>

<   gesture type="SWIPE" fingers="3" direction="LEFT">
        <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>Shift_L+Tab</keys>
            <decreaseKeys>Tab</decreaseKeys>
        </action>
    </gesture>

    <gesture type="SWIPE" fingers="3" direction="RIGHT">
        <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
        </action>
    </gesture>
    
    <!--
    <gesture type="SWIPE" fingers="3" direction="LEFT">
      <action type="TILE_WINDOW">
        <direction>left</direction>
        <animate>true</animate>
      </action>
    </gesture>
<   gesture type="SWIPE" fingers="3" direction="RIGHT">
      <action type="TILE_WINDOW">
        <direction>right</direction>
        <animate>true</animate>
      </action>
    </gesture>
    -->
  </application>
</touchégg>
'';
}

