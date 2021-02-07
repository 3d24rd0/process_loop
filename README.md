# process_loop
[![Pub](https://img.shields.io/pub/v/process_loop.svg)](https://pub.dev/packages/process_loop) [![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

## Example
```
ProgressLoop(
      executable: "echo",
      arguments: List.of(["hello"]),
      loop: null,
    )
```
![test](https://github.com/3d24rd0/process_loop/blob/main/test.png?raw=true)


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