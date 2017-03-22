package com.lj.ane.autostart.receivers;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import com.lj.ane.autostart.PreferenceConstants;

/**
 * Created by LJ on 22.03.2017.
 */
public class BootBroadcastReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        if (Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
            if(getAllowedStatus(context)) {
                String componentName = context.getPackageName() + "/.AppEntry";

                Intent startIntent = new Intent(Intent.ACTION_MAIN);
                startIntent.setComponent(ComponentName.unflattenFromString(componentName));
                startIntent.addCategory(Intent.CATEGORY_LAUNCHER);
                startIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

                context.startActivity(startIntent);
            }
        }
    }

    private boolean getAllowedStatus(Context context) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());

        return prefs.getBoolean(PreferenceConstants.ALLOWED_STATUS_PREF, true);
    }
}
