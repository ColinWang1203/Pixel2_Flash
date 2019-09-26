# Pixel2_Flash
1. repo init -u https://android.googlesource.com/platform/manifest -b android-9.0.0_r32

2. vi .repo/manifest.xml
add :
  <remote name="opengapps" fetch="https://github.com/opengapps/"  />
  <remote name="nezor" fetch="https://gitlab.nezorfla.me/opengapps/"  />

  <project path="vendor/opengapps/build" name="aosp_build" revision="master" remote="opengapps" />

  <project path="vendor/opengapps/sources/all" name="all" clone-depth="1" revision="master" remote="nezor" />

  <!-- arm64 depends on arm -->
  <project path="vendor/opengapps/sources/arm" name="arm" clone-depth="1" revision="master" remote="nezor" />
  <project path="vendor/opengapps/sources/arm64" name="arm64" clone-depth="1" revision="master" remote="nezor" />

  <project path="vendor/opengapps/sources/x86" name="x86" clone-depth="1" revision="master" remote="nezor" />
  <project path="vendor/opengapps/sources/x86_64" name="x86_64" clone-depth="1" revision="master" remote="nezor" />

3. vi device/google/muskie/aosp_walleye.mk 
- PRODUCT_RESTRICT_VENDOR_FILES := owner 
+ PRODUCT_RESTRICT_VENDOR_FILES := false 

4. vi device/google/wahoo/device.mk 
Last line add : 
+GAPPS_VARIANT := stock 
+$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk) 

5. vi frameworks/base/services/core/java/com/android/server/wm/WindowManagerService.java 
- mAmInternal.enforceCallerIsRecentsOrHasPermission(android.Manifest.permission.STATUS_BAR, 
-  "setShelfHeight()"); 
+ //mAmInternal.enforceCallerIsRecentsOrHasPermission(android.Manifest.permission.STATUS_BAR, 
+ //        "setShelfHeight()"); 

6. wget https://dl.google.com/dl/android/aosp/google_devices-walleye-pq2a.190205.002-a5b43ffa.tgz  
   wget https://dl.google.com/dl/android/aosp/qcom-walleye-pq2a.190205.002-d5cc3341.tgz 
   
7. tar xvfz google_devices-walleye-pq2a.190205.002-a5b43ffa.tgz  
   tar xvfz qcom-walleye-pq2a.190205.002-d5cc3341.tgz  
   ./extract-google_devices-walleye.sh 
   ./extract-qcom-walleye.sh 
8. repo sync 

9. . build/envsetup.sh 
   lunch aosp_walleye-userdebug 
   make -j8 
