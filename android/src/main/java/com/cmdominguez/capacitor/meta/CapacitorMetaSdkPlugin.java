package com.cmdominguez.capacitor.meta;

import android.os.Bundle;
import com.facebook.FacebookSdk;
import com.facebook.appevents.AppEventsLogger;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import java.util.Iterator;

@CapacitorPlugin(name = "CapacitorMetaSdk")
public class CapacitorMetaSdkPlugin extends Plugin {

    @Override
    public void load() {
        super.load();
        FacebookSdk.setIsDebugEnabled(true);
    }

    public Bundle convertJSObjectToBundle(JSObject jsObject) {
        Bundle bundle = new Bundle();
        Iterator<String> keys = jsObject.keys();

        while (keys.hasNext()) {
            String key = keys.next();
            Object value = jsObject.opt(key);

            if (value instanceof Integer) {
                bundle.putInt(key, (Integer) value);
            } else if (value instanceof Long) {
                bundle.putLong(key, (Long) value);
            } else if (value instanceof Double) {
                bundle.putDouble(key, (Double) value);
            } else if (value instanceof Boolean) {
                bundle.putBoolean(key, (Boolean) value);
            } else if (value instanceof String) {
                bundle.putString(key, (String) value);
            } else if (value != null) {
                bundle.putString(key, value.toString()); // fallback
            }
        }

        return bundle;
    }

    @PluginMethod
    public void logEvent(PluginCall call) {
        String eventName = call.getString("eventName");

        if (eventName == null || eventName.isEmpty()) {
            call.reject("eventName is required");
            return;
        }

        JSObject eventValuesObject = call.getObject("eventValues");
        if (eventValuesObject == null) {
            call.reject("eventValues are required");
            return;
        }

        Bundle eventValues = convertJSObjectToBundle(eventValuesObject);

        AppEventsLogger logger = AppEventsLogger.newLogger(getContext());
        logger.logEvent(eventName, eventValues);
    }
}
