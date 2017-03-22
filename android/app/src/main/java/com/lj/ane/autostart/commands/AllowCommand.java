package com.lj.ane.autostart.commands;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.lj.ane.autostart.PreferenceConstants;

public class AllowCommand implements FREFunction  {
    private final String TAG = "AllowCommand";

	public FREObject call(final FREContext ctx, FREObject[] passedArgs) {
        Activity activity = ctx.getActivity();
        Context context = activity.getApplicationContext();

        SharedPreferences.Editor prefs = PreferenceManager.getDefaultSharedPreferences(context).edit();

        prefs.putBoolean(PreferenceConstants.ALLOWED_STATUS_PREF, getPassedBool(passedArgs[0]));

        prefs.commit();

        return null;
    }

    private boolean getPassedBool( FREObject param ) {
        boolean value = false;
        try {
            value = param.getAsBool();
        } catch (FRETypeMismatchException e) {
            e.printStackTrace();
        } catch (FREInvalidObjectException e) {
            e.printStackTrace();
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
        }

        return value;
    }
}