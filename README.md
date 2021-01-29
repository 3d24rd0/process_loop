# process_loop

A new Flutter package project.

#### MacOS

If you want to run executable in a MacOS flutter context, you need to disable sandbox mode. See 
[Removing sandboxing](https://stackoverflow.com/questions/7018354/remove-sandboxing) and 
[ProcessException: Operation not permitted on macOS](https://github.com/tekartik/process_run.dart/issues/3) 

In `macos/Runner/DebugProfile.entitlements` and `macos/Runner/Release.entitlements`, change:

```
<dict>
	<key>com.apple.security.app-sandbox</key>
	<true/>
</dict>
```

to

```
<dict>
	<key>com.apple.security.app-sandbox</key>
	<false/>
</dict>