
`package:web_socket_channel` provides cross-platform
[`StreamChannel`][stream_channel] wrappers for WebSocket connections.

## Docs and Usage

It provides a websocket connection to mfereji. Initialize the SDK using the following code.

```dart
import 'package:mfereji/mfereji.dart' as mfereji;
void init(){
    _client = mfereji.createClient(
      AppConfig.mferejiPresenceConnectUrl,
      mfereji.ClientConfig(
        token: chatToken,
      ),
    );
}
```
