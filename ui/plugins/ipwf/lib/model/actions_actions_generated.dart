// automatically generated by the FlatBuffers compiler, do not modify
// ignore_for_file: unused_import, unused_field, unused_local_variable

library actions;

import 'dart:typed_data' show Uint8List;
import 'package:flat_buffers/flat_buffers.dart' as fb;


class MainPageActionTypeId {
  final int value;
  const MainPageActionTypeId._(this.value);

  factory MainPageActionTypeId.fromValue(int value) {
    if (value == null) value = 0;
    if (!values.containsKey(value)) {
      throw new StateError('Invalid value $value for bit flag enum MainPageActionTypeId');
    }
    return values[value];
  }

  static const int minValue = 0;
  static const int maxValue = 1;
  static bool containsValue(int value) => values.containsKey(value);

  static const MainPageActionTypeId NONE = const MainPageActionTypeId._(0);
  static const MainPageActionTypeId ButtonClicked = const MainPageActionTypeId._(1);
  static get values => {0: NONE,1: ButtonClicked,};

  static const fb.Reader<MainPageActionTypeId> reader = const _MainPageActionTypeIdReader();

  @override
  String toString() {
    return 'MainPageActionTypeId{value: $value}';
  }
}

class _MainPageActionTypeIdReader extends fb.Reader<MainPageActionTypeId> {
  const _MainPageActionTypeIdReader();

  @override
  int get size => 1;

  @override
  MainPageActionTypeId read(fb.BufferContext bc, int offset) =>
      new MainPageActionTypeId.fromValue(const fb.Uint8Reader().read(bc, offset));
}

class PageTypeId {
  final int value;
  const PageTypeId._(this.value);

  factory PageTypeId.fromValue(int value) {
    if (value == null) value = 0;
    if (!values.containsKey(value)) {
      throw new StateError('Invalid value $value for bit flag enum PageTypeId');
    }
    return values[value];
  }

  static const int minValue = 0;
  static const int maxValue = 2;
  static bool containsValue(int value) => values.containsKey(value);

  static const PageTypeId NONE = const PageTypeId._(0);
  static const PageTypeId MainPage = const PageTypeId._(1);
  static const PageTypeId SettingsPage = const PageTypeId._(2);
  static get values => {0: NONE,1: MainPage,2: SettingsPage,};

  static const fb.Reader<PageTypeId> reader = const _PageTypeIdReader();

  @override
  String toString() {
    return 'PageTypeId{value: $value}';
  }
}

class _PageTypeIdReader extends fb.Reader<PageTypeId> {
  const _PageTypeIdReader();

  @override
  int get size => 1;

  @override
  PageTypeId read(fb.BufferContext bc, int offset) =>
      new PageTypeId.fromValue(const fb.Uint8Reader().read(bc, offset));
}

class UserTypeId {
  final int value;
  const UserTypeId._(this.value);

  factory UserTypeId.fromValue(int value) {
    if (value == null) value = 0;
    if (!values.containsKey(value)) {
      throw new StateError('Invalid value $value for bit flag enum UserTypeId');
    }
    return values[value];
  }

  static const int minValue = 0;
  static const int maxValue = 1;
  static bool containsValue(int value) => values.containsKey(value);

  static const UserTypeId NONE = const UserTypeId._(0);
  static const UserTypeId ChangeUserName = const UserTypeId._(1);
  static get values => {0: NONE,1: ChangeUserName,};

  static const fb.Reader<UserTypeId> reader = const _UserTypeIdReader();

  @override
  String toString() {
    return 'UserTypeId{value: $value}';
  }
}

class _UserTypeIdReader extends fb.Reader<UserTypeId> {
  const _UserTypeIdReader();

  @override
  int get size => 1;

  @override
  UserTypeId read(fb.BufferContext bc, int offset) =>
      new UserTypeId.fromValue(const fb.Uint8Reader().read(bc, offset));
}

