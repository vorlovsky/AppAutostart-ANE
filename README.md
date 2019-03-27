# AppAutostart-ANE
App autostart on boot Adobe Native Extension for Android

Getting Started
=================
In order to make your AS3/AIR project support autostart on Android reboot:

1. Add ANE to your project.

2. Add the following strings into your XXX-app.xml's manifestAdditions section:

 	```    
	<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />    
	<application>
		<receiver android:enabled="true" android:name="com.lj.ane.autostart.receivers.BootBroadcastReceiver" android:permission="android.permission.RECEIVE_BOOT_COMPLETED">
			<intent-filter>
				<action android:name="android.intent.action.BOOT_COMPLETED" />
				<category android:name="android.intent.category.DEFAULT" />
			</intent-filter>
		</receiver>
	</application>    
	```
    
   The app will autostart on the next reboot after the first launch.
    
3. To allow/deny autostart use `allow` method:

	```
	var ane : AppAutostartANE = AppAutostartANE.getInstance();
	ane.allow(true);//allowed
	ane.allow(false);//denied    
	```	

License
=================
AppAutostart Adobe Native Extension is distributed under the Apache 2.0 license (see LICENSE.md).
