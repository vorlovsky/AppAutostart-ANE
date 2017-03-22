cls

set ACOMPC=D:/Work/SDK/flex_sdk_4.6/bin/acompc
set ADT="C:/Program Files/Adobe/Adobe Flash Builder 4.7 (64 Bit)/eclipse/plugins/com.adobe.flash.compiler_4.7.0.349722/AIRSDK_20/bin/adt"

set SWFVERSION=20

set INCLUDE_CLASSES="com.lj.ane.autostart.AppAutostartANE"
set NAME=AppAutostartANE

echo "GENERATING SWC"
call %ACOMPC% -source-path flash/src/ -include-classes %INCLUDE_CLASSES% -swf-version=%SWFVERSION% -output %NAME%.swc

echo "GENERATING LIBRARY from SWC"
unzip -o %NAME%.swc library.swf

copy /Y library.swf platform\\android
copy /Y library.swf platform\\default

del library.swf

echo "GETTING ANDROID JAR"
unzip -o android/app/build/outputs/aar/app-debug.aar classes.jar -d platform/android/

echo "GENERATING ANE"
call %ADT% -package -target ane %NAME%.ane extension.xml -swc %NAME%.swc -platform Android-ARM -C platform/android library.swf classes.jar -platformoptions platform/android/platform.xml res/values/strings.xml -platform default -C platform/default library.swf

del %NAME%.swc
del platform\\android\\library.swf
del platform\\android\\classes.jar
del platform\\default\\library.swf

echo "DONE!"