class ChangeUserName {
  ChangeUserName._(this._bc, this._bcOffset);
  factory ChangeUserName(List<int> bytes) {
    fb.BufferContext rootRef = new fb.BufferContext.fromBytes(bytes);
    return reader.read(rootRef, 0);
  }

  static const fb.Reader<ChangeUserName> reader = const _ChangeUserNameReader();

  final fb.BufferContext _bc;
  final int _bcOffset;

  String get name => const fb.StringReader().vTableGet(_bc, _bcOffset, 4, null);

  @override
  String toString() {
    return 'ChangeUserName{name: $name}';
  }
}

class _ChangeUserNameReader extends fb.TableReader<ChangeUserName> {
  const _ChangeUserNameReader();

  @override
  ChangeUserName createObject(fb.BufferContext bc, int offset) => 
    new ChangeUserName._(bc, offset);
}

class ChangeUserNameBuilder {
  ChangeUserNameBuilder(this.fbBuilder) {
    assert(fbBuilder != null);
  }

  final fb.Builder fbBuilder;

  void begin() {
    fbBuilder.startTable();
  }

  int addNameOffset(int offset) {
    fbBuilder.addOffset(0, offset);
    return fbBuilder.offset;
  }

  int finish() {
    return fbBuilder.endTable();
  }
}

class ChangeUserNameObjectBuilder extends fb.ObjectBuilder {
  final String _name;

  ChangeUserNameObjectBuilder({
    String name,
  })
      : _name = name;

  /// Finish building, and store into the [fbBuilder].
  @override
  int finish(
    fb.Builder fbBuilder) {
    assert(fbBuilder != null);
    final int nameOffset = fbBuilder.writeString(_name);

    fbBuilder.startTable();
    if (nameOffset != null) {
      fbBuilder.addOffset(0, nameOffset);
    }
    return fbBuilder.endTable();
  }

  /// Convenience method to serialize to byte list.
  @override
  Uint8List toBytes([String fileIdentifier]) {
    fb.Builder fbBuilder = new fb.Builder();
    int offset = finish(fbBuilder);
    return fbBuilder.finish(offset, fileIdentifier);
  }
}
class ButtonClicked {
  ButtonClicked._(this._bc, this._bcOffset);
  factory ButtonClicked(List<int> bytes) {
    fb.BufferContext rootRef = new fb.BufferContext.fromBytes(bytes);
    return reader.read(rootRef, 0);
  }

  static const fb.Reader<ButtonClicked> reader = const _ButtonClickedReader();

  final fb.BufferContext _bc;
  final int _bcOffset;

  String get name => const fb.StringReader().vTableGet(_bc, _bcOffset, 4, null);

  @override
  String toString() {
    return 'ButtonClicked{name: $name}';
  }
}

class _ButtonClickedReader extends fb.TableReader<ButtonClicked> {
  const _ButtonClickedReader();

  @override
  ButtonClicked createObject(fb.BufferContext bc, int offset) => 
    new ButtonClicked._(bc, offset);
}

class ButtonClickedBuilder {
  ButtonClickedBuilder(this.fbBuilder) {
    assert(fbBuilder != null);
  }

  final fb.Builder fbBuilder;

  void begin() {
    fbBuilder.startTable();
  }

  int addNameOffset(int offset) {
    fbBuilder.addOffset(0, offset);
    return fbBuilder.offset;
  }

  int finish() {
    return fbBuilder.endTable();
  }
}

class ButtonClickedObjectBuilder extends fb.ObjectBuilder {
  final String _name;

  ButtonClickedObjectBuilder({
    String name,
  })
      : _name = name;

  /// Finish building, and store into the [fbBuilder].
  @override
  int finish(
    fb.Builder fbBuilder) {
    assert(fbBuilder != null);
    final int nameOffset = fbBuilder.writeString(_name);

    fbBuilder.startTable();
    if (nameOffset != null) {
      fbBuilder.addOffset(0, nameOffset);
    }
    return fbBuilder.endTable();
  }

