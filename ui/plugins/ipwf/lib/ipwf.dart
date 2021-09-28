
import 'dart:async';

import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ipwf/model/states_states_generated.dart' as State;
import 'package:ffi/ffi.dart';
import 'package:isolate/ports.dart';

import 'ffi.dart' as native;

typedef _wrappedPrint_C = Void Function(Pointer<Utf8> a);
final wrappedPrintPointer = Pointer.fromFunction<_wrappedPrint_C>(_wrappedPrint);

void _wrappedPrint(Pointer<Utf8> arg){
  print("FFI: ${Utf8.fromUtf8(arg)}");
}

class Ipwf {
  static const MethodChannel _channel =
      const MethodChannel('ipwf');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static StreamController<State.Root> _controller =
  StreamController<State.Root>();
  static Stream<State.Root> stream = _controller.stream.asBroadcastStream();

  static State.Root setup() {
    native.setup_post_cobject(NativeApi.postCObject);
    native.setup_logger(wrappedPrintPointer);
    _setupNextCall();
    return getCurrentState();
  }

  static log(String message){
    print(message);
  }

  static _setupNextCall() {
    print("_setupNextCall");
    final completer = Completer<Uint8List>();
    final sendPort = singleCompletePort(completer);

    native.next_port(sendPort.nativePort);

    var completeFuture =
    _controller.addStream(completer.future.asStream().map((ptr) {
      print('callback is here');
      print("callback $ptr");
      return State.Root(ptr);
    }));
    completeFuture.whenComplete(() => _setupNextCall());
  }

  static State.Root getCurrentState() {
    final ptr = native.current_state();
    final root = State.Root(_listTypedData(ptr));
    native.drop_pointer(ptr);
    return root;
  }

  static doAction(Uint8List action) {
    final pointer = allocate<native.Event>(count: action.length);
    final typedData = pointer.ref;
    typedData.length = action.length;
    typedData.values = allocate<Uint8>(count: action.length);
    for (int i = 0; i < action.length; i++) {
      typedData.values[i] = action[i];
    }
    print('before doing the action');
    native.do_action(pointer);
    print('after doing the action');
    free(typedData.values);
    free(pointer);
  }

  static Uint8List _listTypedData(Pointer<native.Event> ptr) {
    print("_listTypedData");
    final typedData = ptr.ref;
    var list = typedData.values.asTypedList(typedData.length);
    print(list);
    return list;
  }
}
