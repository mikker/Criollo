#/bin/bash

set -x

# Update cocoapods master repo
pod repo update --silent

# Examples
cd Examples

cd HelloWorld
pod install --silent
xcodebuild clean build analyze -quiet -workspace HelloWorld.xcworkspace -scheme "HelloWorld" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
pod deintegrate --silent
cd ../

cd HelloWorld-MultiTarget
pod install --silent
xcodebuild clean build analyze -quiet -workspace HelloWorld.xcworkspace -scheme "HelloWorld" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
xcodebuild clean build analyze -quiet -workspace HelloWorld.xcworkspace -scheme "HelloWorld-Cocoa" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
xcodebuild clean build analyze -quiet -destination 'platform=iOS Simulator,name=iPhone 8' -workspace HelloWorld.xcworkspace -scheme "HelloWorld-iOS" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
xcodebuild clean build analyze -quiet -destination 'platform=tvOS Simulator,name=Apple TV' -workspace HelloWorld.xcworkspace -scheme "HelloWorld-tvOS" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
pod deintegrate --silent
cd ../

cd HelloWorld-ObjC
pod install --silent
xcodebuild clean build analyze -quiet -workspace HelloWorld-ObjC.xcworkspace -scheme "HelloWorld-ObjC" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
pod deintegrate --silent
cd ../

cd HelloWorld-Swift
pod install --silent
xcodebuild clean build analyze -quiet -workspace HelloWorld-Swift.xcworkspace -scheme "HelloWorld-Swift" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
pod deintegrate --silent
cd ../

cd HTTPAuthentication
pod install --silent
xcodebuild clean build analyze -quiet -workspace HTTPAuthentication.xcworkspace -scheme "HTTPAuthentication" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
pod deintegrate --silent
cd ../

cd LongRequest
pod install --silent
xcodebuild clean build analyze -quiet -workspace LongRequest.xcworkspace -scheme "LongRequest" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
pod deintegrate --silent
cd ../

cd SecureHTTPServer
pod install --silent
xcodebuild clean build analyze -quiet -destination 'platform=iOS Simulator,name=iPhone 8' -workspace SecureHTTPServer.xcworkspace -scheme "SecureHTTPServer" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
pod deintegrate --silent
cd ../

cd ServerStats
pod install --silent
xcodebuild clean build analyze -quiet -workspace CriolloServerStats.xcworkspace -scheme "CriolloServerStats" CODE_SIGNING_REQUIRED=NO || exit $PIPESTATUS
pod deintegrate --silent
cd ../

# cleanup
cd ../
rm -rf Examples/*/Pods
rm -rf Examples/*/Podfile.lock
rm -rf Examples/*/*.xcworkspace
