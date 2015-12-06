1) copy to [omnirom tree]/device/lenovo/P780

2) put prebuilt kernel to /device/lenovo/P780/prebuilt dir

3) to build use commands:

```
. build/envsetup.sh

lunch full_P780-userdebug

make -j4 recoveryimage V=s
```
