# capacitor-meta-sdk

meta sdk capacitor

## Install

```bash
npm install capacitor-meta-sdk
npx cap sync
```

## Configuration

### Android

1. Add the following meta-data entries to your Android Manifest file (`android/app/src/main/AndroidManifest.xml`) inside the `<application>` tag:

```xml
<meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
<meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>
```

2. Add the Facebook App ID and Client Token to your strings.xml file (`android/app/src/main/res/values/strings.xml`):

```xml
<string name="facebook_app_id">YOUR_FACEBOOK_APP_ID</string>
<string name="facebook_client_token">YOUR_FACEBOOK_CLIENT_TOKEN</string>
```

### iOS

For iOS configuration, add your Facebook App ID to your Info.plist file:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>Facebook</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>fbYOUR_FACEBOOK_APP_ID</string>
        </array>
    </dict>
</array>
<key>FacebookAppID</key>
<string>YOUR_FACEBOOK_APP_ID</string>
<key>FacebookClientToken</key>
<string>YOUR_FACEBOOK_CLIENT_TOKEN</string>
<key>FacebookDisplayName</key>
<string>YourAppName</string>
```

**Note:** Replace the App ID and Client Token with your actual Facebook App credentials from the Facebook Developer Console.

## API

<docgen-index>

* [`logEvent(...)`](#logevent)
* [Type Aliases](#type-aliases)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### logEvent(...)

```typescript
logEvent(options: { eventName: string; eventValues?: Record<string, any>; }) => Promise<void>
```

| Param         | Type                                                                                               |
| ------------- | -------------------------------------------------------------------------------------------------- |
| **`options`** | <code>{ eventName: string; eventValues?: <a href="#record">Record</a>&lt;string, any&gt;; }</code> |

--------------------


### Type Aliases


#### Record

Construct a type with a set of properties K of type T

<code>{
 [P in K]: T;
 }</code>

</docgen-api>