  /// Convenience method to serialize to byte list.
  @override
  Uint8List toBytes([String fileIdentifier]) {
    fb.Builder fbBuilder = new fb.Builder();
    int offset = finish(fbBuilder);
    return fbBuilder.finish(offset, fileIdentifier);
  }
}
class MainPage {
  MainPage._(this._bc, this._bcOffset);
  factory MainPage(List<int> bytes) {
    fb.BufferContext rootRef = new fb.BufferContext.fromBytes(bytes);
    return reader.read(rootRef, 0);
  }

  static const fb.Reader<MainPage> reader = const _MainPageReader();

  final fb.BufferContext _bc;
  final int _bcOffset;

  MainPageActionTypeId get actionType => new MainPageActionTypeId.fromValue(const fb.Uint8Reader().vTableGet(_bc, _bcOffset, 4, 0));
  dynamic get action {
    switch (actionType?.value) {
      case 1: return ButtonClicked.reader.vTableGet(_bc, _bcOffset, 6, null);
      default: return null;
    }
  }

  @override
  String toString() {
    return 'MainPage{actionType: $actionType, action: $action}';
  }
}

class _MainPageReader extends fb.TableReader<MainPage> {
  const _MainPageReader();

  @override
  MainPage createObject(fb.BufferContext bc, int offset) => 
    new MainPage._(bc, offset);
}

class MainPageBuilder {
  MainPageBuilder(this.fbBuilder) {
    assert(fbBuilder != null);
  }

  final fb.Builder fbBuilder;

  void begin() {
    fbBuilder.startTable();
  }

  int addActionType(MainPageActionTypeId actionType) {
    fbBuilder.addUint8(0, actionType?.value);
    return fbBuilder.offset;
  }
  int addActionOffset(int offset) {
    fbBuilder.addOffset(1, offset);
    return fbBuilder.offset;
  }

  int finish() {
    return fbBuilder.endTable();
  }
}

class MainPageObjectBuilder extends fb.ObjectBuilder {
  final MainPageActionTypeId _actionType;
  final dynamic _action;

  MainPageObjectBuilder({
    MainPageActionTypeId actionType,
    dynamic action,
  })
      : _actionType = actionType,
        _action = action;

  /// Finish building, and store into the [fbBuilder].
  @override
  int finish(
    fb.Builder fbBuilder) {
    assert(fbBuilder != null);
    final int actionOffset = _action?.getOrCreateOffset(fbBuilder);

    fbBuilder.startTable();
    fbBuilder.addUint8(0, _actionType?.value);
    if (actionOffset != null) {
      fbBuilder.addOffset(1, actionOffset);
    }
    return fbBuilder.endTable();
  }

  /// Convenience method to serialize to byte list.
  @override
  Uint8List toBytes([String fileIdentifier]) {
    fb.Builder fbBuilder = new fb.Builder();
    int offset = finish(fbBuilder);
    return fbBuilder.finish(offset, fileIdentifier);
  }
}
class SettingsPage {
  SettingsPage._(this._bc, this._bcOffset);
  factory SettingsPage(List<int> bytes) {
    fb.BufferContext rootRef = new fb.BufferContext.fromBytes(bytes);
    return reader.read(rootRef, 0);
  }

  static const fb.Reader<SettingsPage> reader = const _SettingsPageReader();

  final fb.BufferContext _bc;
  final int _bcOffset;


  @override
  String toString() {
    return 'SettingsPage{}';
  }
}

class _SettingsPageReader extends fb.TableReader<SettingsPage> {
  const _SettingsPageReader();

  @override
  SettingsPage createObject(fb.BufferContext bc, int offset) => 
    new SettingsPage._(bc, offset);
}

class SettingsPageObjectBuilder extends fb.ObjectBuilder {

  SettingsPageObjectBuilder();

  /// Finish building, and store into the [fbBuilder].
  @override
  int finish(
    fb.Builder fbBuilder) {
    assert(fbBuilder != null);

    fbBuilder.startTable();
    return fbBuilder.endTable();
  }

