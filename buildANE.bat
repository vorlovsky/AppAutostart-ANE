cls

set SDK_DIR=D:/Work/SDK/air/33.1.1
set ACOMPC=%SDK_DIR%/bin/acompc
set ADT=%SDK_DIR%/bin/adt

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
call %ADT% -package -target ane %NAME%.ane extension.xml -swc %NAME%.swc -platform Android-ARM -C platform/android library.swf classes.jar -platformoptions platform/android/platform.xml res/values/strings.xml -platform Android-ARM64 -C platform/android library.swf classes.jar -platformoptions platform/android/platform.xml res/values/strings.xml -platform default -C platform/default library.swf

del %NAME%.swc
del platform\\android\\library.swf
del platform\\android\\classes.jar
del platform\\default\\library.swf

echo "DONE!"