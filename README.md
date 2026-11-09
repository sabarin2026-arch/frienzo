# Frienzo – Customer & Rider Android apps (Capacitor)

Rendu apps-um live website-a load pannum (WebView), so website update panna apps-um auto update aagum.

| App | Package | Loads |
|---|---|---|
| Customer | in.frienzo.customer | https://frienzo.in/be/ |
| Rider | in.frienzo.delivery | https://frienzo.in/be/delivery/ |

Rider app-la background GPS (screen lock aanalum location pogum) `delivery/js/native-bridge.js` moolama work aagum.
Admin panel app-la illa, desktop browser-la mattum.

## STEP 0 – Website patch upload
`frienzo-website-patch.zip` files-a Hostinger-la `be/` folder-la overwrite pannunga (native-bridge.js kandippa venum).

## STEP 1 – APK build (cloud-la, free)
1. github.com-la **private** repo create pannunga (e.g. `frienzo-apps`).
2. Indha folder content-a (customer, delivery, scripts, .github) repo-la upload pannunga. `.github` hidden folder, drag-drop pannunga.
3. Repo -> **Actions** tab -> "Build Frienzo APKs" -> **Run workflow**.
4. 6-10 nimisham-la mudiyum. Run page keezha **Artifacts**:
   - `frienzo-customer-debug-apk`
   - `frienzo-delivery-debug-apk`
   Download -> zip-ulla `.apk` -> phone-la install.

Debug APK direct install-ku nalla work aagum. Play Store-ku signed release venum (Step 2).

## STEP 2 – Play Store release (optional)
PC-la oru murai key create pannunga (key-a SAFE-a vachukonga, update-ku ithe key venum):

    keytool -genkey -v -keystore release.jks -alias frienzo -keyalg RSA -keysize 2048 -validity 10000
    base64 -w0 release.jks      # (Windows PowerShell: [Convert]::ToBase64String([IO.File]::ReadAllBytes("release.jks")))

Repo -> Settings -> Secrets and variables -> Actions -> New secret:
`KEYSTORE_BASE64` (above output), `KEYSTORE_PASSWORD`, `KEY_ALIAS` (= frienzo).
Apparam Run workflow -> `frienzo-*-release` artifact-la signed APK + AAB varum. AAB-a Play Console-la upload pannunga.

## Test checklist
- Customer app: home load, add to cart, login, payment (Cashfree) open aagudha, UPI app switch aagudha.
- Customer app-la rider link / admin kaanaama irukkanum.
- Rider app: login -> Online -> "Allow all the time" location permission -> screen lock panni 2 nimisham kazhichi admin dispatch map-la rider move aagudha paarunga.
- Phone browser-la frienzo.in/be/admin.html -> "desktop-la mattum" message varanum.
