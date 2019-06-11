# TBLib-iOS

> **TeleStats**
>
>If this library makes developing your next Telegram App easier, please download my app [TeleStats](telestats.app). The app shows you fun and interesting statistics about your Telegram Message. All the anlysis and communication with Telegram happens on device using this library!

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Documentation](https://leomehlig.github.io/TDLib-iOS/badge.svg)](https://leomehlig.github.io/TDLib-iOS) [![Build Status](https://travis-ci.com/leoMehlig/TDLib-iOS.svg?token=tNqSosPiNs9ko83zWqJm&branch=master)](https://travis-ci.com/leoMehlig/TDLib-iOS)

TDLib-iOS is a wrapper around Telegram's [tdlib](https://github.com/tdlib/td) to interact with the [Telegram API](https://core.telegram.org/api) using **Swift**.

This library depends on [TDJSON](https://github.com/leoMehlig/TDJSON), a build of [tdlib](https://github.com/tdlib/td) for iOS, and [PromiseKit](https://github.com/mxcl/PromiseKit) for better async programming.

*TDLib-iOS* provides a nativ **Swift** interface, that is generated from the [td_api.tl](https://github.com/leoMehlig/TDJSON/blob/master/td_api.tl) using the a [custom parser](TLParser/parser.rb). A full documentation of the generated Swift API can be found [here](https://leomehlig.github.io/TDLib-iOS/).

## Installation

### [Carthage](https://github.com/Carthage/Carthage):

Just add `github "leoMehlig/TDLib-iOS"` to your `Cartfile` and do the usual Carthage stuff.

### Other options:

Other options are not supported right now, but PR are more then welcome.

## Usage

### Setup

Create the coordinator, this instance will take care of sending request, receiving responses and handling all the inital setup.

```Swift
let coordinator = Coordinator(client: TDJsonClient(), apiId: <Telegram API ID>, apiHash: <Telegram API Hash>)
```

You can get an api key from [Telegram](https://my.telegram.org/auth).

### Loging in

You can subscribe to the `Coordinator.authorizationState` for updates about the current *Auth State* of the API. Here is an example of how to handle the sign in flow:
```Swift
 coordinator.authorizationState.subscribe(on: .main) { event in
            guard let state = event.value else {
                return
            }
            switch state {
            case .waitTdlibParameters, .waitEncryptionKey:
                // Ignore these! TDLib-iOS will handle them.
            case .waitPhoneNumber:
                // Show sign in screen.
            case .waitCode(let isRegistered, let tos, let codeInfo):
                // Show code input screen.
            case .waitPassword(let passwordHint, _, _):
                // Show passoword screen (will only happen when the user has setup 2FA).
            case .ready:
                // Show main view
            case .loggingOut, .closing, .closed:
                break
            }

```

> **Stream**
>
> The `Stream` is a custom implementation of a data stream that calls a subscribing function every time a new value is assigned the the `Stream.current` field.
>
> As a user of the library you never have to create a stream and only use them to get respond to changes in the `authorizationState` and when downloading images/documents.
>
> You can subscribe to stream by adding yourself as an observer using the `Stream.subscribe` method. The method take an token (optional) to later unsubscribe, a queue (defaults to DispatchQueue.global()) and a callback that provided you with the new events. There is also a convience methos to avoid reference cycles, called `subscribeStrong`.

### Sending a request

To send a request to `tdlib` use the `Coordinator.send` method.

```Swift
coordinator.send(GetChats(offsetOrder: offsetOrder, offsetChatId: offsetChatId, limit: limit)).done { ids in
    print("Got chat ids: \(ids)")
}
```

The send method takes a `TDFunction` and returns a `Promise` of the `Result`  of the function. Of cause this request can also fail!!!

> For more infos about `Promises` see the [PromiseKit documentation](https://github.com/mxcl/PromiseKit).


## How it works

The `Coordinator` wraps an instance of a `TDJsonClient` with in turn is just an interface to the `c++` api of `tdlib`. `TDLib-iOS` communicates with `tdlib` via a `json` interface, which is very error prone when using directly. To prevent typos and wrong json format the library provides a generated Swift version of all avaiable functions. 