  /// Convenience method to serialize to byte list.
  @override
  Uint8List toBytes([String fileIdentifier]) {
    fb.Builder fbBuilder = new fb.Builder();
    int offset = finish(fbBuilder);
    return fbBuilder.finish(offset, fileIdentifier);
  }
}
class Root {
  Root._(this._bc, this._bcOffset);
  factory Root(List<int> bytes) {
    fb.BufferContext rootRef = new fb.BufferContext.fromBytes(bytes);
    return reader.read(rootRef, 0);
  }

  static const fb.Reader<Root> reader = const _RootReader();

  final fb.BufferContext _bc;
  final int _bcOffset;

  UserTypeId get userType => new UserTypeId.fromValue(const fb.Uint8Reader().vTableGet(_bc, _bcOffset, 4, 0));
  dynamic get user {
    switch (userType?.value) {
      case 1: return ChangeUserName.reader.vTableGet(_bc, _bcOffset, 6, null);
      default: return null;
    }
  }
  PageTypeId get pageType => new PageTypeId.fromValue(const fb.Uint8Reader().vTableGet(_bc, _bcOffset, 8, 0));
  dynamic get page {
    switch (pageType?.value) {
      case 1: return MainPage.reader.vTableGet(_bc, _bcOffset, 10, null);
      case 2: return SettingsPage.reader.vTableGet(_bc, _bcOffset, 10, null);
      default: return null;
    }
  }

  @override
  String toString() {
    return 'Root{userType: $userType, user: $user, pageType: $pageType, page: $page}';
  }
}

class _RootReader extends fb.TableReader<Root> {
  const _RootReader();

  @override
  Root createObject(fb.BufferContext bc, int offset) => 
    new Root._(bc, offset);
}

class RootBuilder {
  RootBuilder(this.fbBuilder) {
    assert(fbBuilder != null);
  }

  final fb.Builder fbBuilder;

  void begin() {
    fbBuilder.startTable();
  }

  int addUserType(UserTypeId userType) {
    fbBuilder.addUint8(0, userType?.value);
    return fbBuilder.offset;
  }
  int addUserOffset(int offset) {
    fbBuilder.addOffset(1, offset);
    return fbBuilder.offset;
  }
  int addPageType(PageTypeId pageType) {
    fbBuilder.addUint8(2, pageType?.value);
    return fbBuilder.offset;
  }
  int addPageOffset(int offset) {
    fbBuilder.addOffset(3, offset);
    return fbBuilder.offset;
  }

  int finish() {
    return fbBuilder.endTable();
  }
}

class RootObjectBuilder extends fb.ObjectBuilder {
  final UserTypeId _userType;
  final dynamic _user;
  final PageTypeId _pageType;
  final dynamic _page;

  RootObjectBuilder({
    UserTypeId userType,
    dynamic user,
    PageTypeId pageType,
    dynamic page,
  })
      : _userType = userType,
        _user = user,
        _pageType = pageType,
        _page = page;

  /// Finish building, and store into the [fbBuilder].
  @override
  int finish(
    fb.Builder fbBuilder) {
    assert(fbBuilder != null);
    final int userOffset = _user?.getOrCreateOffset(fbBuilder);
    final int pageOffset = _page?.getOrCreateOffset(fbBuilder);

    fbBuilder.startTable();
    fbBuilder.addUint8(0, _userType?.value);
    if (userOffset != null) {
      fbBuilder.addOffset(1, userOffset);
    }
    fbBuilder.addUint8(2, _pageType?.value);
    if (pageOffset != null) {
      fbBuilder.addOffset(3, pageOffset);
    }
    return fbBuilder.endTable();
  }

  /// Convenience method to serialize to byte list.
  @override
  Uint8List toBytes([String fileIdentifier]) {
    fb.Builder fbBuilder = new fb.Builder();
    int offset = finish(fbBuilder);
    return fbBuilder.finish(offset, fileIdentifier);
  }
}